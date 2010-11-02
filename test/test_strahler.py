from openalea.plantik.tools.strahler import *
from openalea.plantik import get_shared_data
from openalea.plantik.tools.mtgtools import MTGTools

def get_mtg():
    mtgtools = MTGTools()
    mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
    mtg = mtgtools.mtg
    return mtg



def test_strahler():
    mtg = get_mtg()
    assert strahler(mtg) == 2
    




