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

    def test_plot_DARC(self):
        self.plant.plot_DARC(show=False)

    def test_plot_counter(self):
        self.plant.plot_counter(show=False)

    def create_data(self):
        from openalea.lpy import AxialTree
        N = 5
        a = AxialTree(['BU'])
        self.plant.update_counter(a)
        a = AxialTree(['BUA'])
        self.plant.update_counter(a)
        a = AxialTree(['BUAIALA'])
        self.plant.update_counter(a)
        a = AxialTree(['BUAILAILAILIA'])
        self.plant.update_counter(a)
        a = AxialTree(['BUAILAILAILIIIIA'])
        self.plant.update_counter(a)

        from pylab import randn
        for x in range(N):
            self.plant.DARC.D.append(randn()) 
            self.plant.DARC.A.append(randn()) 
            self.plant.DARC.R.append(randn()) 
            self.plant.DARC.C.append(randn()) 



        self.plant._time = range(5)


    def test_str(self):
        print self.plant
