from math import pi
from random import random


class Allocation():

    def __init__(self, model, dt, sinks=['A'], perturbation=0.0):
        self.model = model
        self.sinks = sinks
        self.dt = dt
        self.allocated = []
        self.R = 0
        self.D = 0
        self.lstring = None
        self.perturbation = perturbation

    def _data_mining(self):
        pass

    def plot(self):
        #from pylab import plot, xlabel, ylabel, grid
        #plot(self.time, self.R, 'o', label='total resource')
        #xlabel('time(days)')
        #ylabel('resource in GU')
        #grid(True)
        pass

    def compute_allocation(self, lstring, R, **args):

        self.R = float(R)
        self.lstring = lstring
        if self.model == 'proportional':
            allocatedResources = self._proportional()
        elif self.model == 'proportional_test_without_min':
            allocatedResources = self._proportional2()
        elif self.model == 'hierarchical':
            allocatedResources = self._hierarchical(**args)
        else:
            raise ValueError('model can be proportional or hierarchical')
        return allocatedResources


    def compute_RD(self):
        import numpy as np
        sink_indices = [x for x,y in enumerate(self.lstring) if y.name in self.sinks]
        sinks = np.array([a[0] for a in self.lstring if a.name in self.sinks])
        demand = np.array([sink.demand for sink in sinks])
        D = float(np.sum(demand))
        self.D = D
        #do the perturbation once D is computed ? 
        demand = demand * np.random.uniform(1.-self.perturbation,1.+self.perturbation,demand.size)

    def _proportional(self):
        self.compute_RD()
        self.allocated = []
        for a in self.lstring:
            if a.name in self.sinks:
                allocated = min(a[0].demand/self.D*self.R, a[0].initial_demand) * self.dt
                a[0].allocated += allocated
                self.allocated.append(allocated)
        return sum(self.allocated)


    def _proportional2(self):
        self.compute_RD()
        self.allocated = []
        for a in lstring:
            if a.name in self.sinks:
                allocated = a[0].demand/D*R * self.dt
                a[0].allocated += allocated
                self.allocated.append(allocated)
        if self.R <= sum(self.allocated):
            assert sum(self.allocated)==self.R
        return sum(self.allocated)


    def _hierarchical(self):
        """

        if there is not enough resources and several component have 
        same demand, then there is an ambiguity: which one will be

        When performing a perturbation, shall we overwrite the demand values ? 
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
        self.allocated = []


        for index in indices:
            allocated = min(self.R, self.lstring[int(sink_indices[int(index)])][0].initial_demand)
            self.R -= allocated
            self.lstring[int(sink_indices[int(index)])][0].allocated += allocated
            self.allocated.append(allocated)
            if self.R <=0:
                break

        return sum(self.allocated)



