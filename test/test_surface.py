from openalea.plantik.tools.surface import *

def test_create_surface_leaf():
    smb = createSurface('leaf_surface.s')

def test_wrong_filename():
    try:
        smb = createSurface('dummy.s')
        assert False
    except:
        assert True

