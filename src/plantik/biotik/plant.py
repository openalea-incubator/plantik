#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""plant module

.. module plant
    :synopsis: class to manage a whole plant evolution over time


.. topic:: Summary

    class to manage a whole plant evolution over time

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:  >>> from openalea.plantik.biotik.plant import *

.. testsetup::

    from openalea.plantik.biotik.plant import *
    from openalea.plantik import get_shared_data, ReadConfigFile
    options = ReadConfigFile(get_shared_data('pruning.ini'))

"""
from openalea.plantik.biotik.collection import *




class Plant(object):
    """A simple data structure that is used to store simulation data products

    Store the simulation parameters as well as variables that change over time
    such as the number of apices versus time

    This class should be used with a lsystem.lpy file

    """
    def __init__(self, time_step, options=None, revision=None, pipe_fraction=1., filename=None):
        """
        :param pipe_fraction: cost of the pipe model is metamer_growth volume times the
          pipe_fraction parameter
        :param str revision: store the SVN revision of the lpy file
        :param options: the options from the config.ini file
        :param filename:  if None, populated attribute :attr:`filename` with 'vplants' + options.general.tag

            >>> from openalea.plantik import get_shared_data, ReadConfigFile, Plant
            >>> options = ReadConfigFile(get_shared_data('pruning.ini'))
            >>> plant = Plant(options, revision=1)

        :Attributes:

            * :attr:`revision` :
            * :attr:`options`  :
            * :attr:`lstring`  :
            * :attr:`time`  :
        
        .. todo:: clean up all other variables that could be extracted from the lstring ?
        """
        # set the filename
        if filename == None:
            self.filename = 'plant'
        else:
            self.filename = filename

        # add a tag
        try:
            tag = options.general.tag
            self.filename += '_' + tag
        except:
            pass

        #: used to store the lpy revision if neeeded
        self._revision = revision 
        self._options = options
        #: used to store the final lstring if neeeded
        self._lstring = None
        #: read only time array
        self._time = []


        self.dt = time_step

        self.D = 0
        self.R = options.root.initial_resource
        self.reserve = []   # resource sent into the reserve at each step
        self.RESERVE = []   # total reserve
        self.C = 0
        self.A = 0
        self.allocated = []



        self.mtg = None


        self.duration = 0       # used to store the duration of the simulation
        self.apex = {'demand':[], 'allocated':[], 'height':[], 'age':[]} # keeps track of the main apex characteristics
        self.all = {'age':[], 'order':[], 'height':[]}

        self.dv = 0
        #: description of pipe_fraction
        self.pipe_fraction = pipe_fraction
        self.pipe_ratio_v = [0.]
        self.radius = 0


        #: a CollectionVariable instance that containes the count of **apices**, **internodes**, **leaves**
        #: **branches** and growth units (denoted **gus**) at each time step. For instance, to acces to apices counter::
        #:
        #: >>> plant.counter.apices.values
        self.counter = CollectionVariables()
        self.counter.add(SingleVariable(name='apices', unit=r'#', values=[]))
        self.counter.add(SingleVariable(name='internodes', unit=r'#', values=[]))
        self.counter.add(SingleVariable(name='leaves', unit=r'#', values=[]))
        self.counter.add(SingleVariable(name='branches', unit=r'#', values=[]))
        self.counter.add(SingleVariable(name='gus', unit=r'#', values=[]))

        #: a CollectionVariable instance that contains the demand (D), allocated resources(R), 
        #: resources (R) and cost (C) at each time step. To acces to demand over time::
        #:
        #: >>> plant.DARC.apices.values
        self.DARC = CollectionVariables()
        self.DARC.add(SingleVariable(name='D', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='A', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='R', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='C', unit='biomass unit', values=[]))


    def __str__(self):
        res = "R:" + str(self.R) + "\n"
        res += "D:" + str(self.D) + "\n"
        res += "C:" + str(self.C) + "\n"
        return res




    def plot_DARC(self, show=True, normalised=False, savefig=False):
        """plotting dedicated to the :attr:`DARC` attribute.
        
        :param bool show: 
        :param bool savefig: 
        :param bool normalised: normalise the quantity D, A, R, C by R (total resource)

        .. plot::
            :include-source:
            :width: 50%

            from openalea.plantik.biotik.plant import *
            from openalea.plantik import get_shared_data, ReadConfigFile
            options = ReadConfigFile(get_shared_data('pruning.ini'))
            plant = Plant(options)
            for x in range(100):
                plant.DARC.D.append(x**0.5)
                plant.DARC.A.append(x**0.3)
                plant.DARC.R.append(x**0.4)
                plant.DARC.C.append(x**0.3)
                plant._time.append(x)
            plant.plot_DARC()


        """
        import pylab
        import numpy
        pylab.rcParams['text.usetex'] = True

        fig = pylab.figure()
        pylab.clf()
        if normalised == True:
            norm = numpy.array(self.R)
        else:
            norm = 1.
        T = numpy.array(self.time)
        D = numpy.array(self.DARC.D.values)
        A = numpy.array(self.DARC.A.values)
        R = numpy.array(self.DARC.R.values)
        C = numpy.array(self.DARC.C.values)

        pylab.plot(T, D/norm, '-ob',label="Total demand")
        pylab.hold(True)
        pylab.plot(T, A/norm, '-.sr',label="Total allocation")
        pylab.plot(T, R/norm, '-xg', label='Total resource')
        pylab.plot(T, C/norm, '-.', label='Total cost')
        pylab.plot(T, (C+A)/norm, '-', label='Total cost + allocation')
        pylab.xlabel('Time (days)')
        pylab.ylabel(r'\#')
        pylab.legend(loc='best')
        pylab.grid(True)
        if show: pylab.show()
        if savefig: pylab.savefig(self.filename + "_DARC.png")


    def plot_counter(self, show=True, savefig=False):
        """ plotting dedicated to counter

        :param bool show: 
        :param bool savefig: 

        .. plot::
            :include-source:
            :width: 50%

            from openalea.plantik.biotik.plant import *
            from openalea.plantik import get_shared_data, ReadConfigFile
            options = ReadConfigFile(get_shared_data('pruning.ini'))
            plant = Plant(options)
            for x in range(100):
                plant.counter.apices.append(x**0.5)
                plant.counter.leaves.append(x**0.35)
                plant.counter.internodes.append(x**0.4)
                plant.counter.branches.append(x**0.3)
                plant._time.append(x)
            plant.plot_counter()

        """
        import pylab
        pylab.rcParams['text.usetex'] = True
        fig = pylab.figure()
        pylab.clf()

        pylab.semilogy(self.time, self.counter.apices.values, label='Apex number')
        pylab.hold(True)
        try:pylab.semilogy(self.time, self.counter.internodes.values, label='Internode number')
        except:pass
        try:pylab.semilogy(self.time, self.counter.leaves.values, label='Leaves number')
        except:pass
        try:pylab.semilogy(self.time, self.counter.branches.values, label='branches')
        except:pass
        try:pylab.semilogy(self.time, self.counter.gus.values, label='gu')
        except:pass
        pylab.xlabel('Time (days)')
        pylab.ylabel(r'\#')
        pylab.legend(loc='best')
        pylab.grid(True)
        if show:  pylab.show()
        if savefig: pylab.savefig(self.filename + "_counter.png")


    def plot(self, normalised=False):
        self.plot_counter()
        self.plot_DARC(normalised=normalised)
        self.mtg_plot_example()


    def update_counter(self, lstring):
        """Parse the lstring attribute and count the number of elements to update the :attr:`counter` attribute.

        .. warning:: you should use the :meth:`update` to call this function. Indeed, if you only call this function,
            other variables such as the :attr:`time` will not be updated at the same time leading to future errors in 
            plotting for instance.!!

        """
        import inspect
        if inspect.stack()[1][3] != 'update':
            import warnings
            warnings.warn('You should not call Plant.update_counter directly but via the update() method. See docstring.')
        self.counter.apices.append(lstring.count('A'))
        self.counter.internodes.append(lstring.count('I'))
        self.counter.leaves.append(lstring.count('L'))
        self.counter.branches.append(lstring.count('B'))
        self.counter.gus.append(lstring.count('U'))

    def update(self, time_elapsed, lstring):
        self.D = 0.
        if self.options.misc.reset_resource:
            self.R = 0.

        self.C = 0.
        self.dV = 0.
        #print self.options.context.order_coeff
        for elt in lstring:
            if elt.name in ['R', 'A', 'I', 'L']:
                self.C += elt[0].livingcost
                self.D += elt[0].demandCalculation(
                                    context=self.options.context.model,
                                    alpha=self.options.context.order_coeff,
                                    beta=self.options.context.height_coeff,
                                    delta=self.options.context.vigor_coeff,
                                    gamma=self.options.context.age_coeff)
                self.R += elt[0].resourceCalculation()
            if elt.name in ['I']:
                self.dV += elt[0].dvolume / (1./elt[0].cost_per_metamer)
        self.D *= self.dt
        self.R *= self.dt
        self.C *= self.dt


        self.DARC.D.append(self.D)
        self.DARC.R.append(self.R)
        self.DARC.C.append(self.C)
        # substract the living cost from the total resource.
        if self.C > self.R:
            self.R = 0.
        else:
            self.R -= self.C

        # get fraction of resource allocated to pipe construction
        if self.dV < 0.1:
            self.dV = 0
        if self.dV > 0:
            # ratio of available resource
            pipe_ratio = (self.R ) / self.dV
        else:
            pipe_ratio = 0.
        #print 'dv=',self.dV
        #print 'pipe ratio=', pipe_ratio
        #print 'R=',self.R

        self.pipe_ratio_v.append(pipe_ratio)
        if self.dV != 0:
            if pipe_ratio > 1:
                pipe_ratio = 1
        #print 'target pipe fraction=',self.pipe_fraction
        self.R -= self.dV * pipe_ratio * self.pipe_fraction
        #print 'new R=', self.R
        for elt in lstring:
            if elt.name in ['I']:
                elt[0].radius += (elt[0]._target_radius - elt[0].radius) * pipe_ratio



        self._time.append(time_elapsed)


        self.update_counter(lstring)
        self.branch_update()
        self.growth_unit_update()

        if self.D < 0. and self.D>-1e-15: self.D=0
        if self.A < 0. and self.A>-1e-15: self.A=0
        if self.R < 0. and self.R>-1e-15: self.R=0
        if self.C < 0. and self.C>-1e-15: self.C=0
        if self.D<0 or self.A<0 or self.R<0 or self.C<0:
            raise ValueError("D (%s), A  (%s), R (%s) and C (%s) cannot be negative!" % (self.D, self.A, self.R, self.C))

    def growth_unit_update(self):
        from openalea.mtg.aml import Activate, Components, Class
        Activate(self.mtg)
        gu_ids = [x for x in self.mtg.vertices() if Class(x)=='U']

        # save the number of internodes in each GU
        for vid in gu_ids:
           counter = len([id for id in list(self.mtg.components_at_scale(vid,4))
                          if self.mtg.class_name(id)=='I'])
           self.mtg.property('GrowthUnit')[vid].internode_counter = counter

        # computes the length
        for vid in gu_ids:
            length = sum([ self.mtg.property('Internode')[id].length for id in list(self.mtg.components_at_scale(vid,4))
                          if self.mtg.class_name(id)=='I'])
            self.mtg.property('GrowthUnit')[vid].length = length

        for vid in gu_ids:
            first_id = self.mtg.components_at_scale(vid, scale=4).next()
            if self.mtg.class_name(first_id) == 'I':
                self.mtg.property('GrowthUnit')[vid].radius = self.mtg.property('Internode')[first_id].radius
            #else:
            #    self.mtg.property('GrowthUnit')[vid].radius = 0.

        #comps = [self.mtg.components_at_scale(x,4) for x in gu_ids]
    def branch_update(self):

        from openalea.mtg.aml import Activate, Components, Class, VtxList
        Activate(self.mtg)
        try:
            branch_ids = VtxList(2)
            if len(branch_ids)==0:
                return
        except:
            return

        for vid in branch_ids:
           counter = len([id for id in list(self.mtg.components_at_scale(vid,4))
                          if self.mtg.class_name(id)=='I'])
           #assert self.mtg.property('Branch')[vid].internode_counter <= counter
           self.mtg.property('Branch')[vid].internode_counter = counter
           counter = len([id for id in list(self.mtg.components_at_scale(vid,3))
                          if self.mtg.class_name(id)=='U'])
           #assert self.mtg.property('Branch')[vid].growthunit_counter <= counter
           self.mtg.property('Branch')[vid].growthunit_counter = counter

        # calculate the branches total length
        internode_ids = [Components(x,Scale=4) for x in branch_ids]
        length = [[sum([self.mtg.property('Internode')[id].length for id in y if self.mtg.class_name(id)=='I'])]  for y in internode_ids]
        for vid,length in zip(branch_ids, length):
           self.mtg.property('Branch')[vid].length = length[0]

        #compute the branches radius
        for vid in branch_ids:
            first_id = self.mtg.components_at_scale(vid, scale=4).next()
            if self.mtg.class_name(first_id) == 'I':
                self.mtg.property('Branch')[vid].radius = self.mtg.property('Internode')[first_id].radius
            #else:
            #    self.mtg.property('Branch')[vid].radius = 0.



    def _get_options(self):
        return self._options
    def _set_options(self, options):
        self._options = options
    options = property(fget=_get_options,fset=_set_options)

    def _get_revision(self):
        return self._revision
    revision = property(fget=_get_revision,  doc="the revision of the lsystem used within the simulation")

    def _get_time(self):
        return self._time
    time = property(fget=_get_time,  doc="getter for the time array")

    def mtg_plot_example(self):
        mtg = self.mtg
        o = [mtg.order(x) for x in mtg.vertices() if mtg.label(x)=='A']
        import pylab
        pylab.hist(o, range(0,max(o)+1))
        pylab.show()


    def _get_revision(self):
        return self._revision
    revision = property(fget=_get_revision,fset=None, doc="store the revision number of the lsystem that called this constructor")
