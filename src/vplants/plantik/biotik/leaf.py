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
    >>> i = Leaf(store_data=True, resource_per_day=1)
    >>> i.age.days
    0
    >>> i.variables.age.values
    [0]

    :Notation:

    * area is denoted :math:`\mathcal{A}`
    * optimal resource produced by a leaf per day is denoted :math:`r_0`
    * efficiency of a leaf is denoted :math:`\mathcal{E}`. see :meth:`leaf_efficiency()`

    =================   ==================  ===================
    =================   ==================  ===================
    petiole_radius      0.0005              meters
    area min            1. 10e-4            meters square
    area max            30. 10e-4           meters square
    mass per area       200 g/m^2           g per meters square
    =================   ==================  ===================
    """
    petiole_radius = 0.0005
    area_min = 1. * 0.01 * 0.01     # 1 cm^2 changed into  m^2
    area_max = 30 * 0.01 * 0.01
    mass_per_area = 200             # g/m^2
    def __init__(self, birthdate=None, 
                 id=None, maturation=21, 
                 internode_vigor=1., livingcost=0., resource_per_day=0., growth_rate=0.5,
                 growth_function='sigmoid', efficiency_method='unity', store_data=False, nu=1):
        """**Constructor**

        Compulsary parameter is `resource_per_day`, that should be stricly positive.

        :param datetime.datetime birthdate:
        :param int id:
        :param float maturation: time before which leaf reach maturation
        :param float internode_vigor: a leaf area is proportional to the internode length. 
            intenode_vigor of 1 means the internode had full length and therefore leaf has
            a potential for maximum area as well.
        :param float livingcost:
        :param float resource_per_day: the optimal resource produce by a standard leaf per day
        :param float growth_rate:
        :param str growth_function: in ['linear', 'sigmoid', 'logistic']
        :param nu: shape of the logistic function
        :param efficiency_method: 'unity' or 'sigmoid'
        :param int store_data:
        :param nu: shape of the logistic function

        :attributes:

            * :attr:`area`: the leaf area, a :meth:`~openalea.plantik.biotik.growth.GrowthFunction` 
              instance (read-only). The input parameters **growth_function**, **growth_rate**, **nu**,
              and **maturation** are used by this function.
            * Those inherited by :class:`~openalea.plantik.biotik.component.ComponentInterface`: 
              :attr:`~openalea.plantik.biotik.component.ComponentInterface.age`,
              :attr:`~openalea.plantik.biotik.component.ComponentInterface.allocated`,
              :attr:`~openalea.plantik.biotik.component.ComponentInterface.demand`,
              :attr:`~openalea.plantik.biotik.component.ComponentInterface.livingcost`,
              :attr:`~openalea.plantik.biotik.component.ComponentInterface.resource`.
            * :attr:`variables` is a :class:`CollectionVariables` instance containing the :attr:`age`, 
              :attr:`demand`, :attr:`resource`, :attr:`area`.
        """
        assert internode_vigor>=0 and internode_vigor<=1, "internode vifor must be in [0,1]"
        assert resource_per_day >0, 'resource_per_day must be positive otherwise noting will happen...'


        self.context = Context()
        ComponentInterface.__init__(self, label='Leaf', birthdate=birthdate, id=id, state='growing')

        # leaf min must correspond to internode length min so that leafmaxarea>-leafminarea
        self._radius = Leaf.petiole_radius          # for geometry purpose only

        # set the area growth function
        self.area_max = Leaf.area_max * internode_vigor
        self._area = GrowthFunction(Leaf.area_min, self.area_max,
                                   maturation=maturation,  growth_rate=growth_rate,
                                   growth_function=growth_function, nu=nu)
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
        self.livingcost = livingcost              # cost to maintain leaf alive !!
        self.efficiency_method = efficiency_method

        # other attributes.
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

        #. increment age by dt
        #. store age into variables.age
        #. store resource into variables.resource
        #. store demand into variables.demand
        #. store area into variables.area if age< maturation

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
        res = super(Leaf, self).__str__()
        res += self.context.__str__()
        res += self.variables.__str__()
        res += title('other leaf attributes')

        res += 'area                = %s\n' % self.area
        res += 'leaf_efficiency     = %s\n' % self.leaf_efficiency
        res += 'r0                  = %s\n' % self.r0
        res += 'radius              = %s\n' % self.radius
        res += 'area_max            = %s\n' % self.area_max
        res += 'efficiency_method   = %s\n' % self.efficiency_method
        res += 'father_radius       = %s\n' % self.father_radius
        res += 'internode_vigor     = %s\n' % self.internode_vigor
        res += 'lg                  = %s\n' % self.lg
        res += 'm1                  = %s\n' % self.m1
        res += 'm2                  = %s\n' % self.m2
        res += 'maturation          = %s\n' % self.maturation
        res += 'store_data          = %s\n' % self.store_data

        res += self._area.__str__()

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

    def resourceCalculation(self, test=None):
        r"""leaf resource is computed as follows:

        .. math::

            r(t) = r_0 * \mathcal{A} / \mathcal{A_{\textrm{max}}} * \mathcal{E}(t)

        where :math:`\mathcal{E}(t)` is the leaf efficiency, :math:`\mathcal{A}`, the leaf
        area and :math:`\mathcal{A}_{\textrm{max}}` the area of a standard leaf and :math:`r_0`
        the resource of a standard leaf per day.. See :meth:`~openalea.plantik.biotik.leaf.leaf_efficiency`
        method. Since :math:`r_0` is a unit of resource per day, :math:`r(t)` is in unit of biomass per day


        """

        #self.resource *= self.leaf_efficiency(self.age.days, self.efficiency_method, self.m1, self.m2)
    
        # buggy version where all leaves whatever size produce at max r0
        if test=='buggy':
           self.resource = self.r0 * self.area / self.area_max
        else:
            self.resource = self.r0 * self.area / Leaf.area_max
        self.resource *= self.leaf_efficiency()
        return self.resource 


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
        elif self.efficiency_method in ['logistic', 'sigmoid']:
            from pylab import exp
            return 1./(1+exp(0.5*(self.m1-self.age.days))) / (1.+exp(0.3*(self.age.days-self.m2)))
        else:
            raise ValueError('efficiency_method must be either unity or sigmoid (config.ini file)')

    def computeLivingcost(self):
        return self.livingcost

    def _getMass(self):
        return Leaf.mass_per_area * self.area
    mass = property(_getMass, None, None, doc="returns the leaf mass in g per m^2")

    # the petiole radius does not change, so no setter
    def _getRadius(self):
        return self._radius
    radius = property(_getRadius, None, None, doc="petiole radius")

    def _getArea(self):
        return self._area.growthValue(self.age.days)
    area = property(_getArea, None, None, doc="getter to the leaf area.")

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
