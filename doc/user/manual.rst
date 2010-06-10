Calendar, Simulation classes
##############################

Generally speaking, when running a simulation, we want to setup the simulation starting time, the time step and the duration. Obviously, may more parameters may be needed such as a list of events and diverse options. 

The interface :class:`~openalea.plantik.simulation.simulation.SimulationInterface` will ease the building of simulations classes for your own purpose. 

For instance, the :class:`~openalea.plantik.simulation.simulation.Simulation` is the simplest simulation protocol defines for now. This class put together a calendar :class:`~openalea.plantik.simulation.calendar.Calendar()` that ease the manipulation of dates and time step, and a list of events :class:`~openalea.plantik.simulation.calendar.Events()`.


In order to declare a simulation instance that has a time step of 1 day and a staring year set to 2000, type::


    from openalea.plantik.simulation.simulation import Simulation
    sim = Simulation(dt=1, starting_year=2000)

and check that the current year and date are correct either directly or by introspecting the calendar::

    >>> sim.date
    datetime.datetime(2000, 1, 1, 0, 0)
    >>> sim.calendar.date
    datetime.datetime(2000, 1, 1, 0, 0)

    >>> sim.calendar.year 
    2000
    >>> sim.calendar.dt
    datetime.timedelta(1)

Then, you can add events as follows::

    sim.events.new_event('bud_break', datetime.datetime(2000,4,15), datetime.timedelta(1))

This event occurs on the 15th of April and last 1 day::

    >>> sim.events.bud_break.duration
    datetime.timedelta(1)

Configuration file
###################

Most of the time a simulation will require a configuration file to store the parameters of the simulation.
This file should

    * be readable
    * easily editable
    * commented

This can be done easily in python using the :mod:`ConfigParser` module. We provide a simple method called :class:`~openalea.plantik.tools.config.read_config_file` that simplify the usage of this module. 

The configuration file should be like the following one::

    # a section is define by  a label in square brackets, followed by its parameters (normal text not python)
    [Section1]
    param1 = 1
    param2 = some text
    param2 = True

    ; another type of comments
    [Section2]
    param4 = 1000.
    param5 = longer text can be split over several line like that with
        an indentation

Let us suppose that this file is called `config.ini`. You can then manipulat it as follows

::

    >>> params = read_config_file('config.ini', ['Section', 'Section2'])
    >>> assert params['param1'] == 1


biotik package and the biological components
##############################################

The biotik package contains modules dedicated to biological components. all components are based upon 
a common class :class:`~openalea.plantik.biotik.component.ComponentInterface` that defines common parameters such as the
age, birthdate, label, state  or id of a component. In addition, common methods are defined to 
compute the demand and resource at a given time. Finally, an :meth:`update` method is used to specify the actions
to be taken at each time step.

So, defining a new component is as simple as::

    from openalea.plantik.biotik.component import ComponentInterface
    class Root(ComponentInterface):
        def __init__(self, label='Root', birthdate=None):
            ComponentInterface.__init__(self, label, birthdate)
            self.TotalResource = 0.

        def update(self, dt):
            super(Root, self).update(dt)
            self.TotalResource += 1













