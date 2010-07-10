from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.component import ComponentInterface
from openalea.plantik.biotik.growth import GrowthFunction
from openalea.plantik.tools.plot import CheckVariables
from math import pi
from openalea.plantik.tools.misc import title






class Internode(ComponentInterface):
    radius_min = 0.001
    length_max = 0.03
    length_min = 0.001
    cost_per_metamer = 1./(radius_min*radius_min*length_max * pi)

    def __init__(self, length_max=length_max,
                 cambial_fraction=0., birthdate=None,
                 rank=1, order=0, path=1, id=None, maturation=10,
                 growth_rate=0.5, growth_function='linear'):
        #radius=radius, length=length, rank=rank, path=path, order=order
        self.context = Context(rank=rank, order=order, path=path)
        #Context.__init__(rank=rank, path=path, order=order)
        ComponentInterface.__init__(self, label='Internode', birthdate=birthdate, id=id)

        self._radius = Internode.radius_min
        self._target_radius= Internode.radius_min
        self._length = GrowthFunction(Internode.length_min,
                                     length_max,
                                     maturation=maturation,
                                     growth_rate=growth_rate,
                                     growth_function=growth_function)

        self.demand_coeff = 0.
        self._plastochron = 3.
        self.current_plastochron = 0.
        self.density = 1.
        self.growing = True


        #data product
        self.variables = ['age', 'length', 'radius']
        for var in self.variables:
            self.__setattr__(var+'_v', [])
        self.save_data_product()

        assert cambial_fraction<=1 and cambial_fraction>=0
        self._mu = cambial_fraction  # % of cambial layer


    def __str__(self):
        res = self.component_summary()
        res += self.context.__str__()
        res += title('other attributes')
        res += ' - plastochron=%s' % self._plastochron
        res += ' - demand=%s' % self._demand
        res += ' - resource=%s' % self._resource
        res += ' - allocated=%s' % self._allocated
        res += ' - maintenance=%s' % self._maintenance
        return res

    def save_data_product(self):
        """update the vectors that stored data over time"""
        self.age_v.append(self.age.days)
        self.length_v.append(self._length.getValue(self.age.days))
        self.radius_v.append(self._radius)

    def plot(self, variables=None, tag='', clf=True, show=True, symbol='-o'):
        import pylab
        _variables = CheckVariables(self.variables, variables)
        pylab.figure()
        if clf is True:
            pylab.clf()
        for variable in _variables:
            pylab.plot(self.age_v, getattr(self, '%s_v' % variable), symbol)
            pylab.xlabel('time since birthdate')
            pylab.ylabel('%s of this %s' % (variable, self.label))
            pylab.grid(True)
            if show==True:
                pylab.show()
            pylab.legend()
            pylab.savefig('test_%s_%s_%s.png' % (self.label, tag, variable))


    def resource_calculation(self):
        #hypothesis: no resource provided by the internode, which is a sink
        self.resource = 0.
        return self.resource

    def demand_calculation(self, **kargs):
        """ calculate demand as a function of dV

        At each step iteration, there is a need for resources to build up a new
        cambial layer.
        """
        self.demand = self.volume * self.demand_coeff  #TODO good dimension volume versus coeff
        return self.demand

    def _getVolume(self):
        return pi * self.radius * self.radius * self.length
    volume = property(_getVolume, None, None, doc="returns the internode volume")

    def _getdVolume(self):
        return pi * self._target_radius * self._target_radius * self.length - self.volume
    dvolume = property(_getdVolume, None, None, doc="returns dv")


    def _getMass(self):
        return self.density * self.volume
    mass = property(_getMass, None, None, doc="returns the internode mass")

    def _getRadius(self):
        return self._radius
    def _setRadius(self, radius):
        self._radius = radius
    radius = property(_getRadius, _setRadius, None, doc="radius")
    
    def _getTargetRadius(self):
        return self._target_radius
    def _setTargetRadius(self, target_radius):
        self._target_radius = target_radius
    target_radius = property(_getTargetRadius, _setTargetRadius, None, doc="radius")


    def _getLength(self):
        return self._length.getValue(self.age.days)
    length = property(_getLength, None, None, doc="length")


    def update(self, dt):
        super(Internode, self).update(dt)
        self.current_plastochron += dt #todo: timedelta?
        if self.current_plastochron > self._plastochron:
            self.current_plastochron -= self._plastochron
        self.save_data_product()
        self._compute_maintenance(dt)
        # todo what if current_plastochron>plastochron*2



        #self._compute_length()
        #self._compute_volume()
        #self._compute_mass()
        #self._compute_maintenance(dt)

        #self.length_v.append(self.length)
        #self.age_v.append(self.age)
        #self.time_v.append(time)
        #self.volume_v.append(self.volume)
        #self.maintenance_v.append(self.maintenance)
        #self.radius_v.append(self.radius)

    def _compute_maintenance(self, dt):
        """
        Within an internode, only the external layer requires maintenance. The external
        layer is comprise between the max radisu R and the min raidus r.

        So, the  cambial volume is equivalent to the volume of an empty cylinder

        This is a volume that equals :math:`\pi h R^2 (2\mu -\mu^2)`.

        where `\mu` is a fraction of R
        """
        self.maintenance = self.volume * self._mu * (2. - self._mu)
        self.maintenance *= Internode.cost_per_metamer * dt








