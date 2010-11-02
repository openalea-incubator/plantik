from openalea.plantik.biotik.internode import Internode



class testInternode():

    def __init__(self):
        self.internode = Internode(store_data=True)

    def test_attributes(self):
        self.internode.mass
        self.internode.radius
        self.internode.length

        # test setters
        self.internode.radius = self.internode.radius
        self.internode.target_radius = self.internode.target_radius


        # raidus cannot decrease
        try:
            self.internode.radius /= 2
            assert False
        except:
            assert True
    def test_plot(self):
        self.internode.update(10)
        self.internode.plot('length', show=False)

    def test_wrong_attribute(self):
        try:
            self.internode.length = 1
        except:
            assert True

    def test_resource(self):
        self.internode.resourceCalculation()
        assert self.internode.resource == 0
    

    def test_demand(self):
        self.internode.demandCalculation()
        assert self.internode.demand == 0

    def test_maintenance(self):
        self.internode._compute_livingcost(1)
        assert self.internode.livingcost == 0

    def test_str(self):
        print self.internode

    def test_dvolume(self):
        assert self.internode.dvolume == 0
