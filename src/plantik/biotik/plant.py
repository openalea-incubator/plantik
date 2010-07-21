
class DataInterface():
    def __init__(self, options):
     
        self.verbose = options.general.verbose
        self.filename = options.general.filename_prefix
        self.time = []
        
    def plot(self):
        raise NotImplementedError
    
    def update(self, time):
        raise NotImplementedError

class DataCounter(DataInterface):
    def __init__(self, options):
        DataInterface.__init__(self, options=options)
        self.apices = []
        self.leaves = []
        self.internodes = []
        self.total = []
        
    def update(self, lstring, time):
        nA = lstring.count('A')
        nI = lstring.count('I')
        nL = lstring.count('L')
        self.apices.append(nA)
        self.internodes.append(nI)
        self.leaves.append(nL)
        self.total.append(nA+nI+nL)
        self.time.append(time)
        
    def plot(self, show=True):
        import pylab
        pylab.rcParams['text.usetex'] = True

        filename = self.filename + '_counter' + '.png'
        if self.verbose == True:
            print 'Saving %s ' % filename,
        fig = pylab.figure()
        pylab.clf()
        
        try:
            pylab.semilogy(self.time, self.apices, label='Apex number')
            pylab.hold(True)
            pylab.semilogy(self.time, self.internodes, label='Internode number')
            pylab.semilogy(self.time, self.leaves, label='Leaves number')
            pylab.semilogy(self.time, self.total, label='total')
            pylab.xlabel('Time (days)')
            pylab.ylabel(r'\#')
            pylab.legend(loc='best')
            pylab.grid(True)
        except ValueError, e:
            pylab.text(0,0,'failed')

        pylab.savefig(filename)
        if show:
            pylab.show()
        if self.verbose == True:
            print '...done'
        return fig

class DataVector(DataInterface):
    def __init__(self, options):
        DataInterface.__init__(self, options=options)
        self.D = []
        self.A = []
        self.R = []
        self.C = []
	self.V = []
        
    def plot(self, show=True, normalised=False):
        import pylab
        pylab.rcParams['text.usetex'] = True

        filename = self.filename + '_flux' + '.png'
        if self.verbose == True:
            print 'Saving %s ' % filename,
        
        fig = pylab.figure()
        pylab.clf()
        if normalised == True:
            import numpy
            norm = numpy.array(self.R)
	    D = numpy.array(self.D)/norm
            A = numpy.array(self.A)/norm
	    R = numpy.array(self.R)/norm
	    C = numpy.array(self.C)/norm
        else:
            D = self.D
            A = self.A
            R = self.R
            C = self.C

        pylab.plot(self.time, D, '-o',label='Total demand')
        pylab.hold(True)
        pylab.plot(self.time, R, '-x', label='Total resource')
        pylab.plot(self.time, A, '-.s', label='Primary growth allocation')
        pylab.plot(self.time, C, '', label='Total cost')
        pylab.xlabel('Time (days)')
        pylab.ylabel(r'\#')
        pylab.legend(loc='best')
        pylab.grid(True)
        pylab.savefig(filename)
        if show:
            pylab.show()
        if self.verbose is True:
            print '...done'
        
        
        

class Plant(object):
    """A simple data structure that is used to store simulation data products

    Store the simulation parameters as well as variables that change over time
    such as the number of apices versus time

    This class should be used with a lsystem.lpy file

    """
    def __init__(self, options=None, revision=None, pipe_fraction=1.):
        """
        :param pipe_fraction: cost of the pipe model is metamer_growth volume times the
          pipe_fraction parameter
        :param version: store the SVN revision of the lpy file
        :param options: the options from the config.ini file

        .. todo:: clean up all other variables that could be extracted from the lstring ?
        """
        self.dt = options.general.time_step
        self.DARC = DataVector(options)
        
        self.time = []
        self.D = 0
        self.R = options.root.initial_resource
        self.reserve = []   # resource sent into the reserve at each step
        self.RESERVE = []   # total reserve
        self.C = 0
        self.A = 0
        self.allocated = []
        self.lstring = None     # store the complete final lstring
        self.mtg = None
        self._options = options  # store the simulation options
        self._revision = revision # used to store the revision number
        self.duration = 0       # used to store the duration of the simulation
        self.apex = {'demand':[], 'allocated':[], 'height':[], 'age':[]} # keeps track of the main apex characteristics
        self.all = {'age':[], 'order':[], 'height':[]}
        
        self.counter = DataCounter(options)
        self.dv = 0
        self.pipe_fraction = pipe_fraction
        self.pipe_ratio_v = [0.]
        self.radius = 0
        
    def __str__(self):
        res = "R:" + str(self.R) + "\n"
        res += "D:" + str(self.D) + "\n"
        res += "C:" + str(self.C) + "\n"
        return res
         
    def plot(self, normalised=False):
        self.counter.plot()
        self.DARC.plot(normalised=normalised)
        #self.mtg_plot_example()
        
                 
                         
    def update(self, time_elapsed):
        self.D = 0.
        if self.options.misc.reset_resource:
            self.R = 0.
        
        self.C = 0.
        self.dV = 0.
        #print self.options.context.order_coeff
        for elt in self.lstring:
            if elt.name in ['R', 'A', 'I', 'L']:
                self.C += elt[0].maintenance
                self.D += elt[0].demand_calculation(
                                    context=self.options.context.model,
                                    alpha=self.options.context.order_coeff,
                                    beta=self.options.context.height_coeff,
                                    delta=self.options.context.vigor_coeff,
                                    gamma=self.options.context.age_coeff)
                self.R += elt[0].resource_calculation()
            if elt.name in ['I']:
                self.dV += elt[0].dvolume / (1./elt[0].cost_per_metamer)
        self.D *= self.dt
        self.R *= self.dt
        self.C *= self.dt
        
        
        
        self.DARC.R.append(self.R)
        self.DARC.D.append(self.D)
        self.DARC.C.append(self.C)
        self.DARC.time.append(time_elapsed)
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
        for elt in self.lstring:
            if elt.name in ['I']:
                elt[0].radius += (elt[0]._target_radius - elt[0].radius) * pipe_ratio



        self.time.append(time_elapsed)
        

        self.counter.update(self.lstring, time_elapsed)
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
           #assert self.mtg.property('GrowthUnit')[vid].internode_counter <= counter

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
            else:
                self.mtg.property('GrowthUnit')[vid].radius = 0.

        #comps = [self.mtg.components_at_scale(x,4) for x in gu_ids]
    def branch_update(self):
        
        from openalea.mtg.aml import Activate, Components, Class, VtxList
        Activate(self.mtg)
        branch_ids = VtxList(2)
        
        
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
            else:
                self.mtg.property('Branch')[vid].radius = 0.

    
    
    def _get_options(self):
        return self._options
    def _set_options(self, options):
        self._options = options
    options = property(fget=_get_options,fset=_set_options,
                   doc="the options used within the simulation")
    
    def _get_revision(self):
        return self._revision
    revision = property(fget=_get_revision,
                   doc="the revision of the lsystem used within the simulation")
    
    def mtg_plot_example(self):
        mtg = self.mtg
        o = [mtg.order(x) for x in mtg.vertices() if mtg.label(x)=='A']
        import pylab
        pylab.hist(o, range(0,max(o)+1))
        pylab.show()
        
            
