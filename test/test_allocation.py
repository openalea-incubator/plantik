from openalea.lpy import LsysContext, AxialTree, ParamModule
from openalea.plantik.biotik.apex import Apex
from openalea.plantik.plants.allocation import Allocation



class mylstring(object):

    def __init__(self):
        l = LsysContext()
        l.makeCurrent();
        m1 = ParamModule('A',Apex());
        m2 = ParamModule('A',Apex());
        m3 = ParamModule('A',Apex());
        m4 = ParamModule('A',Apex());
        m5 = ParamModule('A',Apex());
        m6 = ParamModule('A',Apex());
        self.axialtree = AxialTree([m1, m2, m3, m4, m5, m6])


    def set_demand(self,  demands):
        for o, d in zip(self.axialtree, demands):
            o[0].demand = d

    def get_demand(self):
        res =  [x[0].demand for x in self.axialtree]
        return res

    def get_allocated(self):
        res = [x[0].allocated for x in self.axialtree]
        return res

    def reset_allocated(self):
        for x in self.axialtree:
            x[0].allocated = 0

def test_proportional():
    allocation = Allocation(model='proportional', dt=1)
    a = mylstring()
    res = a.get_demand()
    assert sum(res) == 12
    #not enough resource (6) so all 6 apices should obtain 1
    allocated = allocation.compute_allocation(a.axialtree, 6.)
    assert sum(a.get_allocated())==6
    # non uniform demand 
    a.set_demand([2, 1, 1, 1, 1, 0])
    a.reset_allocated()
    allocated = allocation.compute_allocation(a.axialtree, 6.)
    assert a.get_allocated() == [2, 1, 1 ,1 ,1 , 0]
    # too much resource, 
    a.set_demand([2, 1, 1, 1, 1, 0])
    a.reset_allocated()
    allocated = allocation.compute_allocation(a.axialtree, 12)
    assert a.get_allocated() == [2, 2, 2 ,2 ,2 , 0]

def test_proportional2():
    allocation = Allocation(model='proportional_test_without_min', dt=1)
    a = mylstring()
    res = a.get_demand()
    assert sum(res) == 12
    #not enough resource (6) so all 6 apices should obtain 1
    allocated = allocation.compute_allocation(a.axialtree, 6.)


def test_wrong_model():
    allocation = Allocation(model='dummy', dt=1)
    a = mylstring()
    res = a.get_demand()
    assert sum(res) == 12
    #not enough resource (6) so all 6 apices should obtain 1
    try:
        allocated = allocation.compute_allocation(a.axialtree, 6.)
        assert False
    except:
        assert True


def hierarchical(demands=[2,2,2,2,2,2]):
    allocation = Allocation(model='hierarchical', dt=1)
    a = mylstring()
    a.set_demand(demands)
    res = a.get_demand()
    print res
    assert sum(res) == sum(demands)
    print 'Individual demands:', a.get_demand()
    R = 6
    print 'Total resource R=', R
    #not enough resource (6) so all 6 apices should obtain 1
    allocated = allocation.compute_allocation(a.axialtree, R)
    print 'Individual allocation:', a.get_allocated()

def test_hierarchical():
    hierarchical([2,2,2,2,2,2])
    hierarchical([2,1,1,1,1,1])
    hierarchical([2,1,1,0,0,0])

def test_hierarchical_perturbation(demands=[2,2,2,2,2,2]):
    allocation = Allocation(model='hierarchical', dt=1, perturbation=0.1)
    a = mylstring()
    a.set_demand(demands)
    res = a.get_demand()
    print res
    assert sum(res) == sum(demands)
    print 'Individual demands:', a.get_demand()
    R = 6
    print 'Total resource R=', R
    #not enough resource (6) so all 6 apices should obtain 1
    allocated = allocation.compute_allocation(a.axialtree, R)
    print 'Individual allocation:', a.get_allocated()



class test_allocation():

    def __init__(self):
        self.allocation = Allocation(model='hierarchical', dt=1, perturbation=0.1)
        self.lstring = mylstring()

    def test_attribute(self):
        assert self.allocation.lstring == None

    def test_compute_allocation(self):
        self.allocation.compute_allocation(self.lstring.axialtree, 10.)
