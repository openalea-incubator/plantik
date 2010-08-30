from openalea.plantik.biotik.collection import *




class test_SingleVariable():

    def __init__(self):
        self.sv = SingleVariable('age')
        self._test_append()

    def test_attributes(self):
        assert self.sv.name == 'age'
        assert self.sv.dt == 1
        self.sv.dt = 0.1
        assert self.sv.dt == 0.1
        assert self.sv.unit == 'not specified'

    def _test_append(self):
        for x in xrange(1000):
            self.sv.append(x)
        assert self.sv.values == [x for x in xrange(1000)]

    def test_print(self):
        print self.sv

    def test_delete_values(self):
        del self.sv.values

    def test_plot(self):
        self.sv.plot(show=False)
        self.sv.plot(xrange(1000), show=False)

    def test_hist(self):
        self.sv.hist(show=False)


class test_collection():

    def __init__(self):
        self.var1 = SingleVariable(name='age')
        self.var2 = SingleVariable(name='temperature')

        self.col = CollectionVariables()
        self.col.add(self.var1)
        self.col.add(self.var2)


    def test_names(self):
        assert self.col.names == ['age','temperature']

    def test_append(self):
        self.col.append([1,2])
        assert self.col.age.values == [1], self.col.age.values
        assert self.col.temperature.values == [2], self.col.temperature.values
        assert self.var1.values == []
        assert self.var2.values == []

        try:
            self.col.append([1])
            assert False
        except:
            assert True

        assert self.col.age.values == [1]
        assert self.col.temperature.values == [2]

    def test_print(self):
        print self.col


    def test_valid_class(self):
        self.col = CollectionVariables()
        self.col.add(self.var1)
        self.col.add(self.var2)
        assert self.col.age.values == []


        self.col2 = CollectionVariables()
        self.col2.add(self.var1)
        self.col2.add(self.var2)
        #self.col2.append([3,4])
        assert self.col2.age.values == [], "col2.age.values must be empty found %s" % self.col2.age.values
       
    def test_valid_names(self) :
        self.col.valid_names(['age', 'temperature'])
