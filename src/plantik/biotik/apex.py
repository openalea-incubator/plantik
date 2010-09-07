#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Apex module

.. module:: apex
    :synopsis: Apices functionalities and classes


.. topic:: Summary

    Apices functionalities and classes

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: fruit.py 8635 2010-04-14 08:48:47Z cokelaer $
    :Usage:
        >>> from openalea.plantik.biotik.apex import *

.. testsetup::

    from openalea.plantik.biotik.apex import *

"""

from openalea.plantik.biotik.collection import * 
from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.component import ComponentInterface
from openalea.plantik.biotik.growth import GrowthFunction
from math import pi, exp
from openalea.plantik.tools.misc import title



class Apex(ComponentInterface):
    """class dedicated to apex component.

    An apex is a biological objects that can produce other biological objects.
    As a biological component, it inherits attributes and methods
    from :class:`~openalea.plantik.biotik.component.ComponentInterface`.


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
        :param float height:
        :param int id: (default is 0)
        :param plastochron: (default is 3)
        :param vigor: (default is 0.1)
        :param store_data: used by :meth:`save_data_product` to save data at each 
           time step (default is False).
        :param float growth_threshold: a value between  0 and 1 allowing a 
            production once allocation is larger than this value

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

        .. todo:: finalise the doc (attributes) and cleaning up the code`
        """
        self.context = Context()
        ComponentInterface.__init__(self, label='Apex', birthdate=birthdate, id=id)


        # read-only attribute
        self.plastochron = plastochron      # time interval at which production of new biological object is possible
        self.metamer_cost = metamer_cost    # cost to produce new object (internode + new bud)
        self.demand = demand                # demand of the metamer in biomass unit/per time  unit


        self.store_data = store_data

        self._height = height
        self._vigor = vigor
        self._growth_threshold = growth_threshold

        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', values=[self.age.days]))
        self.variables.add(SingleVariable(name='height', unit='meters', values=[self.height]))
        self.variables.add(SingleVariable(name='demand', unit='biomass unit', values=[self.demand]))
        self.variables.add(SingleVariable(name='allocated', unit='biomass unit', values=[self.allocated]))
        self.variables.add(SingleVariable(name='vigor', unit='biomass unit', values=[self.vigor]))


        #read-write attributes
        self.livingcost = livingcost      # cost to maintain the apex alive
        self.initial_demand = demand

        # additional attributes
        self.current_plastochron = 0.   # keep track of the plastochron
        self.radius = 0.00 # for the pipe model
        self.growth_potential = 1   #?



        self.father_radius = 0.
        self.interruption = 0.              # time step during which an apex is not growing
        self.growing = False
        self.internodes_created = 0.        # count number of internodes created by this apex

        self.lg = 0.

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
        """A re-definition of ComponentsInterface.update method

        Calls :meth:`~openalea.plantik.biotik.component.ComponentsInterface.update`, then 
        it updates the :attr:`current_plastochron`, 
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

    def demandCalculation(self,  **kargs):
        """Compute the demand of an apex according to its context


        :param float alpha:
        :param float beta:
        :param float gamma:
        :param float delta:
        :param str context: order_height

        The order is denoted :math:`o`.
        The height is :math`p`.
        The age is :math`a`.

        .. math::

            \\frac{1}{(1+o)^\\alpha}

        .. math::

            \\frac{1}{(1+p)^\\beta}

        .. math::

            (\\frac{1}{1+exp^{+(0.03*(age-90.))}})^\gamma

        .. math::

            (vigor)^\delta
        """

        order_coeff = kargs.get("order_coeff", 0)
        height_coeff = kargs.get("heigth_coeff", 0)
        rank_coeff = kargs.get("rank_coeff", 0)
        age_coeff = kargs.get("age_coeff", 0)
        vigor_coeff = kargs.get("vigor_coeff", 0)
        context = kargs.get("context", "order_height")

        #todo refactoering switch model to context
        model = context
        assert model in ["none", "order_height_age",  "order_height"], 'check your config.ini file (model field)'
        order = self.context.order
        height = self.context.height
        rank = self.context.rank

        if model=="order_height":
            self.demand = self.initial_demand / float(order+1)**order_coeff / float(height)**height_coeff
            return self.demand
        elif model=="order_height_age":
            self.weight_order = 1./float(order+1)**order_coeff
            self.weight_height = 1./float(height+1)**height_coeff
            self.weight_rank = 1./float(rank+1)**rank_coeff
            self.weight_age = 1./(1+exp(+(0.03*(self.age.days-90.))))
            self.demand = self.initial_demand * self.weight_order * self.weight_height * self.weight_rank
            self.demand *= self.weight_age**age_coeff
            self.demand *= self.vigor**vigor_coeff

            return self.demand
        elif model=='none':
            # nothing to be done in the simple model
            return self.initial_demand

    def computeLivingcost(self):
        pass

    def resourceCalculation(self):
        assert self.resource == 0, "how come apex have some resource ? "
        return self.resource


    def plot(self, clf=True, show=True, symbol='-o'):
        import pylab

        height = self.variables.height.plot(show=False)[0]
        demand = self.variables.demand.plot(show=False)[0]
        allocated = self.variables.allocated.plot(show=False)[0]
        vigor = self.variables.vigor.plot(show=False)[0]

        pylab.plot(height.get_xdata(), height.get_ydata(), marker='o', color='b', label='Height')
        pylab.hold(True)
        pylab.plot(demand.get_xdata(), demand.get_ydata(), marker='o', color='g', label='Demand')
        pylab.plot(allocated.get_xdata(), allocated.get_ydata(), marker='o', color='r', label='allocated')
        pylab.plot(vigor.get_xdata(), vigor.get_ydata(), marker='o', color='c', label='vigor')
        pylab.plot([min(self.variables.age.values), max(self.variables.age.values)], 
            [self.growth_threshold, self.growth_threshold], color='m', label='threshold')
        pylab.legend()
        if show is True: pylab.show()


    def __str__(self):
        res = super(Apex, self).__str__()
        res += self.context.__str__()
        res += self.variables.__str__()
        res += title('other apex attributes. to be done')

        return res


    def plot_variables(self, variables=['demand', 'allocated'], show=True, grid=True, **args):
        """plot some results

        :param list variables: plot results related to the variables provided
        :param bool show: create but do not show the plot (useful for test, saving)
        :param  args: any parameters that pylab.plot would accept.
        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)
