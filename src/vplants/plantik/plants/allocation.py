#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""allocation module


.. module:: allocation
    :synopsis: allocation methods
.. currentmodule:: openalea.plantik.plants.allocation

.. topic:: summary

    allocation methods

    :Code: mature
    :Documentation: mature
    :Tests: 100%
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.plants.allocation import *

.. testsetup::

    from openalea.plantik.plants.allocation import *

"""


class Allocation():
    """Manage allocation model


    The following creates an lstring made of 3 apices. Then, an Allocation
    instance is create with a proportional model option. And, the allocation
    is computed, given a total resource of 6. We check that indeed, the 3
    apice got the same ratio of allocated resource (here 2.)  
    
    
    >>> from openalea.lpy import AxialTree, ParamModule
    >>> lstring = AxialTree()
    >>> for x in range(3):
    ...     A = ParamModule('A', Apex())
    ...     lstring.append(A)    
    >>> a = Allocation("proportional", 1)
    >>> a.compute_allocation(lstring, 6)
    6.0
    >>> lstring[0][0].allocated == 2.
    True
    >>> lstring[1][0].allocated == 2.
    True
    >>> lstring[2][0].allocated == 2.
    True
    
    See the following for more details.
    """

    def __init__(self, model, dt, sinks=['A'], perturbation=0.0):
        """**Constructor**

        :param str model: a model in ['proportional', 'proportional2', 'hierarchical']
        :param float dt: the time step in days (must be provided)
        :param perturbation: used to create some noisy demands.
        
        :Attributes:
            * From parameters
                * :attr:`model`
                * :attr:`perturbation`
                * :attr:`dt`
            * Others
                * :attr:`sinks`
                * :attr:`R`
                * :attr:`D`
                * :attr:`lstring`
                * :attr:`allocated`
        """

        self._model = model
        self._sinks = sinks
        self._dt = dt
        self._allocated = []
        self._R = 0
        self._D = 0
        self._lstring = None
        self._perturbation = perturbation


    def compute_allocation(self, lstring, R, **args):
        """Call the appropriate allocation methods

        Given the total resource **R** and **lstring**, compute the total
        demand **D** and allocate resource to each lstring component according
        to the allocation model.

        :param axialtree lstring:
        :param float R: the total demand
        :return: the total resources allocated to the different components.

        .. seealso:: :meth:`proportional`, 
            :meth:`~openalea.plantik.plants.allocation`
        """
        self.R = float(R)
        self._lstring = lstring

        if self.model == 'proportional':
            allocatedResources = self.proportional()
        elif self.model == 'proportional_test_without_min':
            allocatedResources = self.proportional2()
        elif self.model == 'hierarchical':
            allocatedResources = self.hierarchical(**args)
        else:
            raise ValueError("Model must be 'proportional', 'hierarchical' or 'proportional2'")

        return allocatedResources


    def computeTotalDemand(self):
        """Compute the total demand of all components found in the lstring

        The selection of components is amde according to the contents of 
        :attr:`sinks`, which is only apices by default!

        This method populated the :attr:`D` with the total demand.

        :return: nothing 

        """
        import numpy as np
        sinks = np.array([a[0] for a in self.lstring if a.name in self.sinks])
        demand = np.array([sink.demand for sink in sinks])
        self.D = float(np.sum(demand))

    def proportional(self):
        r"""Proportional model of allocation.

        #. The total resource **R** is provided as an attribute :attr:`R`.
        #. Compute the total Demand :math:`D(t, \Delta t)` using :meth:`computeTotalDemand()`.
        #. Compute individual allocation as follows: 
        #. Update the :attr`allocated` attribute within the lstring and returns total resource allocated.

        .. math::

            a(t, \Delta t) = \min (\tilde{d}_v (t, \Delta t) R(t), d_{0,v}(t)) \Delta t

        where

        .. math::

             \tilde{d}_v(t, \Delta t)  = \frac{d_v(t, \Delta t)}{D(t, \Delta t)}

        and :math:`d_v(t)` is the demand in unit of biomass per time unit.

        .. todo:: check equations for deltat
        """
        self.computeTotalDemand()
        self._allocated = []
        for a in self.lstring:
            if a.name in self.sinks:
                allocated = min(a[0].demand/self.D*self.R, a[0].initial_demand) * self.dt
                a[0].allocated += allocated
                self._allocated.append(allocated)
        return sum(self._allocated)


    def proportional2(self):
        """Same as :meth:`proportional` except for the minimum function.

        The minimum function is not used when computing the allocation resource.

        """
        self.computeTotalDemand()
        self._allocated = []
        for a in self.lstring:
            if a.name in self.sinks:
                allocated = a[0].demand/self.D*self.R * self.dt
                a[0].allocated += allocated
                self.allocated.append(allocated)
        if self.R <= sum(self._allocated):
            assert sum(self._allocated)==self.R
        return sum(self._allocated)


    def hierarchical(self):
        """

        If there is not enough resources and several component have 
        same demand, then there is an ambiguity: which one will get
        the resource allocated ?

        When performing a perturbation, shall we overwrite the demand values ? 


        .. todo:: check this and code below
        """
        from numpy import array, sum
        import numpy as np

        sink_indices = [x for x,y in enumerate(self.lstring) if y.name in self.sinks]
        sinks = array([a[0] for a in self.lstring if a.name in self.sinks])
        demand = array([sink.demand for sink in sinks])

        demand = demand * np.random.uniform(1.-self.perturbation,1.+self.perturbation,demand.size)
        # get the indices that would sort the demand array, but in reversed order (::-1)
        indices = demand.argsort()[::-1]
        saveR = self.R
        self._allocated = []


        for index in indices:
            allocated = min(self.R, self.lstring[int(sink_indices[int(index)])][0].initial_demand)
            self.R -= allocated
            self.lstring[int(sink_indices[int(index)])][0].allocated += allocated
            self._allocated.append(allocated)
            if self.R <=0:
                break

        return sum(self._allocated)




    def _getR(self):
        return self._R
    def _setR(self, R):
        self._R = R
    R = property(_getR, _setR, None, doc="getter/setter to total resource **R**.")

    def _getD(self):
        return self._D
    def _setD(self, D):
        self._D = D
    D = property(_getD, _setD, None, doc="getter/setter to total resource **D**.")

    def _getModel(self):
        return self._model
    model = property(_getModel, None, None, doc="getter to the allocation model.")

    def _getLstring(self):
        return self._lstring
    lstring = property(_getLstring, None, None, doc="getter to the lstring.")


    def _getAllocated(self):
        return self._allocated
    allocated = property(_getAllocated, None, None, doc="getter to allocated resource in each component.")

    def _getSinks(self):
        return self._sinks
    sinks = property(_getSinks, None, None, doc="getter to sinks labels.")
    
    def _getPerturbation(self):
        return self._perturbation
    perturbation = property(_getPerturbation, None, None, doc="getter to perturbation.")
    
    def _getdt(self):
        return self._dt
    dt = property(_getdt, None, None, doc="getter to delta time.")
