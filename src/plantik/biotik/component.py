#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""components module

.. module:: components
    :synopsis: Abstract base class to all biological components

.. topic:: component.py status

    Abstract base class to all biological components

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.biotik.component import *

.. testsetup:: *

    from openalea.plantik.biotik.component import ComponentInterface
"""
from openalea.plantik.tools import misc
import datetime


class ComponentInterface(object):
    """Common interface to all biological objects

    This abstract class provides facilities for user to build up more
    complex biological objects such as internodes and leaves.

    A few attributes are provided, which should be read-only as much as possible. The
    attributes available are explained in the constructor documentation here below. For
    instance, we have the :attr:`age` and the :attr:`label` attributes.


    There are several methods. The :meth:`update` method should be used to update
    relevant attributes each time the age changes, which explain why the age cannot
    be changed by hand (read-only). This is to prevent user to update the age and
    forget to update related attributes.

    Each component must have 3 methods that allows to compute at each time
    step:

        * its :attr:`demand` with :meth:`demandCalculation`
        * its :attr:`resource` with :meth:`resourceCalculation`
        * its :attr:`livingcost` cost with :meth:`livingcostCalculation`

    By default these 3 methods are not implemented, and any biological components
    must therefore implement them. You can supply the `pass`  keyword if you do
    not known what those functions are. By default, resource, demand and living cost
    will be zero in such case::

        def demandCalculation(self):
            pass

    >>> root = ComponentInterface('Root', datetime.datetime.now(), state='growing')
    >>> root.age
    datetime.timedelta(0)
    >>> root.update(1)
    >>> root.age
    datetime.timedelta(1)
    >>> root.age.days
    1
    >>> root.label
    'Root'
    """
    def __init__(self, label=None, birthdate=None, id=0, state=None):
        """**Constructor**

        :param str label: a string that labels the component (default is None). Must be set.
        :param datetime.datetime birthdate: a datetime.datetime object (default is None)
        :param int id:  id that may be used to identify an object (default is None)
        :param str state: status of the object to be defined by the user (default is None).

        :type age: `datetime.timedelta`

        :attributes:
            * From parameters:
                * :attr:`label`, read-only
                * :attr:`birthdate`, read-only
                * :attr:`id`, read-only
                * :attr:`state`, read-write
            * Others
                * :attr:`age`, read-only. Default value is 0.
                * :attr:`allocated`, read-write attribute to store the allocated resource 
                  at each step (set to 0).
                * :attr:`demand`, read-write attribute to store the demand resource at
                  each time step.
                * :attr:`resource`, read-write attribure to specify the amount of resource 
                  created at each time step.
                * :attr:`livingcost`, read_write attribute to specify the cost to maintain 
                  the component alive.

        .. note:: id is hardly used. In the lpy pruning model for instance.

        .. note:: :attr:`allocated`, :attr:`demand`, :attr:`resource`, :attr:`livingcost`
            are useful for reactive models.

        """
        # set birthdate
        if birthdate != None:
            assert type(birthdate) == datetime.datetime, \
                "birthdate must be a valid datetime instance"
        if label is not None:
            assert type(label) == str, "label must be a string"

        #from parameters
        self._birthdate = birthdate
        self._id = id
        self._label = label
        self._state = state
        #others
        self._age = datetime.timedelta(0)

        # used for more complex applications like transport models.
        # these may be should be move elsewhere, outside of this class. 
        # this is indeed already quite sophisticated.
        self._initial_demand = 0.
        self._demand = 0.
        self._resource = 0.
        self._allocated = 0.
        self._livingcost = 0.


    def demandCalculation(self):
        """this function should compute the demand
        of this component at a given time, according
        to its age or other physiological information.
        """
        raise NotImplementedError()

    def resourceCalculation(self):
        """this function should compute the resource
        provided by this component at a given time, according
        to its age or other physiological information.
        """
        raise NotImplementedError()

    def livingcostCalculation(self):
        """this function should compute the amount of
        resource required to keep this component alive
        """
        pass
        #raise NotImplementedError()


    #read only attributes
    def _get_age(self):
        return self._age
    age = property(fget=_get_age,
                   doc="""getter to the :attr:`age` of the component (datetime.timedelta type). 
                        There is no setter to prevent bad manipulation. Use the 
                        :meth:`update` method instead""")

    def _get_label(self):
        return self._label
    label = property(fget=_get_label,
                     doc="getter to :attr:`label` of the component, Should be a meaningful label (e.g., Root, Apex)")

    def _get_id(self):
        return self._id
    id = property(fget=_get_id,
                  doc="getter to :attr:`id`, a unique id to be defined by the user")

    def _get_birthdate(self):
        return self._birthdate
    birthdate = property(fget=_get_birthdate,
                         doc="getter to :attr:`birthdate` of the component in datetime format")

    def _set_state(self, state):
        self._state = state
    def _get_state(self):
        return self._state
    state = property(fget=_get_state, fset=_set_state,
                    doc="getter/setter of :attr:`state` of the component to be specified by the user")

    def _get_demand(self):
        return self._demand
    def _set_demand(self, demand=0):
        self._demand = demand
    demand = property(fget=_get_demand, fset=_set_demand,
                      doc="getter/settter for the :attr:`demand` of the component at a given step.")

    def _get_allocated(self):
        return self._allocated
    def _set_allocated(self, allocated=0):
        self._allocated = allocated
    allocated = property(_get_allocated, _set_allocated, None,
                      doc="getter/setter to the :attr:`allocated` resource of the component at a given step.")


    def _get_initial_demand(self):
        return self._initial_demand
    def _set_initial_demand(self, d):
        self._initial_demand = d
    initial_demand = property(fget=_get_initial_demand,fset=_set_initial_demand,
                      doc="initial demand of the component")

    def _get_resource(self):
        return self._resource
    def _set_resource(self, resource):
        self._resource = resource
    resource = property(fget=_get_resource, fset=_set_resource,
                      doc="getter/setter of the :attr:`resource` of the component")

    def _get_livingcost(self):
        return self._livingcost
    def _set_livingcost(self, livingcost):
        self._livingcost = livingcost
    livingcost = property(fget=_get_livingcost, fset=_set_livingcost,
                      doc="getter/setter for the :attr:`livingcost` cost of the component")

    def __str__(self):
        out = misc.title('Basic attributes')
        out += 'Label       = %s\n' % self._label
        out += 'Age         = %s\n' % self._age
        out += 'Id          = %s\n' % self._id
        out += 'demand      = %s\n' % self._demand
        out += 'resource    = %s\n' % self._resource
        out += 'allocated   = %s\n' % self._allocated
        out += 'livingcost  = %s\n' % self._livingcost
        return out


    def update(self, dt):
        """update commands

        Update the :attr:`age` of the component by `dt`

        :param float,int,datetime.timedelta dt: dt to add to the :attr:`age` (in days)
        """
        if type(dt) == datetime.timedelta:
            self._age += dt
        else:
            self._age += datetime.timedelta(dt)



