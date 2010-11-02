from openalea.plantik.simulation.calendar import *

import datetime

def test_default_event():
    starting_date = datetime.datetime(2000, 10, 10)
    duration = datetime.timedelta(10)
    e = Event('test', starting_date, duration)
    assert e.name == 'test'
    assert e.starting_date == datetime.datetime(2000, 10, 10)
    assert e.duration == duration
    # test print statement print e
    print e

    e.duration = 20
    assert e.duration.days == 20

def test_non_periodic_event():
    starting_date = datetime.datetime(2000, 10, 10 )
    duration = datetime.timedelta(10)
    e = Event('test', starting_date, duration, periodic=False)

    date = datetime.datetime(2000,10,10)
    assert e.isactive(date) == True

    date = datetime.datetime(2000,10,15)
    assert e.isactive(date) == True

    date = datetime.datetime(2000,10,20)
    assert e.isactive(date) == True
    
    date = datetime.datetime(2000,10,21)
    assert e.isactive(date) == False
    
    # one year later, the event is not active anymore
    date = datetime.datetime(2001,10,15)
    assert e.isactive(date) == False

def test_periodic_event():
    starting_date = datetime.datetime(2001, 10, 10 )
    duration = datetime.timedelta(10)
    e = Event('test', starting_date, duration)

    date = datetime.datetime(2001,10,10)
    assert e.isactive(date) == True

    date = datetime.datetime(2001,10,15)
    assert e.isactive(date) == True

    date = datetime.datetime(2001,10,20)
    assert e.isactive(date) == True
    
    date = datetime.datetime(2001,10,21)
    assert e.isactive(date) == False
    # one year later, event is active again
    date = datetime.datetime(2002,10,15)
    assert e.isactive(date) == True

    #particular case of periodic event that occu on feb 29 
    date = datetime.datetime(2004,2,29)
    assert e.isactive(date) == False
    

def test_events():

    e = Events()
    duration = datetime.timedelta(10)

    # test new_event
    e.add_event('test', datetime.datetime(2000, 10, 10), duration)
    assert e.events[0].name == 'test' == e.test.name
    assert e.events[0].starting_date == datetime.datetime(2000, 10, 10)
    assert e.events[0].duration == e.test.duration
    assert e.events[0].duration == duration == e.test.duration
    assert e.names == ['test']
    assert len(e) == 1
    assert len(e.events) == len(e)

    # test print statement print e
    print e
    
    #test the getitem
    assert e[0]  == e.events[0]

    # test remove_event
    e.remove_event('test')
    assert len(e.events)==0


def test_calendar_attributes():

    c = Calendar(2000,12,1)
    assert c.year == 2000
    assert c.month == 12
    assert c.day == 1

    c.year = 2001
    assert c.year == 2001
    c.month = 2
    assert c.month == 2
    c.day = 10
    assert c.day == 10

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
