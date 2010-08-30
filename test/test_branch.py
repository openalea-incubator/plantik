from openalea.plantik.biotik.branch import Branch 



class testBranch():

    def __init__(self):
        self.branch = Branch(min_radius = 0.1)
        assert self.branch.demand == 0
        assert self.branch.resource == 0
        assert self.branch.livingcost == 0

    def test_radius(self):
        assert self.branch.radius == 0.1
        self.branch.radius = 0.2
        assert self.branch.radius == 0.2


    def test_length(self):
        assert self.branch.length == 0
        self.branch.length = 1
        assert self.branch.length == 1

    def test_update(self):
        self.branch.update(1)

    def test_demand(self):
        self.branch.demandCalculation()
    
    def test_resource(self):
        self.branch.resourceCalculation()

    def test_plot(self):
        self.branch.plot(show=False)
