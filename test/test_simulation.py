from openalea.plantik.simulation.simulation import *

import datetime

def test_simulation():

    # let us create a simulation and check that elapsed days is zero
    sim = Simulation(starting_date=2000, dt=5)
    assert sim.time_elapsed.days == 0
    
    #by default there is an event called 'starting_date' starting 1jan2000. 
    # Let us check its year
    assert sim.events.starting_date.starting_date.year == 2000

    # now, let us add an event
    sim.events.add_event('bud_break', datetime.datetime(2000,4,15), datetime.timedelta(10))

    # and advance to the event starting time
    sim.calendar.dt = 30
    sim.advance()    # jump to jebruary
    sim.advance()    # jump to march
    sim.advance()    # jump to April
    assert sim.time_elapsed.days == 90
    sim.calendar.dt = 5

    sim.advance()    # jump to 5 April
    assert sim.events.bud_break.active == False
    sim.advance()    # jump to 10 April
    assert sim.events.bud_break.active == False
    sim.advance()    # jump to 15 April
    assert sim.events.bud_break.active == True
    sim.advance()    # jump to 20 April
    assert sim.events.bud_break.active == True
    sim.advance()    # jump to 25 April
    assert sim.events.bud_break.active == True
    sim.calendar.dt = 1
    sim.advance()
    assert sim.events.bud_break.active == False

    sim.calendar.dt = 300
    new_year = sim.advance()
    assert new_year == True
    print sim

