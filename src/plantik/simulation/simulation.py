#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. topic:: simulation.py status

    Provide standard classes to design simulation protocols

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: fruit.py 8635 2010-04-14 08:48:47Z cokelaer $
"""

import datetime
from openalea.plantik.simulation.calendar import Calendar, Events, Event

class SimulationInterface(object):
    """An abstract base class to design simulations.

    This class put together a :class:`~openalea.plantik.simulation.calendar.Calendar`
    class and a list of events :class:`~openalea.plantik.simulation.calendar.Events`
    to ease management of simulations.

    :param dt: the time step in days.
    :param starting_year: the starting year

    :attributes: 
        * :attr:`calendar` is an instance of :class:`~openalea.plantik.simulation.calendar.Calendar`
        * :attr:`events` is an instance of :class:`~openalea.plantik.simulation.calendar.Events`
        * :attr:`date` is an instance of :class:`datetime.datetime` (alias 
          to calendar.date) and is read-only.
        * :attr:`time_elapsed` is an instance of :class:`datetime.timedelta` and is 
          read-only.
        * :attr:`starting_year` read-only.
        * :attr:`dt` read-only. use `calendar.dt` to set another value

    ::

        >>> from openalea.plantik.simulation.simulation import SimulationInterface
        >>> sim = SimulationInterface(dt=10)
        >>> sim.calendar.date.year
        2000
        >>> sim.date
        datetime.datetime(2000, 1, 1, 0, 0)
        >>> import datetime
        >>> sim.events.new_event('test', datetime.datetime(2000,4,15), datetime.timedelta(1))
        >>> sim.advance()
        False
        >>> sim.time_elapsed
        datetime.timedelta(10)

    """
    def __init__(self, dt=1., starting_year=2000):

        # starting year of the simulation
        self._start_year = starting_year
        # set up the calendar with dt in days
        self.calendar = Calendar(year=starting_year)
        self.calendar.dt = dt

        # setup a event list with an example, the starting date
        self.events = Events()
        self.events.new_event('starting_date', datetime.datetime(2000,1,1), datetime.timedelta(1), periodic=False)

        #: read-only attribute (in days using datetime.timedelta)
        self._time_elapsed = datetime.timedelta(0.)

        #: read-only attribute, alias to calendar.date 
        self._date = self.calendar.date

    def __str__(self):
        res = "Current time is %s" % str(self._get_date())
        return res

    def _get_start_year(self):
        return self._start_year
    start_year = property(fget=_get_start_year, 
                    doc="returns startin year of the simu")

    def _get_date(self):
        return self.calendar.date
    date = property(fget=_get_date, 
                    doc="returns date from calendar instance")

    def _get_time_elapsed(self):
        return self._time_elapsed
    time_elapsed = property(fget=_get_time_elapsed, 
                            doc="returns time elapsed since simulation began")

    def _get_dt(self):
        return self.calendar.dt
    def _set_dt(self, dt):
        self.calendar.dt = dt
    dt = property(fget=_get_dt, fset=_set_dt,
                            doc="returns time elapsed since simulation began")


    def advance(self):
        """increment the calendar time by `dt` and check for events activation

        All events have a starting date and a duration. When the calendar advance, 
        we must check whether any events englobe the current time. If so, its `active`
        status is set to True.

        :returns: True if we switched to a new year while advancing current time by dt
        """
        new_year = self.calendar.advance()
        self._time_elapsed += self.dt

        for event in self.events.events:
            event.set_active(self.date)
        if new_year==True:
            return True
        else:
            return False


class Simulation(SimulationInterface):
    """ a simple simulation protocol.
    
    This is an alias to simulationInterface for the time being

    """
    def __init(self, dt=1, starting_year=2000):
        SimulationInterface.__init__(self, dt=dt, starting_year=starting_year)

    

