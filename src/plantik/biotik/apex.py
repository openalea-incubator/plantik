from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.component import ComponentInterface
from openalea.plantik.biotik.growth import GrowthFunction
from openalea.plantik.tools.plot import CheckVariables
from math import pi, exp
from openalea.plantik.tools.misc import title



class Apex(ComponentInterface):
    def __init__(self, birthdate=None, order=0, path=1, rank=1,
                 bud_break_year=None,
                 demand=2, metamer_cost=2, maintenance=0,
                 distance_meter=0., id=None, plastochron=3.,
                 vigor=0.1):



        self.context = Context(rank=rank, order=order, path=path)
        ComponentInterface.__init__(self, label='Apex',
                                    birthdate=birthdate, id=id)

        self.plastochron = plastochron
        self.current_plastochron = 0.
        self.metamer_cost = metamer_cost
        self.demand = demand
        self.bud_break_year = bud_break_year

        self.maintenance = maintenance # cost to maintain the apex alive
        self.distance_meter = distance_meter
        self.radius = 0.00 # for the pipe model
        self.growth_threshold = 0.2
        self.growth_potential = 1
        self.vigor = vigor
       
        self.initial_demand = demand 
        #self.demand_initial_v = [self._demand_initial]
        self.initial_demand_v = [self._initial_demand]
        self.internode_length_v = []

        self.variables = ['age', 'radius', 'vigor', 'demand', 'allocated', 'height']
        for var in self.variables:
            self.__setattr__(var+'_v', [])
        self.save_data_product()
        self.interruption = 0.
        self.growing = False
        self.father_radius = 0.
        self.internodes = 0.
        #self.radius = 0.

    def save_data_product(self):
        self.age_v.append(self.age.days)
        self.height_v.append(self.distance_meter)
        self.allocated_v.append(self.allocated)
        self.demand_v.append(self.demand)
        self.initial_demand_v.append(self.initial_demand)
        #self.time_v.append(time)
        self.vigor_v.append(self.vigor)
        self.radius_v.append(self.radius)


    def update(self, dt):
        super(Apex, self).update(dt)
        self.current_plastochron += dt
        self.interruption += dt
        self.save_data_product()

    def demand_calculation(self,  **kargs):

        alpha = kargs.get("alpha", 1.)
        beta = kargs.get("beta", 1.)
        gamma = kargs.get("gamma", 0)
        delta = kargs.get("delta", 0)
        context = kargs.get("context", "order_height")

        #todo refactoering switch model to context
        model = context
        assert model in ["none", "order_height_age",  "order_height"], 'check your config.ini file (model field)'
        order = self.context.order
        path = self.context.path
        rank = self.context.rank

        if model=="order_height":
            self.demand = self.initial_demand / float(order+1)**alpha / float(path)**beta
            return self.demand
        elif model=="order_height_age":
            self.weight_order = 1./float(order+1)**alpha
            self.weight_height = 1./float(path)**beta
            self.demand = self.initial_demand * self.weight_order * self.weight_height

            self.weight_gamma = 1./(1+exp(+(0.03*(self.age.days-90.))))
            self.demand *= self.weight_gamma**gamma
            self.demand *= self.vigor**delta

            return self.demand
        elif model=='none':
            # nothing to be done in the simple model
            return self.initial_demand

    def _compute_maintenance(self):
        pass

    def resource_calculation(self):
        return self.resource

    def _plot_demand(self,clf=True ):
        import pylab
        import numpy
        if clf:
            pylab.clf()
        pylab.plot(self.age_v, self.allocated_v, '-o', label='allocated')
        pylab.hold(True)
        pylab.plot(self.age_v, self.demand_v, 'x', label='demand')
        pylab.plot(self.age_v, self.initial_demand_v, 'x',
                   label='initial demand $d_0$')
        pylab.grid(True)
        pylab.legend(loc='best')
        pylab.xlabel('time since birthdate')
        pylab.show()

    def plot(self, variables=None, tag='', clf=True, show=True, symbol='-o'):
        import pylab
        _variables = CheckVariables(self.variables, variables)

        if clf is True:
            pylab.figure()
            pylab.clf()
        for variable in _variables:
            if variable not in ['age', 'radius']:
                pylab.plot(self.age_v, getattr(self, '%s_v' % variable), symbol, label=variable)
                pylab.xlabel('time since birthdate')
                pylab.ylabel('%s of this %s' % (variable, self.label))
                pylab.grid(True)
        pylab.plot([min(self.age_v), max(self.age_v)], 
                   [self.growth_threshold, self.growth_threshold], 
                   label='growth threshold')
        if show==True:
            pylab.show()
        pylab.legend()
        pylab.savefig('test_%s_%s_%s.png' % (self.label, tag, variable))



    def __str__(self):
        res = self.component_summary()
        res += self.context.__str__()
        res += title('other attributes')
        res += ' - demand=%s' % self._demand
        res += ' - resource=%s' % self._resource
        res += ' - allocated=%s' % self._allocated
        res += ' - maintenance=%s' % self._maintenance

        return res
