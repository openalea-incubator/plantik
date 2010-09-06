from openalea.plantik.biotik.context import Context

def test_context():

    c = Context()
    assert c.height == None
    assert c.rank == None
    assert c.order == None
    print(c)

    c.height = 2
    c.order = 2
    c.rank  = 2

