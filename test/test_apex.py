from openalea.plantik.biotik.apex import Apex


class testApex():

    def __init__(self):
        self.apex = Apex()

    def test_update(self):
        self.apex.update(1)

    def test_attributes(self):
        self.apex.plastochron == 3

    def _test_plot(self):
        self.apex.update(10)
        self.apex.plot('length', show=False)

    def _test_wrong_attribute(self):
        try:
            self.apex.length = 1
        except:
            assert True

    def test_resource(self):
        self.apex.resource_calculation()
        assert self.apex.resource == 0

    def test_demand(self):
        self.apex.demand_calculation()
        assert self.apex.demand == 2
        self.apex.demand_calculation(context="order_height_age")
        self.apex.demand_calculation(context="none")

    def test_maintenance(self):
        self.apex._compute_maintenance()
        assert self.apex.maintenance == 0

    def test_str(self):
        print self.apex

    def test_plot(self):
        self.apex.plot(show=False)

