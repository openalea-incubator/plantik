from openalea.plantik.tools.mtgtools import *
#from openalea.mtg import *
from openalea.plantik import get_shared_data

class test_MTGTools():

    def __init__(self):
        self.mtgtools = MTGTools() 
        self.mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))

    def test_load(self):
        try:
            g = self.mtgtools.load_pickle('dummy')
            assert False
        except:
            pass

    def test_save(self):
        self.mtgtools.save_pickle('test2.mtg')
        mtg2 = MTGTools()
        mtg2.load_pickle('test2.mtg')
        assert len(self.mtgtools.mtg) == len(mtg2.mtg)
        import os
        os.remove('test2.mtg')

    def test_udpdate(self):
        self.mtgtools.update()

    def test_getBranchLength(self):
        assert len(self.mtgtools.getBranchesLength(order=0))==1
        assert len(self.mtgtools.getBranchesLength(order=1))==8
        assert len(self.mtgtools.getBranchesLength())==9

    def test_getBranchRank(self):
        assert len(self.mtgtools.getBranchesRank(order=0))==1
        assert len(self.mtgtools.getBranchesRank(order=1))==8
        assert len(self.mtgtools.getBranchesRank())==9


    def test_db(self):
        self.mtgtools.createDB()
        self.mtgtools.connectDB()

        # using the standard request:
        result = list(self.mtgtools.requestDB("select id from mtg where label=='B'"))
        # without the iterator, we do the list() internally
        result = self.mtgtools.requestDB("select id from mtg where label=='B'", column="id")
        assert result == [2, 66, 190, 332, 343, 433, 475, 530, 547]

        # this one should fail
        try:
            result = self.mtgtools.requestDB("select id from mtg where label=='B'", column="dummy")
            assert False
        except:
            assert True

        # then, we can use the select, which does not require to know sql syntax

        ids = self.mtgtools.select(order=0, label="B") 
        assert ids == [2]
        ids = self.mtgtools.select(order=1, label="B") 
        assert ids == [66, 190, 332, 343, 433, 475, 530, 547], ids

        ids = self.mtgtools.select(order=1, label="B", scale=1) 
        ids = self.mtgtools.select(label="I", rank = 1)

 
    def test_arealeaves(self):
        assert self.mtgtools.getAreaLeaves() > self.mtgtools.getAreaLeaves(order=0)

    def test_volueinternode(self):
        assert self.mtgtools.getVolumeInternodes() > self.mtgtools.getVolumeInternodes(order=0)


    def test_hist_apex_order(self):
        self.mtgtools.hist_apex_order(show=False)

    def test_set_order_path_rank(self):
        self.mtgtools.set_order_path_rank()

    def test_select_attribute(self):
        U = sum(self.mtgtools.select_attribute("length", label="U", order=0))
        B = sum(self.mtgtools.select_attribute("length", label="B", order=0))
        assert abs(B-U) < 0.0001

    def test_closeDB(self):
        self.mtgtools.connectDB()
        self.mtgtools.closeDB()

    def test_axes(self):
        assert self.mtgtools.get_axes() == [2, 66, 190, 332, 343, 433, 475, 530, 547]

    def test_branch_radius_on_trunk(self):
        self.mtgtools.get_branch_radius_on_trunk()

    def test_branch_length_on_trunk(self):
        self.mtgtools.get_branch_length_on_trunk()

    def test_plot(self):
        self.mtgtools.plot(show=False)


def test_lms():
    assert convert2LMS(0)==1
    assert convert2LMS(0.06)==2
    assert convert2LMS(1)==3
