from openalea.plantik.tools.boxcounting import boxcounting

def test_boxcounting():
    from openalea.plantgl.all import Scene
    s = Scene()
    s.read('pruning.geom')
    log_n_delta, log_inv_delta, n_delta, delta = boxcounting(s, show=False)
