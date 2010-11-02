from openalea.plantik.simulation.simulation import *

import datetime

class test_simulation():


    def __init__(self):

        # let us create a simulation and check that elapsed days is zero
        sim = Simulation(starting_date="2000-1-1", dt=5)
        sim.starting_date == datetime.datetime(2000, 1, 1)
        sim = Simulation(starting_date="2000-12-1", dt=5)
        sim.starting_date == datetime.datetime(2000, 12, 1)
        try:
            sim2 = Simulation(starting_date="2000", dt=1)
            assert False
        except:
            assert True
        try:
            sim2 = Simulation(starting_date=['2000'], dt=1)
            assert False
        except:
            assert True
        assert sim.time_elapsed.days == 0
    
        #by default there is an event called 'starting_date' starting 1jan2000. 
        # Let us check its year
        assert sim.events.starting_date.starting_date.year == 2000

        sim = Simulation(starting_date=2000, dt=5)
        sim.starting_date == datetime.datetime(2000, 1, 1)
        self.sim = sim

        assert sim.ending_date == datetime.datetime(2010,1,1)

        sim.dt = 2

    def test_events(self):

        # now, let us add an event
        self.sim.events.add_event('bud_break', datetime.datetime(2000,4,15), datetime.timedelta(10))

        # and advance to the event starting time
        self.sim.calendar.dt = 30
        self.sim.advance()    # jump to jebruary
        self.sim.advance()    # jump to march
        self.sim.advance()    # jump to April
        assert self.sim.time_elapsed.days == 90
        self.sim.calendar.dt = 5

        self.sim.advance()    # jump to 5 April
        assert self.sim.events.bud_break.active == False
        self.sim.advance()    # jump to 10 April
        assert self.sim.events.bud_break.active == False
        self.sim.advance()    # jump to 15 April
        assert self.sim.events.bud_break.active == True
        self.sim.advance()    # jump to 20 April
        assert self.sim.events.bud_break.active == True
        self.sim.advance()    # jump to 25 April
        assert self.sim.events.bud_break.active == True
        self.sim.calendar.dt = 1
        self.sim.advance()
        assert self.sim.events.bud_break.active == False

        self.sim.calendar.dt = 300
        new_year = self.sim.advance()
        assert new_year == True
        print self.sim

