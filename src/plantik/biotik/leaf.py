#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""leaf module

.. module:: leaf
    :synopsis: module dedicated to leaves

.. topic:: summary

    A module dedicated to the leaves

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: leaf.py 9013 2010-05-27 09:06:13Z cokelaer $
    :Usage: >>> from openalea.plantik.biotik.leaf import *
    :References:

        1. Colin Smith, Costes Evelyne, On the Simulation of Apple Trees
           Using Statistical and Biomechanical Principles, INRIA
           technical report, 2007

.. testsetup::

    from openalea.plantik.biotik.leaf import *

"""
from openalea.plantik.biotik.collection import CollectionVariables, SingleVariable
from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.component import ComponentInterface
from openalea.plantik.biotik.growth import GrowthFunction
from math import pi
from openalea.plantik.tools.misc import title

import numpy
from scipy import interpolate
sigmoid = numpy.array([ 0.00247262,  0.00669285,  0.01798621,  0.04742587,  0.11920292,   0.26894142,  0.5       ,  0.73105858,  0.88079708,  0.95257413,  0.98201379,  0.99330715,  0.99752738])

days = numpy.array([0,1,2,3,4,5,6,7,8,9,10,11,12])


class Leaf(ComponentInterface):
    """Leaf class

    Specialised version of :class:`~openalea.plantik.biotik.component.ComponentInterface`
    dedicated to Leaves.

    .. warning:: 

        If the parameter store_data is True, then the :attr:`variables` attributes will store 
        the area, resource and age at each time step, which may be costly. It is set to false by
        default.

    :Example:

    >>> from openalea.plantik.biotik.leaf import *
    >>> i = Leaf(store_data=True)
    >>> i.age.days
    0
    >>> i.variables.age.values
    [0]

    :Notation:

    * area is denoted :math:`\mathcal{A}`
    * optimal resource produced by a leaf per day is denoted :math:`r_0`
    * efficiency of a leaf is denoted :math:`\mathcal{E}`. see :meth:`leaf_efficiency()`

    """
    petiole_radius = 0.0005
    area_min = 1. * 0.01 * 0.01     # 1 cm^2 changed into  m^2
    area_max = 30 * 0.01 * 0.01
    mass_per_area = 200             # g/m^2
    def __init__(self, birthdate=None, 
                 rank=1, order=0, path=1, id=None, maturation=21, 
                 internode_vigor=1., livingcost=0., resource_per_day=0., growth_rate=0.5,
                 growth_function='sigmoid', efficiency_method='unity', store_data=False, nu=1):
        """**Constructor**

        :param datetime.datetime birthdate:
        :param int rank:
        :param int order:
        :param int path:
        :param int id:
        :param float maturation: time before which leaf reach maturation (max length and area)
        :param int store_data:
        :param internode_vigor: a leaf area is proportional to the internode length. 
            intenode_vigor of 1 means the internode had full length. 
        :param livingcost:
        :param resource_per_day: the optimal resource produce by a leaf per day
        :param growth_function:
        :param nu: shape of the logistic function
        :param efficiency_method:

        :attributes:

            * those inherited by :class:`~openalea.plantik.biotik.component.ComponentInterface`: 
              :attr:`age`, :attr:`demand`, :attr:`birthdate`, ...
            * :attr:`variables` is a :class:`CollectionVariables` instance containing the :attr:`age`, 
        """
        assert internode_vigor>=0 and internode_vigor<=1, "internode vifor must be in [0,1]"
        assert resource_per_day >0, 'resource_per_day must be positive otherwise noting will happen...'


        self.context = Context(rank=rank, order=order, path=path)
        ComponentInterface.__init__(self, label='Leaf', birthdate=birthdate, id=id, state='growing')

        # leaf min must correspond to internode length min so that leafmaxarea>-leafminarea
        self._radius = Leaf.petiole_radius          # for geometry purpose only

        self._resource = resource_per_day
        self.current_resource = 0.
        self.growth_rate = 0.5
        self.radius_min = 0.0005
        # leaf min must correspond to internode length min so that leafmaxarea>-leafminarea

        self.area_max = Leaf.area_max * internode_vigor
        self._area = GrowthFunction(Leaf.area_min, self.area_max,
                                   maturation=maturation,  growth_rate=self.growth_rate,
                                   growth_function=growth_function)
        self._r0 = resource_per_day


        # used for bookeeping only
        self.internode_vigor = internode_vigor        # in %
        self.maturation = maturation                  # in days

        # used by update()
        self.store_data = store_data

        # some variables to store.
        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', values=[self.age.days]))
        self.variables.add(SingleVariable(name='resource', unit='biomass unit', values=[self.resource]))
        self.variables.add(SingleVariable(name='demand', unit='biomass unit', values=[self.demand]))
        self.variables.add(SingleVariable(name='area', unit='meters square', values=[self.area]))

        # parameters
        self.livingcost = livingcost              # cost to maintain leaf alive
        self.efficiency_method = efficiency_method

        # radius used by the interpretation of the lsystem. todo: move it elsewhere outsitde this class.
        self.father_radius = 0

        #others
        self.lg = 0.            # light interception 


        # related to leaf efficiency
        self._leaf_efficiency = 1.
        self.m1 = 15.
        self.m2 = 150

    def update(self, dt):
        """Update function

        This update function performs the following tasks:

        # increment age by dt
        # store age into variables.age
        # store resource into variables.resource
        # store demand into variables.demand
        # store area into variables.area if age< maturation

        :param float dt: 

        
        """
        super(Leaf, self).update(dt)
        if self.store_data is True:
            self.variables.age.append(self.age.days)
            self.variables.resource.append(self.resource)
            self.variables.demand.append(self.demand)
            if self.age.days< self.maturation:
                self.variables.area.append(self.area)



    def __str__(self):
        res = self.component_summary()
        res += self.context.__str__()
        res += title('other attributes')
        res += ' - demand=%s' % self._demand
        res += ' - resource=%s' % self.resource
        res += ' - allocated=%s' % self._allocated
        res += ' - livingcost=%s' % self._livingcost

        return res


    """
        def demandCalculation(self):
        if self.age<leaf.maturation:
            demand_per_area = 1./leaf.max_area
            self.demand = self.area * demand_per_area * leaf_coeff # maximum is therefore less than 1
        else:
            self.demand = 0
        return self.demand


    """
    def demandCalculation(self, **kargs):
        """leaf has no demand"""
        self.demand =0.
        return self.demand

    def resourceCalculation(self):
        r"""leaf resource is computed as follows:

        .. math::

            r(t) = r_0 * \mathcal{A} / \mathcal{A_{\textrm{max}}} * \mathcal{E}(t)

        where :math:`\mathcal{E}(t)` is the leaf efficiency. See :meth:`~openalea.plantik.biotik.leaf.leaf_efficiency`
        method. Since :math:`r_0` is a unit of resource per day, :math:`r(t)` is in unit of biomass per day


        """
        #self.resource = self.r0 * self.area / self.area_max
        #self.resource *= self.leaf_efficiency(self.age.days, self.efficiency_method, self.m1, self.m2)
        #return self.resource
        self.current_resource = self.resource * self.area / self.area_max * self.leaf_efficiency()
        return self.current_resource 


    def leaf_efficiency(self):
        """simple senescence function

        .. warning:: right now it only depends on the age, not on the season..

        .. plot::
            :width: 50%
            :include-source:


            from pylab import *
            from openalea.plantik.biotik.leaf import *
            x = linspace(0,200)
            plot(x, Leaf.leaf_efficiency(x, 'logistic', 15, 150))


        """
        if self.efficiency_method == 'unity':
            return 1.
        elif self.efficiency_method == 'sigmoid':
            from math import exp
            return 1./(1+exp(0.5*(self.m1-self.age.days))) / (1.+exp(0.3*(self.age.days-self.m2)))
    
    def __setstate__(self, data):
        self.__dict__.update(data)

    def _compute_livingcost(self):
        pass

    def _getMass(self):
        return Leaf.mass_per_area * self.area
    mass = property(_getMass, None, None, doc="returns the leaf mass in g per m^2")

    # the petiole radius does not change, so no setter
    def _getRadius(self):
        return self._radius
    radius = property(_getRadius, None, None, doc="petiole radius")

    def _getArea(self):
        return self._area.growthValue(self.age.days)
    area = property(_getArea, None, None, doc="leaf area")
    
    def _getR0(self):
        return self._r0
    r0 = property(_getR0, None, None, doc="optimal resource per day")

    def plot(self, variables=['demand', 'resource', 'area'], show=True, grid=True, **args):
        """plot some results

        :param list variables: plot results related to the variables provided
        :param bool show: create but do not show the plot (useful for test, saving)
        :param  args: any parameters that pylab.plot would accept.

        .. plot::
            :width: 50%
            :include-source:

            from openalea.plantik.biotik.leaf import *
            b = Leaf(store_data=True)
            for v in range(1,30):
                b.update(1)
            b.plot('area')

        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)
