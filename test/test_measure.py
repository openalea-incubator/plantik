from openalea.plantik.biotik.measure import Measure


def test_measure():

    m = Measure(radius=1)
    assert m.radius == 1

def test_measure_print():
    m = Measure(radius=1)
    assert m.__str__()=='radius:1\n'

