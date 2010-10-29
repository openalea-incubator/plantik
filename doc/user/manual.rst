
.. contents::

This user guide present some aspects of the library. The authors strongly suggest the users to also look at the reference guide that contains many examples as well.

.. seealso:: reference guide, see :ref:`plantik_reference`.

Calendar and  Simulation classes: build up a simulation protocol
################################################################
Overview
========
Generally speaking, when running a simulation, we want to setup the simulation starting time, the time step and the duration. Obviously, may more parameters may be needed such as a list of events and diverse options. 

The interface :class:`~openalea.plantik.simulation.simulation.SimulationInterface` will ease the building of simulations classes for your own purpose. 

For instance, the :class:`~openalea.plantik.simulation.simulation.Simulation` is the simplest simulation protocol defines for now. This class put together a calendar :class:`~openalea.plantik.simulation.calendar.Calendar()` that ease the manipulation of dates and time step, and a list of events :class:`~openalea.plantik.simulation.calendar.Events()`.

Define a simulation protocol
============================
In order to declare a simulation instance that has a time step of 1 day and a staring year set to 2000, type:

.. doctest::

    >>> from openalea.plantik.simulation.simulation import Simulation
    >>> sim = Simulation(dt=1, starting_date=2000)

and check that the current year and date are correct either directly or by introspecting the calendar:

.. doctest::

    >>> sim.date
    datetime.datetime(2000, 1, 1, 0, 0)
    >>> sim.calendar.date
    datetime.datetime(2000, 1, 1, 0, 0)

    >>> sim.calendar.year 
    2000
    >>> sim.calendar.dt
    datetime.timedelta(1)

Adding events
==============
Then, you can add events as follows:

.. doctest::

    >>> import datetime
    >>> sim.events.add_event('bud_break', datetime.datetime(2000,4,15), datetime.timedelta(7))

This event occurs on the 15th of April and last 7 days:

.. doctest::

    >>> sim.events.bud_break.duration
    datetime.timedelta(7)

Now, let us suppose that your simulation is going ahead by 3 months and 14 days, in other word that somewhere in the simulation you called the method :meth:`advance` 104 times:

.. doctest::

    >>> dummy = [sim.advance() for x in range(104)]
    >>> sim.date
    datetime.datetime(2000, 4, 14, 0, 0)

In order to check if the event **bud_break** is active, simply type:

.. doctest::

    >>> sim.events.bud_break.active
    False

Now, obviously if you reach a date where the event is active, you''ll get the following results:

.. doctest::

    >>> sim.advance()
    False
    >>> sim.events.bud_break.active
    True

until you advance the simulation by an amount of time that would be outside the event span.

.. note:: the last call to sim.advance returns False. Indeed, the advance function returns a boolean to tell if we reach a new year or not. 

See the modules :mod:`~openalea.plantik.simulation.simulation` and :mod:`~openalea.plantik.simulation.calendar` for more information.





Configuration file
###################

Most of the time a simulation will require a configuration file to store the parameters of the simulation.
This file should

    * be readable
    * easily editable
    * commented

This can be done easily in python using the :mod:`ConfigParser` module. We provide a simple method called :class:`~openalea.plantik.tools.config.ReadConfigFile` based on the ConfigParser module, with the additional property that we can then access to the section and options more easily, as explained here below.

An example of a standard configuration file is::

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

Let us suppose that this file is called `config.ini`. Using the ConfigParser module, you should type::

    >>> import ConfigParser
    >>> config = ConfigParser.ConfigParser()
    >>> config.read('config.ini')
    >>> assert config.get('general', 'verbose') in [True, False]

With ReadConfigFile, the config object is transformed and works as follows::

    >>> from vplants.plantik.tools.config import ReadConfigFile
    >>> config = ReadConfigFile('config.ini')
    >>> assert config.general.verbose in [True, False]

Alternatively, if may already have the configuration file as a ConfigParser instance. If so, use the class ConfigParams, which is
identical to ReadConfigFile but use the instance instead of the filename as input::

    >>> import ConfigParser
    >>> config = ConfigParser.ConfigParser()
    >>> config.read('config.ini')
    >>> from vplants.plantik.tools.config import ConfigParams
    >>> config_params = ConfigParams(config)
    >>>

the original config instance is still accessible in `config.config`. You can also save the original file easily::

    >>> config.save(filename)




Create a new biological components
###################################

The biotik package contains modules dedicated to biological components such as :mod:`~openalea.plantik.biotik.apex`, :mod:`~openalea.plantik.biotik.leaf`, :mod:`~openalea.plantik.biotik.internode`. All components are based upon a common class called :class:`~openalea.plantik.biotik.component.ComponentInterface` that defines common parameters such as the `age`, `birthdate`, `label`, `state`  or `id` of a component. In addition, common methods are defined to compute the demand and resource at a given time. Finally, an :meth:`update` method is used to specify the actions each time the age changes.

Using this abstract base clas, a new component is defined as follows::

    from openalea.plantik.biotik.component import ComponentInterface
    class Root(ComponentInterface):
        def __init__(self, label='Root', birthdate=None):
            ComponentInterface.__init__(self, label, birthdate)
            self.TotalResource = 0.

        def update(self, dt):
            super(Root, self).update(dt)
            self.TotalResource += 1

which can be used as follows::

    r = Root()
    r.update(1)




A real example: pruning model in Lpy
##########################################


See share/data/pruning.lpy  Lsystem.






