"""
.. topic:: summary

    This module implements the :class:`Calendar` class that ease manipulation of 
    dates and time. It also implementes the :class:`Event` that defines a event by a starting 
    time and duration. Naturally, the :class:`Events` is also available, which is a list of events.

    .. sectionauthor:: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>

.. testsetup::

    from openalea.plantik.simulation.calendar import *

"""
import datetime



class Calendar(object):
    """A calendar class

    The Calendar class is a simple calendar that keeps track of the current date. It is
    fully based upon the datetime module.


    Calendar has three main attributes with getter and setters:
        
    There is one main method, called :meth:`advance` that increments the :attr:`date` by :attr:`dt`
    and returns True is a new year has been passed through.


    :Example:

        >>> cal = Calendar(1994)
        >>> cal.year = 2000 # in year
        >>> cal.dt = 30     # in days
        >>> cal.advance()
        False

    """
    def __init__(self,  year=-1, month=1, day=1, delta_in_days=1):
        """**Constructor**

        :param year: valid year 
        :param month: valid month in [1,12]
        :param day: valid day in [1, 31]
        :param delta_in_days: the time step in days


        :attributes:
        
            * :attr:`year`, the current year
            * :attr:`dt` the increment or time step (instance of :class:`datetime.timedelta`
            * :attr:`date` :class:`datetime.datetime`
            
        """

        assert year!=-1 , "you must provide a valid year"
        self._date = datetime.datetime(year=year, month=month, day=day)
        self._dt = datetime.timedelta(days=delta_in_days)
        self._year = year


    def _get_date(self):
        return self._date
    def _set_date(self, date):
        self._date = date
    date = property(fget=_get_date, fset=_set_date, 
                    doc="Set date given a valid datetime.datetime() instance")
 
    def _get_year(self):
        return self._date.year
    def _set_year(self, year):
        self._date = datetime.datetime(year, self._date.month, self._date.day, self._date.hour,
            self.date.minute, self._date.second, self._date.microsecond)
        self._year = year
    year = property(fget=_get_year, fset=_set_year ,doc="set current year.")

    def _get_dt(self):
        return self._dt
    def _set_dt(self, dt):
        self._dt = datetime.timedelta(days=dt)
    dt = property(fget=_get_dt, fset=_set_dt,
                  doc="Set the delta time increment in days (may be non integer)")


    def __str__(self):
        res= 'current date and time= %s\n' % str(self._date)
        res+= 'current increment= %s\n' % str(self._dt)
        return res


    def advance(self):
        """advance the **current_time** by the **increment**

        :return: True if cycle over a new year

        """
        self._date += self._dt
        if self.year > self._year:
            self._year = self.year
            return True
        else:
            return False



class Event(object):
    """create an event

    An event is defined by a name, a starting date, a duration.

    In addition, it may be periodic (over years) or not.

    An event is active if the current date (from a Calendar) is
    between the starting date and the starting_date plus the event duration.

    .. doctest::

        >>> event = Event('test', datetime.datetime(2000,4,15), datetime.timedelta(10))
        >>> event = Event('test', datetime.datetime(2000,4,15), datetime.timedelta(10), periodic=False)
        >>> assert event.duration.days == 10


    """

    def __init__(self, name, date, duration=datetime.timedelta(1), 
                 periodic = True):
        """

        :param name: set a label to an event
        :param date: a starting date (:class:`datetime.datetime` instance)
        :param duration: a duration in days (:class:`datetime.timedelta`),
            default is 1 day
        :param periodic: a boolean to specify if the event is a singl event or 
          is periodic over years
          
        :attributes:
            * :attr:`name`
            * :attr:`date`
            * :attr:`active`
            * :attr:`duration`
            * :attr:`periodic`
 
        """
        assert type(date) == datetime.datetime
        assert type(name) == str
        assert type(duration) == datetime.timedelta

        self._name = name
        self._date = date
        self.active = False
        self.duration = duration
        self.periodic = periodic

    def __str__(self):
        res = self.name + " "
        res+= str(self.date)
        res+= " duration=" + str(self.duration)
        res+= " active=" + str(self.active)
        return res

    def set_active(self, date):
        """

        :param date: a :class:`datetime.datetime` instance
       
        :returns: True if the event span the current date

        """
        assert type(date) == datetime.datetime
        if self._date > date:
            self.active = False
        elif self._date+self.duration < date:
            self.active = False
        else:
            self.active = True

    def _get_name(self):
        return self._name
    name = property(fget=_get_name, doc="returns name of this event.")
    def _get_date(self):
        return self._date
    date = property(fget=_get_date, doc="returns name of this event.")


class Events(object):
    """Define a list of events.
    
    To be used within a :class:`SimulationInterface` class.

    .. doctest::

        >>> events = Events()
        >>> events.new_event('test', datetime.datetime(2000,4,15), datetime.timedelta(10))
        >>> events.new_event('test2', datetime.datetime(2000,4,15), datetime.timedelta(10))
        >>> events.remove_event('test')
        >>> len(events.events)
        1

    .. note:: events are accessible as attribute (with their name) or through the list of events

    .. doctest::

        >>> e = Events()
        >>> e.new_event('test', datetime.datetime(2000,4,15), datetime.timedelta(10))
        >>> assert e.test.duration == e.events[0].duration

    
    """
    def __init__(self):
        """
        
        :attributes:
        
            * :attr:`events` a list of :class:`~openalea.plantik.calendar.Event` instances
        """
        self.events = []

    def __str__(self):
        res = ""
        for event in self.events:
            res +=  event.__str__() + '\n'
        return res

    def new_event(self, name, starting_date, duration, periodic=True):
        """add a new event in the pool of events

        :param name: set a label to an event
        :param date: a starting date (:class:`datetime.datetime` instance)
        :param duration: a duration in days (:class:`datetime.timedelta`)
        :param periodic: a boolean to specify if the event is a singl event or is periodic over years

        """
        e = Event(name, starting_date, duration, periodic=periodic)
        self.events.append(e)
        self.__setattr__(name, e)

    def remove_event(self, name):
        """remove an event from the list of events 

        :param name: the event's name
        """
        self.__delattr__(name)
        for i, event in enumerate(self.events):
            if event.name == name:
                index =i
                break
        del self.events[index]


