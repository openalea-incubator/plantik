from openalea.plantik.biotik.context import Context

def test_context():

    c = Context(1,1,1)
    assert c.path == 1
    assert c.rank == 1
    assert c.order == 1
    print(c)
