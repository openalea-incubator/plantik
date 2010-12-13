#!/usr/b    in/env python
#-*- coding: utf-8 -*-
"""

.. module:: leaf
    :synopsis: module dedicated to leaves
.. currentmodule:: openalea.plantik.biotik.leaf

.. topic:: summary

    A module dedicated to the leaves

    :Code: mature
    :Documentation: completed
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: leaf.py 9013 2010-05-27 09:06:13Z cokelaer $
    :Usage: >>> from vplants.plantik.biotik.leaf import *

.. testsetup::

    from vplants.plantik.biotik.leaf import *

"""
from vplants.plantik.biotik.collection import CollectionVariables, SingleVariable
from vplants.plantik.biotik.context import Context
from vplants.plantik.biotik.component import ComponentInterface
from vplants.plantik.biotik.growth import GrowthFunction
from vplants.plantik.tools.misc import title


class Leaf(ComponentInterface):
    r"""Specialised version of :class:`~openalea.plantik.biotik.component.ComponentInterface`
    dedicated to Leaves.

    .. warning:: 

        If the parameter store_data is True, then the :attr:`variables` attributes will store 
        the area, resource and age at each time step, which may be costly. It is set to false by
        default.

    :Example:

    >>> from vplants.plantik.biotik.leaf import *
    >>> i = Leaf(store_data=True, resource_per_day=1)
    >>> i.age.days
    0
    >>> i.variables.age.values
    [0]

    :Notation:

    * age of a leaf is denoted :math:`t_a^{(l)}`

    .. csv-table:: **Notation related to :class:`~openalea.plantik.biotik.leaf.Leaf`**
        :header: Name, symbol, default value
        :widths: 15,20,20
        
        optimal resource    , :math:`r_0^{(l)}`,
        area                , :math:`\mathcal{A}(t_a)`       , a user :class:`~openalea.plantik.biotik.growth.GrowthFunction`
        petiole_radius      , :math:`r_p`                    , 0.0005    meters
        area min            , :math:`S_{min}`                , 1. 10e-4  square meter    
        area max            , :math:`S_{max}`                , 30. 10e-4 square meter
        mass per area       , :math:`a`                       , 200 g/m^2 g per square meter
        efficiency          , ":math:`\mathcal{E}(t,t_a)`"     , see :meth:`leaf_efficiency`
        efficiency parameter, ":math:`t_1`"      , see :meth:`leaf_efficiency`
        efficiency parameter, :math:`t_2`"      , see :meth:`leaf_efficiency`
        growth rate         , :math:`\lambda^{(l)}`    , 1
        nu (logistic)       , :math:`\nu`       , 1
        maturation          , :math:`T_m^{(l)}`        , 21 days
    
    .. todo:: move area_min, area_max, mass_per_area as arguments
    
    """
    petiole_radius = 0.0005
    area_min = 1. * 0.01 * 0.01     # 1 cm^2 changed into  m^2
    area_max = 30 * 0.01 * 0.01
    mass_per_area = 220             # g/m^2
    def __init__(self, resource_per_day, birthdate=None, 
                 id=None, maturation=21, 
                 internode_vigor=1., livingcost=0., 
                 growth_rate=1, area_optimal=30*0.01*0.01,
                 growth_function='sigmoid', efficiency_method='unity', 
                 store_data=False, nu=1, t1=15, t2=150, angle=0.):
        """**Constructor**

        

        :param float resource_per_day: stricly positive , notation :math:`r_0`. 

        :param datetime.datetime birthdate:
        :param int id:
        :param float maturation: leaf maturation in days
        :param float internode_vigor: a leaf area is proportional to the internode length. 
            intenode_vigor of 1 means the internode had full length and therefore leaf has
            a potential for maximum area as well.
        :param float livingcost: zero by default
        :param float growth_rate: the :math:`lambda` parameter of the growth function
        :param str growth_function: a GrowthFunction method in ['linear', 'sigmoid', 'logistic']
        :param nu: shape of the logistic function is :attr:`growth_function` is logisitic
        :param efficiency_method: 'unity' or 'sigmoid' (default is unity)
        :param int store_data:
        :param float t1: parameter of the leaf_efficiency method
        :param float t2: parameter of the leaf_efficiency method
        
        
        :attributes:

            * :attr:`area`: the leaf area, a :meth:`~vplants.plantik.biotik.growth.GrowthFunction` 
              instance (read-only). The input parameters **growth_function**, **growth_rate**, **nu**,
              and **maturation** are used by this function.
            * Those inherited by :class:`~vplants.plantik.biotik.component.ComponentInterface`: 
              :attr:`age`,
              :attr:`allocated`,
              :attr:`demand`,
              :attr:`livingcost`,
              :attr:`~vplants.plantik.biotik.component.ComponentInterface.resource`.
            * :attr:`variables` is a :class:`CollectionVariables` instance containing the :attr:`age`, 
              :attr:`demand`, :attr:`resource`, :attr:`area`.
        """
        assert internode_vigor >= 0 and internode_vigor <= 1, \
            "internode vifor must be in [0,1]"
        assert resource_per_day > 0, \
            'resource_per_day must be positive otherwise noting will happen...'


        self.context = Context()
        ComponentInterface.__init__(self, label='Leaf', birthdate=birthdate, 
                                    id=id, state='growing')

        # leaf min must correspond to internode length min so that 
        # leafmaxarea>-leafminarea
        self._radius = Leaf.petiole_radius          # for geometry purpose only

        # set the area growth function
        self.area_max = Leaf.area_max * internode_vigor
        self._area = GrowthFunction(Leaf.area_min, self.area_max,
                                   maturation=maturation,  
                                   growth_rate=growth_rate,
                                   growth_function=growth_function, nu=nu)
        self._r0 = resource_per_day
        self.angle = angle

        # used for bookeeping only
        self.internode_vigor = internode_vigor        # in %
        self.maturation = maturation                  # in days

        # used by update()
        self.store_data = store_data

        # some variables to store.
        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', 
                                          values=[self.age.days]))
        self.variables.add(SingleVariable(name='resource', unit='biomass unit',
                                          values=[self.resource]))
        self.variables.add(SingleVariable(name='demand', unit='biomass unit',
                                          values=[self.demand]))
        self.variables.add(SingleVariable(name='area', unit='square meters',
                                          values=[self.area]))

        # parameters
        self.livingcost = livingcost         # cost to maintain leaf alive !!
        self.efficiency_method = efficiency_method

        # other attributes.
        # radius used by the interpretation of the lsystem. 
        #todo: move it elsewhere outsitde this class.
        self.father_radius = 0

        #others
        self.lg = 0.            # light interception 


        # related to leaf efficiency
        self._leaf_efficiency = 1.
        self.t1 = t1
        self.t2 = t2
        self.growth_rate = growth_rate

    def update(self, dt):
        """Update function

        This update function performs the following tasks:

        #. increment age by dt
        #. calls :meth:`demandCalculation`, :meth:`resourceCalculation` and 
           :meth:`computeLivingCost`
        #. store age into variables.age
        #. store resource into variables.resource
        #. store demand into variables.demand
        #. store area into variables.area if age< maturation

        :param float dt: in days

        
        """
        super(Leaf, self).update(dt)
        self.demandCalculation()
        self.resourceCalculation()
        self.computeLivingcost()

        if self.store_data is True:
            self.variables.age.append(self.age.days)
            self.variables.resource.append(self.resource)
            self.variables.demand.append(self.demand)
            if self.age.days < self.maturation:
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
        res += 't1                  = %s\n' % self.t1
        res += 't2                  = %s\n' % self.t2
        res += 'maturation          = %s\n' % self.maturation
        res += 'store_data          = %s\n' % self.store_data

        res += self._area.__str__()

        return res


    def demandCalculation(self, **kargs):
        """leaf has no demand"""
        self.demand = 0.
        return self.demand

    def resourceCalculation(self):
        r"""leaf resource is computed as follows:

        .. math::

            r(t,t_a) = r_0  \frac{ \mathcal{A}(t_a) }{ A_{\textrm{max}}}  \mathcal{E}(t,t_a)

        where :math:`\mathcal{E}(t)` is the leaf efficiency, :math:`\mathcal{A}`, the leaf
        area and :math:`\mathcal{A}_{\textrm{max}}` the area of a standard leaf and :math:`r_0`
        the resource of a standard leaf per day.. See :meth:`~vplants.plantik.biotik.leaf.leaf_efficiency`
        method. Since :math:`r_0` is a unit of resource per day, :math:`r(t)` is in unit of biomass per day

        """
        self.resource = self.r0 * self.area / Leaf.area_max
        self.resource *= self.leaf_efficiency()
        return self.resource 


    def leaf_efficiency(self):
        r"""simple senescence method made of two sigmoid of parameter t1, t2
        
        There are currently two methods: unity and sigmoid. The former returns
        1 whatsoever, while the latter returns the following quantity:
        
        .. math::
        
            \frac{1}{\left(1+\exp^{\lambda (t_1 - t_a)}\right) 
                \left(1+\exp^{\lambda (t_a - t_2)}\right)}

        where :math:`t_1` and :math:`t_2` are the sigmoids parameter and :math:`\lambda`
        is the growth rate parameter. 
        
        .. plot::            
            :include-source:

            from pylab import *
            from vplants.plantik.biotik.leaf import *
            b = Leaf(resource_per_day=1, store_data=True, efficiency_method='sigmoid')
            for v in range(1,200):
                b.update(1)
            b.plot('resource')
            grid(True)
            axvline(15,linewidth=3, color='red', alpha=0.5)
            axvline(150,linewidth=3, color='red', alpha=0.5)
        """
        if self.efficiency_method == 'unity':
            return 1.
        elif self.efficiency_method in ['logistic', 'sigmoid']:
            from pylab import exp
            return 1./(1+exp(self.growth_rate*(self.t1-self.age.days))) /\
                (1.+exp(self.growth_rate*(self.age.days-self.t2)))
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
        """plot demand, resource and area over time

        :param list variables: plot results related to the variables provided
        :param bool show: create but do not show the plot (useful for test, saving)
        :param  args: any parameters that pylab.plot would accept.

        .. plot::
            :include-source:

            from vplants.plantik.biotik.leaf import *
            b = Leaf(resource_per_day=1, store_data=True)
            for v in range(1,30):
                b.update(1)
            b.plot()

        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)
