from openalea.plantik.simulation.calendar import *

import datetime

def test_event():


    try:
        e = Event('test', 2000, duration=10)
    except: 
        assert True

    duration = datetime.timedelta(10)
    e = Event('test', datetime.datetime(2000, 10, 10), duration)
    assert e.name == 'test'
    assert e.date == datetime.datetime(2000, 10, 10)
    assert e.duration == duration
    # test print statement print e
    print e

def test_events():

    e = Events()
    duration = datetime.timedelta(10)

    # test new_event
    e.new_event('test', datetime.datetime(2000, 10, 10), duration)
    assert e.events[0].name == 'test' == e.test.name
    assert e.events[0].date == datetime.datetime(2000, 10, 10)
    assert e.events[0].duration == e.test.duration
    assert e.events[0].duration == duration == e.test.duration

    # test print statement print e
    print e

    # test remove_event
    e.remove_event('test')
    assert len(e.events)==0


def test_calendar():

    try:
        c = Calendar()
    except:
        assert True

    c = Calendar(year=2000)
    assert c.dt.days == 1
    # set a new dt to 100 days
    c.dt = 100
    assert c.dt.days  == 100
    # advance 4 times to a new year
    res = c.advance()
    assert res==False
    res = c.advance()
    assert res==False
    res = c.advance()
    assert res==False
    res = c.advance()
    assert c.year == 2001
    assert res==True
    assert c.year == c._year


    c.year = 2010
    assert c.year == 2010

    c.date = datetime.datetime(2000,1,1)
    assert c.date == datetime.datetime(2000,1,1)

    print c
