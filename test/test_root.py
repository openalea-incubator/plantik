from openalea.plantik.biotik.root import Root
import datetime

def test_root():

    # 2 is the initial resource
    root = Root(2, birthdate=datetime.datetime.now())
    root.update(1)
    assert root.R == 2
    assert root.age.days == 1
    root.R += 1


    root.demandCalculation()
    root.resourceCalculation()
