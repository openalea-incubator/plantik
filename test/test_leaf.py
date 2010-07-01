from openalea.plantik.biotik.leaf import Leaf 



class testLeaf():

    def __init__(self):
        self.leaf = Leaf()


    def test_update(self):
        self.leaf.update(1)

    def test_attributes(self):
        assert self.leaf.mass_per_area == 220
        self.leaf.area
        self.leaf.mass

    def _test_plot(self):
        self.leaf.update(10)
        self.leaf.plot('length', show=False)

    def _test_wrong_attribute(self):
        try:
            self.leaf.length = 1
        except:
            assert True

    def test_resource(self):
        self.leaf.resource_calculation()
        assert self.leaf.resource == 0


    def test_demand(self):
        self.leaf.demand_calculation()
        assert self.leaf.demand == 0

    def test_maintenance(self):
        self.leaf._compute_maintenance()
        assert self.leaf.maintenance == 0

    def test_str(self):
        print self.leaf

    def test_plot(self):
        self.leaf.plot(show=False)

