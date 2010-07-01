from openalea.plantik.biotik.internode import Internode



class testInternode():

    def __init__(self):
        self.internode = Internode()

    def test_attributes(self):
        assert self.internode._plastochron == 3.
        self.internode.mass

    def test_plot(self):
        self.internode.update(10)
        self.internode.plot('length', show=False)

    def test_wrong_attribute(self):
        try:
            self.internode.length = 1
        except:
            assert True

    def test_resource(self):
        self.internode.resource_calculation()
        assert self.internode.resource == 0
    

    def test_demand(self):
        self.internode.demand_calculation()
        assert self.internode.demand == 0

    def test_maintenance(self):
        self.internode._compute_maintenance(1)
        assert self.internode.maintenance == 0

    def test_str(self):
        print self.internode
    
