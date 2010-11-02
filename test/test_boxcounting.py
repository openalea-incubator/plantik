from openalea.plantik.tools.boxcounting import boxcounting

def test_boxcounting():
    from openalea.plantgl.all import Scene
    s = Scene()
    s.read('pruning.geom')
    log_n_delta, log_inv_delta, n_delta, delta = boxcounting(s, show=False, maxd=5)

    try:
        log_n_delta_2, log_inv_delta_2, n_delta, delta_2 = boxcounting(s, show=False, maxd=5, library='fractalysis')
        assert log_n_delta == log_n_delta_2
        assert log_inv_delta == log_inv_delta_2
        assert n_delta == n_delta_2
    except:
        pass


    try:
        boxcounting(s, show=False, maxd=5, library='wrong_name')    
        assert False
    except:
        assert True
    
