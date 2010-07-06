
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
        
    def plot(self, show=True):
        import pylab
        pylab.rcParams['text.usetex'] = True

        filename = self.filename + '_flux' + '.png'
        if self.verbose == True:
            print 'Saving %s ' % filename,
        pylab.clf()
        pylab.semilogy(self.time, self.D, label='Apex number')
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
    def __init__(self, options=None, revision=None):
        """
        :param lstring: store the final string of the lsystem simulation
        :param version: store the SVN revision of the lpy file
        :param duration: store the duration of the simulation
        :param options: the options from the config.ini file

        .. todo:: clean up all other variables that could be extracted from the lstring ?
        """
        self.dt = options.general.time_step
        self.data = DataVector(options)
        
        self.time = []
        self.D = None
        self.R = options.root.initial_resource
        self.reserve = []   # resource sent into the reserve at each step
        self.RESERVE = []   # total reserve
        self.C = None
        self.A = None
        self.allocated = []
        self.nA = []        # number of apex versus time
        self.nI = []        # number of Internode versus time
        self.n = []         # number of total elements versus time
        self.nL = []        # number of leaves elements versus time
        self.nF = []        # number of fruits elements versus time
        self.lstring = None     # store the complete final lstring
        self._options = options  # store the simulation options
        self._revision = revision # used to store the revision number
        self.duration = 0       # used to store the duration of the simulation
        self.apex = {'demand':[], 'allocated':[], 'height':[], 'age':[]} # keeps track of the main apex characteristics
        self.all = {'age':[], 'order':[], 'height':[]}
        
        self.counter = DataCounter(options)
                
        
    def __str__(self):
        res = "R:" + str(self.R) + "\n"
        res += "D:" + str(self.D) + "\n"
        res += "C:" + str(self.C) + "\n"
        return res
         
    def plot(self):
        pass
        
                 
                         
    def update(self, time_elapsed):
        self.D = 0.
        if self.options.misc.reset_resource:
            self.R = 0.
        
            
        self.C = 0.
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
        self.D *= self.dt
        self.R *= self.dt
        self.C *= self.dt
        
        self.data.R.append(self.R)
        self.data.D.append(self.D)
        self.data.C.append(self.C)
        self.data.time.append(time_elapsed)
        # substract the living cost from the total resource.
        self.R -= self.C 
        #todo what about substraced the reserve?
        if self.R < 0:
            self.R = 0
        
        self.time.append(time_elapsed)
        
        self.counting()
        self.counter.update(self.lstring, time_elapsed)
    def counting(self):
        
        nA = self.lstring.count('A')
        nI = self.lstring.count('I')
        nL = self.lstring.count('L')
        self.nA.append(nA)
        self.nI.append(nI)
        self.nL.append(nL)
        self.n.append(nA+nI+nL)
        
         #read only attributes
    def _get_options(self):
        return self._options
    options = property(fget=_get_options,
                   doc="the options used within the simulation")
    
    def _get_revision(self):
        return self._revision
    revision = property(fget=_get_revision,
                   doc="the revision of the lsystem used within the simulation")
    
    
        
        