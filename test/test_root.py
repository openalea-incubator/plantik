from openalea.plantik.biotik.root import Root
import datetime

def test_root():

    # 2 is the initial resource
    root = Root(2, birthdate=datetime.datetime.now())
    root.update(1)
    assert root.R == 2
    assert root.age.days == 1
    assert root.radius == 0.001
    root.radius *= 2.
    assert root.radius == 0.002
    root.R += 1


    root.demand_calculation()
    root.resource_calculation()
