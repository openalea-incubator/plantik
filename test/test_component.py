"""test for biotik.ComponentInterface

:Author: Thomas Cokelaer <thomas cokelaer at sophia inria fr>
"""
from openalea.plantik.biotik.component import ComponentInterface
import datetime

def test_component_interface():

    date = datetime.datetime.now()
    c = ComponentInterface('Apex', date)

    # check that arguments are readable and correct
    assert c.age.days == 0
    assert c.label == 'Apex'
    assert type(c.birthdate) == datetime.datetime
    assert c.id == None
    assert c.state == None
    assert c.demand == 0
    assert c.resource == 0
    assert c.maintenance == 0
    #check setter of state
    c.state = 'test'
    assert c.state == 'test'
    c.demand = 1
    c.resource = 1
    c.maintenance = 1
    assert c.demand == 1
    assert c.resource == 1
    assert c.maintenance == 1
    # test

    # test str
    print c

    for attr in ['age', 'label','state','birthdate','id']:

        try:
            c.__setattr__(attr, 1)
        except:
            assert True

    try:
        c.demand_calculation()
    except:
        assert True

    try:
        c.resource_calculation()
    except:
        assert True

    try:
        c.maintenance_calculation()
    except:
        assert True

    # test update function
    c.update(dt=1)
    assert c.age.days == 1
