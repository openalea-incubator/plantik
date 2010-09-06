from openalea.plantik.tools.convex import *
from openalea.plantik import get_shared_data
from openalea.plantgl.all import Scene

def convex():
    s = Scene()
    s.read('pruning.geom')
    assert len(s) == 740

    leaves = get_leaves_from_scene(s)
    assert len(leaves) == 177

    return leaves


def test_cvxhull():

    leaves = convex()
    s = Scene()
    s+=leaves

    hull = cvxHull(leaves)

    s += hull

def test_surface():
    leaves = convex()
    totalSurface(leaves)

def test_gradient():
    gradient(1) 
