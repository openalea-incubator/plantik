from openalea.plantik.biotik.plant import *
from openalea.plantik.tools.config import ReadConfigFile
from openalea.plantik import get_shared_data

class test_plant():

    def __init__(self):
        options = ReadConfigFile(get_shared_data('pruning.ini'))
        self.plant = Plant(1, options=options)
        self.plant = Plant(1, options=options, filename='pruning')
        self.create_data()

    def test_str(self):
        print self.plant

    def test_update(self):
        #
        self.plant.update(1,self.plant.lstring)

    def test_attributes_read_only(self):
        try:
            self.revision = 1 
            assert false
        except:
            assert True
        try:
            self.options = 1 
            assert false
        except:
            assert True

    def test_plot(self):
        self.plant.plot(show=False)

    def test_plot_DARC(self):
        self.plant.plot_DARC(show=False)
        self.plant.plot_DARC(show=False, normalised=True)

    def test_plot_counter(self):
        self.plant.plot_counter(show=False)

    def create_data(self):

        from openalea.lpy import AxialTree, ParamModule
        from openalea.mtg.io import mtg2axialtree


        parameters = {'A': ['Apex'], 'I': ['Internode'],  'L': ['Leaf'],'P':['Plant'], 'U':['GrowthUnit'], 'B':['Branch']}
        mtgtools = MTGTools()
        mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
        lstring = mtg2axialtree(mtgtools.mtg, parameters)
        self.plant.lstring = lstring
        self.plant.mtgtools.mtg = mtgtools.mtg




        """
        # keep this to show how to declare an axialtree from scrach
        from openalea.lpy import AxialTree, ParamModule
        from openalea.plantik import Apex, Leaf, Internode, Branch, GrowthUnit, Plant
        N = 5
        P = ParamModule('P', Plant(1))
        A = ParamModule('A', Apex())
        L = ParamModule('L', Leaf(resource_per_day=0.5))
        I = ParamModule('I', Internode())
        B = ParamModule('B', Branch())
        U = ParamModule('U', GrowthUnit())

        a = AxialTree([B,U, A])
        self.plant.update_counter(a)
        a = AxialTree([B,U,A])
        self.plant.update_counter(a)
        a = AxialTree([B,U,A, I, L, A])
        self.plant.update_counter(a)
        a = AxialTree([B, U, A, I, L, A, I, L, A])
        self.plant.update_counter(a)
        a = AxialTree([B, U, A, I, L, A, I, L, A, I, L, A])
        self.plant.update_counter(a)

        self.lstring = a

        from pylab import randn
        for x in range(N):
            self.plant.DARC.D.append(randn())
            self.plant.DARC.A.append(randn())
            self.plant.DARC.R.append(randn())
            self.plant.DARC.C.append(randn())
            self.plant.DARC.pipe_cost.append(randn())
        """


        #self.plant._time = range(5)


    def test_str(self):
        print self.plant


