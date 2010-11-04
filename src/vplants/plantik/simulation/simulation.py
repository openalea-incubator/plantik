#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Simulation module

.. module:: simulation
    :synopsis: Classes to design simulation protocols


.. topic:: simulation.py status

    Classes to design simulation protocols

    :Code: mature
    :Documentation: mature
    :tests: 100 % coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from vplants.plantik.simulation.simulation import *

.. testsetup::

    from vplants.plantik.simulation.simulation import *

"""

import datetime
from vplants.plantik.simulation.calendar import Calendar, Events, Event


class SimulationInterface(object):
    """An abstract base class to design simulations.

    This class put together a :class:`~vplants.plantik.simulation.calendar.Calendar`
    class and a list of events :class:`~vplants.plantik.simulation.calendar.Events`
    to ease management of simulations.

    :param dt: the time step in days (default is 1
    :param starting_date: the starting date (default is year 2000)
    :param ending_date: the ending date (default is year 2010)

    :type starting_date: float or integer
    :type ending_date: float or integer

    :attributes:
        * :attr:`calendar` is an instance of :class:`~vplants.plantik.simulation.calendar.Calendar`
        * :attr:`events` is an instance of :class:`~vplants.plantik.simulation.calendar.Events`
        * :attr:`date` is an instance of :class:`datetime.datetime` (alias
          to calendar.date) and is read-only.
        * :attr:`time_elapsed` is an instance of :class:`datetime.timedelta` and is
          read-only.
        * :attr:`ending_year` read-only.
        * :attr:`dt` read-only. use `calendar.dt` to set another value

    ::

        >>> from vplants.plantik.simulation.simulation import SimulationInterface
        >>> sim = SimulationInterface(dt=10)
        >>> sim.calendar.date.year
        2000
        >>> sim.date
        datetime.datetime(2000, 1, 1, 0, 0)
        >>> import datetime
        >>> sim.events.add_event('test', datetime.datetime(2000,4,15), datetime.timedelta(1))
        >>> sim.advance()
        False
        >>> sim.time_elapsed
        datetime.timedelta(10)

    """
    def __init__(self, dt=1., starting_date=2000., ending_date=2010):

        self._ending_date = self.convert_input_date(ending_date)

        # set up the calendar, must convert the floating year to a date before
        date = self.convert_input_date(starting_date)
        self._starting_date = date
        self.calendar = Calendar(year=date.year, month=date.month, day=date.day,
                                delta_in_days=dt)


        # setup a event list with an example, the starting date
        self.events = Events()
        # we store the beginnin of the simulation as an event.
        self.events.add_event('starting_date', date, datetime.timedelta(1), periodic=False)

        #: read-only attribute (in days using datetime.timedelta)
        self._time_elapsed = datetime.timedelta(0.)

        #: read-only attribute, alias to calendar.date 
        #self._date = self.calendar.date

    def convert_input_date(self, date):
        if type(date) in [float, int]:
            return self.convert_fractional_year_to_date(date)
        elif type(date) == str:
            try:
                date = datetime.datetime.strptime(date, "%Y-%m-%d")
            except:
                raise ValueError("input date does not seem to be in the format year-month-day e.g., 2000-12-30")
            return date
        else:
            raise TypeError("date must be int, float (fractional year) or string format such as 2000-12-30")


    @staticmethod
    def convert_fractional_year_to_date(year):
        """returns a timedelta object given a fractional year

        .. note:: this is a static method

        ::

            Simulation.convert_fractional_year_to_date(2000.5)
            datetime.datetime(2000, 7, 1, 12, 0)

        """
        assert year>=1, "year cannot be less than 1"
        date = datetime.datetime(int(year), 1, 1)
        fraction = (year % 1) *365
        date += datetime.timedelta(fraction)
        return date

    def __str__(self):
        res = "Current time is %s" % str(self._get_date())
        return res

    def _get_starting_date(self):
        return self._starting_date
    starting_date = property(fget=_get_starting_date, doc="getter to starting date")

    def _get_ending_date(self):
        return self._ending_date
    ending_date = property(fget=_get_ending_date, doc="getter to ending date")

    def _get_date(self):
        return self.calendar.date
    date = property(fget=_get_date, doc="returns date from calendar instance")

    def _get_time_elapsed(self):
        return self._time_elapsed
    time_elapsed = property(fget=_get_time_elapsed, 
                            doc="returns time elapsed since simulation began in datetime format")

    def _get_dt(self):
        return self.calendar.dt
    def _set_dt(self, dt):
        self.calendar.dt = dt
    dt = property(fget=_get_dt, fset=_set_dt,
                            doc="returns time step datetime format ")


    def advance(self):
        """increment the calendar time by `dt` and check for events activation

        All events have a starting date and a duration. When the calendar advance,
        we must check whether any events englobe the current time. If so, its `active`
        status is set to True. See :class:`~vplants.plantik.simulation.calendar.Event`
        class for details.

        :returns: True if we switched to a new year while advancing current time by `dt`.
        """
        new_year = self.calendar.advance()
        self._time_elapsed += self.dt

        for event in self.events.events:
            event.isactive(self.date)

        return new_year


class Simulation(SimulationInterface):
    """ a simple simulation protocol.

    Simulation is a specialised form of :class:`SimulationInterface`. See
    :class:`SimulationInterface` for the basic usage.

    Constructor is the same constructor as :class:`~vplants.plantik.simulation.simulation.SimulationInterface` for the time being.
    """
    def __init__(self, dt=1, starting_date=2000., ending_date=2010):
        SimulationInterface.__init__(self, dt=dt, starting_date=starting_date,
            ending_date=ending_date)


