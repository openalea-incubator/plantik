from openalea.plantik.biotik.apex import Apex


class testApex():

    def __init__(self):
        self.apex = Apex(store_data=True)

    def test_default_parameters(self):
        assert self.apex.birthdate == None
        assert self.apex.context.order == None
        assert self.apex.context.height == None
        assert self.apex.context.rank == None
        assert self.apex.demand == 2
        assert self.apex.metamer_cost == 2
        assert self.apex.livingcost == 0
        assert self.apex.height == 0.0
        assert self.apex.id == 0
        assert self.apex.plastochron == 3.0
        assert self.apex.vigor == 0.10000000000000001
        assert self.apex.store_data in [False, True]
        assert self.apex.vigor == 0.1
        assert self.apex.growth_threshold == 0.2

    def test_attributes_setter(self):
        self.apex.vigor = 1
        self.apex.height = 0.0

    def test_update(self):
        self.apex.update(1)

    def test_attributes(self):
        self.apex.plastochron == 3

    def test_plot(self):
        self.apex.update(10)
        self.apex.plot(show=False)

    def _test_wrong_attribute(self):
        try:
            self.apex.length = 1
        except:
            assert True

    def test_resource(self):
        self.apex.resourceCalculation()
        assert self.apex.resource == 0

    def test_demand(self):
        self.apex.context.order = 1
        self.apex.context.height = 1
        self.apex.context.rank = 1
        self.apex.demandCalculation()
        assert self.apex.demand == 2
        self.apex.demandCalculation(context="order_height_age")
        self.apex.demandCalculation(context="none")

    def test_maintenance(self):
        self.apex.computeLivingcost()
        assert self.apex.livingcost == 0

    def test_str(self):
        print self.apex

    def test_plot_variables(self):
        self.apex.plot_variables(show=False)

