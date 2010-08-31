from openalea.plantik.biotik.leaf import Leaf 



class testLeaf():

    def __init__(self):
        self.leaf = Leaf(store_data=True, resource_per_day=1)


    def test_update(self):
        self.leaf.update(1)
        self.leaf.update(self.leaf.maturation)


    def _test_wrong_attribute(self):
        try:
            self.leaf.length = 1
        except:
            assert True

    def test_resource(self):
        assert self.leaf.efficiency_method == 'unity'
        self.leaf.resourceCalculation()
        assert self.leaf.resource >= 0

        self.leaf.efficiency_method = 'logistic'
        self.leaf.resourceCalculation()
        assert self.leaf.resource >= 0

        self.leaf.efficiency_method = 'dummy'
        try:
            self.leaf.resourceCalculation()
            assert False
        except:
            assert True

    def test_demand(self):
        self.leaf.demandCalculation()
        assert self.leaf.demand == 0

    def test_livingcost(self):
        self.leaf._compute_livingcost()
        assert self.leaf.livingcost == 0

    def test_str(self):
        print self.leaf

    def test_plot(self):
        self.leaf.plot(show=False)


    def test_read_only_attributes(self):
        try:
            self.leaf.radius = 1
            assert False
        except:
            assert True

    def test_attributes_getters(self):
        self.leaf.area
        self.leaf.mass
        self.leaf.radius
