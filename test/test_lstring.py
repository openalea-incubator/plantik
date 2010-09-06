from openalea.plantik.tools.lstring import *
from lstring import create_lstring




def test_lstring_extract():
    lstring = create_lstring()
    newl = lstring_extract(lstring, labels=['L', 'P', 'A','I', 'B', 'U'])
    assert len(lstring) == len(newl)


    newl = lstring_extract(lstring, labels=['dummy'])

