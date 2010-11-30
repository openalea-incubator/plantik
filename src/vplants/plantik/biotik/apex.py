#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Apex module

.. module:: apex
    :synopsis: Apices functionalities and classes
.. currentmodule:: openalea.plantik.biotik.apex


.. topic:: Summary

    Apices functionalities and classes

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: fruit.py 8635 2010-04-14 08:48:47Z cokelaer $
    :Usage:
        >>> from vplants.plantik.biotik.apex import *

.. testsetup::

    from vplants.plantik.biotik.apex import *

"""

from vplants.plantik.biotik.collection import SingleVariable, CollectionVariables 
from vplants.plantik.biotik.context import Context
from vplants.plantik.biotik.component import ComponentInterface
from vplants.plantik.biotik.growth import GrowthFunction
from math import pi, exp
from vplants.plantik.tools.misc import title



class Apex(ComponentInterface):
    r"""class dedicated to apex component.

    An apex is a biological objects that can produce other biological objects.
    As a biological component, it inherits attributes and methods
    from :class:`~vplants.plantik.biotik.component.ComponentInterface`.

    :Example:

    >>> from vplants.plantik.biotik.apex import Apex
    >>> i = Apex(store_data=True)
    >>> i.age.days
    0
    
    :Notation:

    * age of an apex is denoted :math:`t_a`

    .. csv-table:: **Notation related to** :class:`~openalea.plantik.biotik.apex.Apex`
        :header: Name, symbol, default value
        :widths: 15,20,20
        
        optimal demand      , :math:`d^{(a)_0}`     , 2 UR
        plastochron         , :math:`T^{(a)}_p`     , 3 days
        growth threshold    , :math:`\lambda`       , 0.2
        metamer cost        , :math:`m_{\rm cost}`  , 2 UR
        living cost         ,-                      , 0
        vigor               ,-                      , 0.1

    """
    def __init__(self, birthdate=None, 
                 demand=2, metamer_cost=2, livingcost=0.,
                 height=0., id=0, plastochron=3., growth_threshold = 0.2,
                 vigor=0.1, store_data=False):
        """**Constructor**

        :param datetime.datetime birthdate: (default is None)
        :param float demand:  (default is 2)
        :param float metamer_cost:    (default is 2)
        :param float livingcost: (default is 0)
        :param float height:   (default is 0)
        :param int id: (default is 0)
        :param plastochron: (default is 3)
        :param float growth_threshold: a value between  0 and 1 allowing a 
            production once allocation is larger than this value
        :param vigor: (default is 0.1)
        :param store_data: used by :meth:`save_data_product` to save data at each 
           time step (default is False).

        Additional attributes 

        :attributes:
            * :attr:`current_plastochron`:
            * :attr:`radius`:  (default is 0)
            * :attr:`growth_potential`:  (default is 1)
            * :attr:`interruption`: time step during which an apex is not growing (default is 0.)
            * :attr:`growing` (default is False)
            * :attr:`father_radius`  (default is 0.)
            * :attr:`lg`: used to store light interception
            * :attr:`internodes_created`  keep track of the number of internodes created by this
                apex (default is 0.).

        """
        self.context = Context()
        ComponentInterface.__init__(self, label='Apex', birthdate=birthdate, 
                                    id=id)


        # read-only attribute
        self.plastochron = plastochron      # time interval at which production of new biological object is possible
        self.metamer_cost = metamer_cost    # cost to produce new object (internode + new bud)
        self.demand = demand                # demand of the metamer in biomass unit/per time  unit


        self.store_data = store_data

        self._height = height
        self._vigor = vigor
        self._growth_threshold = growth_threshold

        self.lg = 0.14
        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', 
                                          values=[self.age.days]))
        self.variables.add(SingleVariable(name='height', unit='meters', 
                                          values=[self.height]))
        self.variables.add(SingleVariable(name='demand', unit='biomass unit', 
                                          values=[self.demand]))
        self.variables.add(SingleVariable(name='allocated', unit='biomass unit', 
                                          values=[self.allocated]))
        self.variables.add(SingleVariable(name='vigor', unit='biomass unit', 
                                          values=[self.vigor]))
        self.variables.add(SingleVariable(name='lg', unit='arbitrary', 
                                          values=[self.lg]))


        #read-write attributes
        self.livingcost = livingcost      # cost to maintain the apex alive
        self.initial_demand = demand

        # additional attributes
        self.current_plastochron = 0.   # keep track of the plastochron
        self.radius = 0.00 # for the pipe model
        self.growth_potential = 1   #?



        self.father_radius = 0.
        self.interruption = 0.   # time step during which an apex is not growing
        self.growing = False
        self.internodes_created = 0.        # count number of internodes created by this apex

        self.lg = 0.14

        self.type = 'Apex' #apex or meristem

    def _getHeight(self):
        return self._height
    def _setHeight(self, height):
        self._height = height
    height = property(_getHeight, _setHeight, None, doc="getter/setter to distance between apex and root")

    def _getGrowthThreshold(self):
        return self._growth_threshold
    growth_threshold = property(_getGrowthThreshold, None, None, doc="getter to growth threshold")

    def _getVigor(self):
        return self._vigor
    def _setVigor(self, vigor):
        self._vigor = vigor
    vigor = property(_getVigor, _setVigor, None, doc="getter/setter to distance between apex and root")

    def update(self, dt):
        """Update function

        This update function performs the following tasks:

        #. increment age by dt
        #. increment plastochron by dt
        #. increment interruption time by dt

        #. calls :meth:`demandCalculation`, :meth:`resourceCalculation` and 
           :meth:`computeLivingCost`

        #. store age into variables.age
        #. store height into variables.height
        #. store demand into variables.demand
        #. store allocated into variables.allocated
        #. store vigor into variables.vigor
        #. store d2a into variables.d2a

        :param float dt: 
        """
        super(Apex, self).update(dt)
        self.current_plastochron += dt
        self.interruption += dt

        if self.store_data is True:
            self.variables.age.append(self.age.days)
            self.variables.height.append(self.height)
            self.variables.demand.append(self.demand)
            self.variables.allocated.append(self.allocated)
            self.variables.vigor.append(self.vigor)
            self.variables.lg.append(self.lg)

        """if self.allocated > 0 and self.current_plastochron==self.plastochron:
            if self.growing == True:
                self.vigor += 0.05
                if self.vigor>=1:
                    self.vigor = 1.
            else:
                self.vigor -=0.05
                if self.vigor <=0:
                    self.vigor =0.05
        """

        if self.current_plastochron == self.plastochron:
            #check if the apex got some resource even tough it does not grow.
            if self.allocated>0:
                self.vigor += 0.05
                if self.vigor>=1:
                    self.vigor = 1.
            else:
                self.vigor -=0.05
                if self.vigor <=0:
                    self.vigor =0.05
    



    def demandCalculation(self,  **kargs):
        r"""Compute the demand of an apex according to its context


        :param float context: order_height :math:`\alpha_o`
        :param float context: height_height :math:`\alpha_h`
        :param float context: rank_height :math:`\alpha_r`
        :param float context: age_height :math:`\alpha_a`
        :param float context: vigor_height :math:`\alpha_v`

        The order is denoted :math:`o`.
        The height is :math`h`.
        The rank is :math`r`.
        The age is :math`a`.
        The satisfaction is :math`v`.

        .. math::

                d = d_0 \mathcal{O} \mathcal{H} \mathcal{R} \mathcal{A} \mathcal{V}

        .. math::

            \mathcal{O} = \frac{1}{(1 + o)^{\alpha_o}}

        .. math::

            \mathcal{H} = \frac{1}{(1+h)^{\alpha_h}}

        .. math::

            \mathcal{R} = \frac{1}{(1+r)^{\alpha_r}}

        .. math::

            \mathcal{A} = (\frac{1}{1+exp^{+(0.03*(age-90.))}})^{\alpha_a}

        .. math::

            \mathcal{V} = (vigor)^{\alpha_v}
        """

        order_coeff = kargs.get("order_coeff", 0)
        height_coeff = kargs.get("height_coeff", 0)
        rank_coeff = kargs.get("rank_coeff", 0)
        age_coeff = kargs.get("age_coeff", 0)
        vigor_coeff = kargs.get("vigor_coeff", 0)
        d2a_coeff = kargs.get("d2a_coeff", 0)
        context = kargs.get("context", "order_height")

        #todo refactoering switch model to context
        model = context
        assert model in ["none", "order_height", "additive", "multiplicative"],\
            'check your config.ini file (model field) %s provided ' % model
        order = self.context.order
        height = self.context.height
        rank = self.context.rank
        d2a = self.context.d2a

        if model=="order_height":
            self.demand = self.initial_demand / float(order+1)**order_coeff / float(height)**height_coeff
            return self.demand
        elif model=='none':
            # nothing to be done in the simple model
            return self.initial_demand
        elif model =='additive' or model == 'multiplicative':
            self.demand = self.initial_demand
            weight = self.context.get_context_weight(model=model, order_coeff=order_coeff,
                height_coeff=height_coeff, rank_coeff=rank_coeff, d2a_coeff=d2a_coeff)

            #if age_coeff>=0:
            w1 = (2 - 2./(1.+exp(-age_coeff * self.age.days)))
            #else:
            #     w1 =  2./(1.+exp(age_coeff*self.age.days))-1.
            #assert w1<=1
            #if vigor_coeff>=0:
            w2 = (2 - 2./(1.+exp(-vigor_coeff * self.age.days)))
            #else:
            #     w2 =  2./(1.+exp(vigor_coeff*self.age.days))-1.
            #assert w2<=1

            if model == 'additive':
                weight = (weight +w1 +w2)/12.
                assert weight >=0 and weight<=1.
            elif model == 'multiplicative':
                weight = weight * w1 * w2
                assert weight >=0 and weight<=1.

            self.demand =  self.initial_demand * (weight)
            self.demand *= min(1., self.lg/0.04)
            return self.demand
 


    def computeLivingcost(self):
        pass

    def resourceCalculation(self):
        """Apices returns resource equals zero"""
        assert self.resource == 0, "how come apex have some resource ? "
        return self.resource


    def plot(self, clf=True, show=True, symbol='-o'):
        """Plot internal state variables such as demand and allocated resource

        .. plot::

            from pylab import *
            from openalea.plantik.biotik.apex import Apex
            a = Apex(store_data=True)
            [a.update(1) for x in range(10)]
            a.plot()

        """
        import pylab

        height = self.variables.height.plot(show=False)[0]
        demand = self.variables.demand.plot(show=False)[0]
        allocated = self.variables.allocated.plot(show=False)[0]
        vigor = self.variables.vigor.plot(show=False)[0]

        pylab.plot(height.get_xdata(), height.get_ydata(), marker='o', 
                   color='b', label='Height')
        pylab.hold(True)
        pylab.plot(demand.get_xdata(), demand.get_ydata(), marker='o', 
                   color='g', label='Demand')
        pylab.plot(allocated.get_xdata(), allocated.get_ydata(), marker='o', 
                   color='r', label='allocated')
        pylab.plot(vigor.get_xdata(), vigor.get_ydata(), marker='o', 
                   color='c', label='vigor')
        pylab.plot([min(self.variables.age.values), max(self.variables.age.values)], 
            [self.growth_threshold, self.growth_threshold], color='m', 
            label='threshold')
        pylab.legend()
        if show is True: pylab.show()


    def __str__(self):
        res = super(Apex, self).__str__()
        res += self.context.__str__()
        res += self.variables.__str__()
        res += title('other apex attributes. to be done')

        return res


    def plot_variables(self, variables=['demand', 'allocated'],
                       show=True, grid=True, **args):
        """plot some results

        :param list variables: plot results related to the variables provided
        :param bool show: show plot or not (default is True). Useful for testing, saving
        :param bool grid: set grid on or off (default True)
        :param args: any parameters that pylab.plot would accept.
        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)
