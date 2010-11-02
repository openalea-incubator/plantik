#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""plant module

.. module:: plant
    :synopsis: class to manage a whole plant evolution over time


.. topic:: Summary

    class to manage a whole plant evolution over time

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:  >>> from vplants.plantik.biotik.plant import *

.. testsetup::

    from vplants.plantik.biotik.plant import *
    from vplants.plantik import get_shared_data
    from vplants.plantik.tools.config import ConfigParams
    options = ConfigParams(get_shared_data('pruning.ini'))

"""
from vplants.plantik.biotik.collection import SingleVariable, CollectionVariables 
from vplants.plantik.tools.mtgtools import MTGTools



class Plant(object):
    """A Plant Factory to store and compute various information within a simulation


    This class should be used as the first module of an axialtree/lstring/mtg.

    It is used by the reactive model to

        #. store various information such as the simulation options and revision.
        #. compute the **DARC** numbers at each time step
        #. compute the pipe model cost at each time step
        #. store MTG/lstring
        #. provide facilities to extract informtion from lstring/mtg

    """
    def __init__(self, time_step, options=None, revision=None, pipe_fraction=1., filename=None, tag=None):
        """**Constructor**

        :param float time_step: the time step of the simulation.
        :param options: a variable containing the simulation options from the config 
            file (see :class:`~vplants.plantik.tools.config.ConfigParams`)
        :param str revision: a SVN revision for book keeping.
        :param float pipe_fraction:
        :param str filename:  if None, populates attribute :attr:`filename` with 'plant'
        :param str tag:  append to the filename if not None

        :param pipe_fraction: cost of the pipe model is metamer_growth volume times the
          pipe_fraction parameter

            >>> from vplants.plantik import get_shared_data
            >>> from vplants.plantik.tools import  ConfigParams
            >>> from vplants.plantik.biotik import Plant
            >>> options = ConfigParams(get_shared_data('pruning.ini'))
            >>> plant = Plant(1, options, revision=1, tag='test')
            >>> plant.filename
            'plant_test'
            >>> plant.dt
            1


        :Attributes:

            * :attr:`revision` :
            * :attr:`options`  :
            * :attr:`time`  :
            * :attr:`filename`:
            * :attr:`mtg`:
            * :attr:`lstring`: used to store the lstring of an lsystem
            * :attr:`dt`:
            * :attr:`mtgtools`: an attribute of type :class:`~vplants.plantik.tools.mtgtools.MTGTools` that is used
              to store the mtg and retrieve many relevant information. It also has a DB facility.
            * :attr:`variables`: a :class:`~vplants.plantik.biotik.collection.CollectionVariables` instance containing the `pipe_ratio`
              variable. pipe_ratio contains is the ratio of resource attributed to the pipe model over time.
            * :attr:`counter`: a :class:`~vplants.plantik.biotik.collection.CollectionVariables` instance containing the count of 
              leaves/internodes/apices/growth units/branches over time. See also :meth:`plot_counter` and :meth:`update_counter`.
            * :attr:`DARC`: a :class:`~vplants.plantik.biotik.collection.CollectionVariables` instance containing the DARC values. 
              See also :meth:`plot_DARC` and :meth:`update_DARC`. DARC stands for Demand, Allocated, Resource, Cost


        .. todo:: clean up all other variables that could be extracted from the lstring ?
        .. todo:: difference pipe_ratio pipe_fraction
        .. todo::   duration,        apex,        all,        dv 
        """
        if filename != None: assert type(filename) == str
        if tag != None: assert type(tag) == str
        assert pipe_fraction<=1 and pipe_fraction>=0

        self._filename = self._set_filename(filename, tag)
        self._revision = revision 
        self._options = options
        self._time = []
        self._mtg = None
        self._lstring = None
        self.label = 'Plant'
        # could be retrieved from options parameter but let us try to not depends on options !
        self._dt = time_step

        #!! when calling self.mtg, what you really do is self.mtgtools.mtg
        # !!when doing self.mtg = a, what you really do is self.mtgtools.mtg = a
        self.mtgtools = MTGTools()

        self.D = 0
        try:
            self.R = options.root.initial_resource
        except:
            self.R = 1
        self.reserve = []   # resource sent into the reserve at each step
        self.RESERVE = []   # total reserve
        self.C = 0
        self.A = 0
        self.allocated = []


        self.duration = 0       # used to store the duration of the simulation
        self.apex = {'demand':[], 'allocated':[], 'height':[], 'age':[]} # keeps track of the main apex characteristics
        self.all = {'age':[], 'order':[], 'height':[]}

        #: expected increase of volume related to the pipe model.
        self.dV = 0
        self.pipe_fraction = pipe_fraction
        self.radius = 0

        #: extract storeage for variables over time inluding :attr:`pipe_ratio` and :attr:`dV`.
        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='pipe_ratio', unit='ratio', 
                                          values=[]))
        self.variables.add(SingleVariable(name='dV', unit='ratio'))

        #: a CollectionVariable instance that containes the count of
        # **apices**, **internodes**, **leaves**
        #: **branches** and growth units (denoted **gus**) at each time step. 
        #For instance, to acces to apices counter::
        #:
        #: >>> plant.counter.apices.values
        self.counter = CollectionVariables()
        self.counter.add(SingleVariable(name='apices', unit=r'#'))
        self.counter.add(SingleVariable(name='internodes', unit=r'#'))
        self.counter.add(SingleVariable(name='leaves', unit=r'#'))
        self.counter.add(SingleVariable(name='branches', unit=r'#'))
        self.counter.add(SingleVariable(name='gus', unit=r'#'))

        #: a CollectionVariable instance that contains the demand (D), allocated resources(R), 
        #: resources (R) and cost (C) at each time step. To acces to demand over time::
        #:
        #: >>> plant.DARC.D.values
        self.DARC = CollectionVariables()
        self.DARC.add(SingleVariable(name='D', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='A', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='R', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='C', unit='biomass unit', values=[]))
        self.DARC.add(SingleVariable(name='pipe_cost', unit='biomass unit'))


    def __str__(self):
        res = "R:" + str(self.R) + "\n"
        res += "D:" + str(self.D) + "\n"
        res += "C:" + str(self.C) + "\n"
        return res


    def plot_PARC(self, show=True, normalised=True, savefig=False, num_fig=1):
        """plotting dedicated to the :attr:`PARC` attribute.

        where P stand for pipe cost

        :param bool show: 
        :param bool savefig: 
        :param bool normalised: normalise the quantity D, A, R, C by R (total resource)

        .. todo: this doc to be cleaned up

        .. plot::
            :include-source:
            :width: 50%

            from vplants.plantik import *
            options = ConfigParams(get_shared_data('pruning.ini'))
            plant = Plant(1, options)
            for x in range(100):
                plant.DARC.D.append(0.25)
                plant.DARC.A.append(0.25)
                plant.DARC.R.append(1)
                plant.DARC.C.append(0.25)
                plant.DARC.pipe_cost.append(0.5)
                plant._time.append(x)
            plant.plot_PARC()


        """
        from pylab import bar, hold, legend, title, figure, clf, xlabel
        import numpy

        T = numpy.array(self.time)
        D = numpy.array(self.DARC.D.values)
        A = numpy.array(self.DARC.A.values)
        R = numpy.array(self.DARC.R.values)
        C = numpy.array(self.DARC.C.values)
        if normalised == False:
            R=R/R
        pipe = numpy.array(self.DARC.pipe_cost.values)
        figure(num_fig)
        clf()
        bar(T, A/R, label='Total allocation fraction', width=1); 
        hold(True); 
        bar(T, C/R, bottom=A/R, label='Total living cost', color='r', width=1); 
        bar(T, (pipe/R), bottom=(C+A)/R, color='g', label='Total pipe model cost', width=1); 
        legend()
        xlabel('Time in days')
        title("Proportion of allocation, pipe cost and living cost")
        if show is True:
            from pylab import show as myshow
            myshow()



    def plot_DARC(self, show=True, normalised=False, savefig=False, num_fig=1):
        """plotting dedicated to the :attr:`DARC` attribute.

        :param bool show: 
        :param bool savefig: 
        :param bool normalised: normalise the quantity D, A, R, C by R (total resource)

        .. plot::
            :include-source:
            :width: 50%

            from vplants.plantik.biotik.plant import *
            from vplants.plantik import get_shared_data, ConfigParams
            options = ConfigParams(get_shared_data('pruning.ini'))
            plant = Plant(1,options)
            for x in range(100):
                plant.DARC.D.append(x**0.5)
                plant.DARC.A.append(x**0.3)
                plant.DARC.R.append(x**0.4)
                plant.DARC.C.append(x**0.3)
                plant.DARC.pipe_cost.append(x**0.3)
                plant._time.append(x)
            plant.plot_DARC()

        """
        import pylab
        import numpy
        pylab.rcParams['text.usetex'] = True

        fig = pylab.figure(num_fig)
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
        try:
            pipe = numpy.array(self.DARC.pipe_cost.values)
        except:
            pass

        pylab.plot(T, D/norm, '-ob',label="Total demand")
        pylab.hold(True)
        pylab.plot(T, A/norm, '-.sr',label="Allocation cost")
        pylab.plot(T, R/norm, '-k', linewidth=2, label='Total resource')
        pylab.plot(T, C/norm, '-D',color='magenta', markerfacecolor=None, markersize=12, label='Total cost')
        pylab.plot(T, pipe/norm, '-og', label='Pipe model cost')
        try:
            pylab.plot(T, (C+A+pipe)/norm, '-square', markersize=15, label='Total cost + allocation + pipe\_model cost')
        except:
            pass
        pylab.xlabel('Time (days)')
        pylab.ylabel(r'\#')
        pylab.legend(loc='best')
        pylab.grid(True)
        if show: pylab.show()
        if savefig: pylab.savefig(self.filename + "_DARC.png")


    def plot_counter(self, show=True, savefig=False, num_fig=1):
        """ plotting dedicated to counter

        :param bool show: 
        :param bool savefig: 

        .. plot::
            :include-source:
            :width: 50%

            from vplants.plantik.biotik.plant import *
            from vplants.plantik import get_shared_data, ConfigParams
            options = ConfigParams(get_shared_data('pruning.ini'))
            plant = Plant(1,options)
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
        fig = pylab.figure(num_fig)
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


    def plot(self, normalised=False, show=True, savefig=False):
        """calls all plotting methods

        calls :meth:`plot_counter()`, :meth:`plot_DARC()` and :meth:`plot_PARC()`.

        many more plots can be found in :attr:`mtgtools` attribute
        """
        self.plot_counter(num_fig=1, savefig=savefig, show=show)
        self.plot_DARC(normalised=normalised, show=show, num_fig=2, savefig=savefig)
        self.plot_PARC(normalised=normalised, show=show, num_fig=3, savefig=savefig)


    def update_counter(self, lstring):
        """Parse the lstring attribute and count the number of elements to update the :attr:`counter` attribute.

        .. warning:: you should use the :meth:`update` to call this function. Indeed, if you only call this function,
            other variables such as the :attr:`time` will not be updated at the same time leading to future errors in 
            plotting for instance.!!

        """
        #import inspect
        #if inspect.stack()[1][3] != 'update':
        #    import warnings
        #    warnings.warn('You should not call Plant.update_counter directly but via the update() method. See docstring.')
        self.counter.apices.append(lstring.count('A'))
        self.counter.internodes.append(lstring.count('I'))
        self.counter.leaves.append(lstring.count('L'))
        self.counter.branches.append(lstring.count('B'))
        self.counter.gus.append(lstring.count('U'))

    def update_DARC(self, D,  R, C):
        """Update the :attr:`DARC` attribute given D, A, R, C values

        .. todo:: include A in the parametr list.
        
        .. warning:: you should use the :meth:`update` to call this function. Indeed, if you only call this function,
            other variables such as the :attr:`time` will not be updated at the same time leading to future errors in 
            plotting for instance.!!
        """
        self.DARC.D.append(D)
        self.DARC.R.append(R)
        self.DARC.C.append(C)


    def update(self, time_elapsed, lstring, fast=True, dvmin=0.1):
        """Main core of the plant modelling to cionpute the DARC values at each step 

        plus the pipe model cost

        :param bool fast: if True, branch_update and growth_update are not called (save about 20% of CPU).

        calls :meth:`update_DARC` and :meth:`update_counter` methods

        .. todo:: this documentation
        """


        self.mtgtools.set_order_path_rank()
        #reset total demand
        self.D = 0.
        if self.options.misc.reset_resource:
            self.R = 0.

        # reset total cost
        self.C = 0.


        self.dV = 0.
        for elt in lstring:
            if elt.name in ['R', 'A', 'I', 'L']:
                self.C += elt[0].livingcost
                self.D += elt[0].demandCalculation(
                                    context=self.options.context.model,
                                    order_coeff=self.options.context.order_coeff,
                                    height_coeff=self.options.context.height_coeff,
                                    rank_coeff=self.options.context.rank_coeff,
                                    vigor_coeff=self.options.context.vigor_coeff,
                                    age_coeff=self.options.context.age_coeff)
                self.R += elt[0].resourceCalculation()
            if elt.name in ['I']:
                self.dV += elt[0].dvolume / (1./elt[0].cost_per_metamer)
        self.D *= self.dt
        self.R *= self.dt
        self.C *= self.dt

        # does not cost anything to check that dV is positive
        assert self.dV >=0

        self.update_DARC(self.D, self.R, self.C)


        # First sink processus:living cost ----------------------------------------------
        # substract the living cost from the total resource.
        if self.C > self.R:
            self.R = 0.
        else:
            self.R -= self.C


        # second sink is the pipe model ---------------------------------------------------
        self.variables.dV.append(self.dV)

        # let us compute the amount of dv that will be indeed allocated. Given that we want to use
        # at maximum the amount R*pipe_fraction.
        dv_a = min(self.R * self.pipe_fraction, self.dV)
        assert dv_a >= 0 and dv_a <= self.R * self.pipe_fraction and dv_a <= self.dV

        # So, the pipe_ratio that is fulfilled 
        if dv_a !=0:
            pipe_ratio = dv_a / self.dV
        else:
            pipe_ratio = 0.
        assert pipe_ratio >=0 and pipe_ratio <= 1.

        self.DARC.pipe_cost.append(dv_a)

        cost_per_dv = 1.
        self.R -= dv_a * cost_per_dv
        
        self.variables.pipe_ratio.append(pipe_ratio)

        #print 'new R=', self.R
        for elt in lstring:
            if elt.name in ['I']:
                # pipe_ratio**2 since v=2.pi r^2
                elt[0].radius += (elt[0]._target_radius - elt[0].radius) * pipe_ratio**2.

        self._time.append(time_elapsed)
        self.update_counter(lstring)
        self.branch_update(fast=fast)
        self.growth_unit_update(fast=fast)

        if self.D < 0. and self.D>-1e-15: self.D=0
        if self.A < 0. and self.A>-1e-15: self.A=0
        if self.R < 0. and self.R>-1e-15: self.R=0
        if self.C < 0. and self.C>-1e-15: self.C=0
        if self.D<0 or self.A<0 or self.R<0 or self.C<0:
            raise ValueError("D (%s), A  (%s), R (%s) and C (%s) cannot be negative!" % (self.D, self.A, self.R, self.C))

    def growth_unit_update(self, fast=True):
        """update growth unit  information.

        #. recompute the number of internode unit in a branch
        #. recompute the branch length
        #. recompute the branch base radius (e.g., first internode radius)

        """

        if fast == True:
            return 

        gu_ids = self.mtgtools.ids['U']

        """
        #tool long with the DB because it is created at each time step....
        self.mtgtools.createDB()
        self.mtgtools.connectDB()
        for gu_id in gu_ids:
            counter = len(self.mtgtools.select(select="id", label='I', complex=gu_id))
            self.mtg.property('GrowthUnit')[gu_id].internode_counter = counter

            length = sum(self.mtgtools.select_attribute(attribute="length", select="id", label='I', complex=gu_id))
            self.mtgtools.mtg.property('GrowthUnit')[gu_id].length = length

            radius = self.mtgtools.select_attribute(attribute="radius", select="id", label='I', complex=gu_id)
            if len(radius) != 0:
                self.mtgtools.mtg.property('GrowthUnit')[gu_id].radius = max(radius)
        self.mtgtools.closeDB() 
        """
 
        # save the number of internodes in each GU using standard mtg code.
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



    def branch_update(self, fast=True):
        """update branch  information.

        #. recompute the number of growth unit in a branch
        #. recompute the number of internode unit in a branch
        #. recompute the branch length
        #. recompute the branch base radius (e.g., first internode radius)

        """

        if fast == True:
            return
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
            self.mtg.property('Branch')[vid].internode_counter = counter
            counter = len([id for id in list(self.mtg.components_at_scale(vid,3))
                          if self.mtg.class_name(id)=='U'])
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
    options = property(fget=_get_options, doc="getter to the options form the configuration file")

    def _get_revision(self):
        return self._revision
    revision = property(fget=_get_revision,  doc="getter to the SVN :attr:`revision` of the lsystem used within the simulation")

    def _get_dt(self):
        return self._dt
    dt = property(fget=_get_dt,  doc="getter to time step :attr:`dt`")


    revision = property(fget=_get_revision,  doc="the revision of the lsystem used within the simulation")

    def _get_mtg(self):
        return self.mtgtools.mtg
    mtg = property(fget=_get_mtg,  doc="getter/alias to :attr:`mtgtools`.mtg. to set it, use :attr:`mtgtools`.mtg instead")

    def _get_time(self):
        return self._time
    time = property(fget=_get_time,  doc="getter for the time array")

    def _get_filename(self):
        return self._filename
    filename = property(fget=_get_filename, fset=None, doc="getter to prefix filename")


    def _set_filename(self, ifilename, tag):
        """convert ifilename and tag into a filename string without extension"""
        # set the filename
        if ifilename == None:
            filename = 'plant'
        else:
            filename = ifilename

        # add a tag
        if tag != None: filename += '_' + tag
        return filename

