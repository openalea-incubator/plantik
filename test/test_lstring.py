from openalea.plantik.tools.lstring import *




def test_lstring_extract():
    lstring = create_test_lstring()
    newl = lstring_extract(lstring, labels=['L', 'P', 'A','I', 'B', 'U'])
    assert len(lstring) == len(newl)


    newl = lstring_extract(lstring, labels=['dummy'])

    assert len(newl) == 0 
    assert len(lstring_extract(lstring, labels=['L'])) == 3
