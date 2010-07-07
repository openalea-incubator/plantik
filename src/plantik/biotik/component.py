#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. topic:: component.py status

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: fruit.py 8635 2010-04-14 08:48:47Z cokelaer $
    
.. testsetup:: *

    from openalea.plantik.biotik.component import ComponentInterface
"""
import openalea.plantik.tools.misc as misc
import datetime

class ComponentInterface(object):
    """Common interface to all biological objects

    A component interface should be used to create more specialised objects
    such as internode, leaf, etc. 
    
    Attributes should be read-only as much as possible. The :meth:`update` being
    in charge of accessing the attributes. (see the constructor docstring for
    further details). 
    
   
    Each component must have 3 methods that allows to compute at each time
    step:  
    
        * its demand with :meth:`demand_calculation`
        * its resource with :meth:`resource_calculation`
        * its maintenance cost with :meth:`maintenance_calculation`
        
    Finally, a :meth:`update` method must be implemented. The purpose being
    to update parameter when time step increases. It should be used to update
    the parameters of the components such as its age.
        
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
    def __init__(self, label=None, birthdate=None, id=None, state=None):
        """**Constructor**
           
        :param label: a string that labels the component
        :param birthdate: a datetime.datetime object
        :param age: biological age of the object in days (0 by default) 
        :param id:  id that may be used to identify an object
        :param state: status of the object to be defined by the user.
        
        :attributes:
        
            * :attr:`label`
            * :attr:`birthdate`
            * :attr:`age`
            * :attr:`id`
            * :attr:`state`
            * :attr:`demand`
            * :attr:`resource`
            * :attr:`maintenance` 
        
        
        """
        # set dummy birthdate
        if birthdate==None:
            birthdate = datetime.datetime.now()
            
        assert type(birthdate) == datetime.datetime, \
            "birthdate must be a valid datetime instance"
        assert type(label) == str, \
            "label must be a string"
        
        self._age = datetime.timedelta(0)
        self._birthdate = birthdate
        self._id = id
        self._label = label
        self._state = state
        self._initial_demand = 0.
        self._demand = 0.
        self._resource = 0.
        self._allocated = 0.
        #: maintenace attribute
        self._maintenance = 0.
      
      
    def demand_calculation(self):
        """this function should compute the demand 
        of this component at a given time, according
        to its age or other physiological information.
        """
        raise NotImplementedError()

    def resource_calculation(self):
        """this function should compute the resource 
        provided by this component at a given time, according
        to its age or other physiological information.
        """
        raise NotImplementedError()
    
    def maintenance_calculation(self):
        """this function should compute the amount of 
        resource requied to keep this component alive
        """
        pass
        #raise NotImplementedError()
        

    #read only attributes
    def _get_age(self):
        return self._age
    age = property(fget=_get_age,
                   doc="the age of the component in days")
    
    def _get_label(self):
        return self._label
    label = property(fget=_get_label, 
                     doc="a meaningful label (e.g., Root, Apex")

    def _get_id(self):
        return self._id
    id = property(fget=_get_id, 
                  doc="a unique id to be defined by the user")

    def _get_birthdate(self):
        return self._birthdate
    birthdate = property(fget=_get_birthdate, 
                         doc="birthdate of the component in datetime format")
    
    def _set_state(self, state):
        self._state = state
    def _get_state(self):
        return self._state
    state = property(fget=_get_state, fset=_set_state,
                    doc="state of the component to be specified by the user") 
     
    def _get_demand(self):
        return self._demand
    def _set_demand(self, demand=0):
        self._demand = demand
    demand = property(fget=_get_demand, fset=_set_demand, 
                      doc="demand of the component")
    
    def _get_allocated(self):
        return self._allocated
    def _set_allocated(self, allocated=0):
        self._allocated = allocated
    allocated = property(_get_allocated, _set_allocated, None, 
                      doc="demand of the component")                
                    
    
    def _get_initial_demand(self):
        return self._demand
    initial_demand = property(fget=_get_initial_demand, 
                      doc="initial demand of the component")                
    
    def _get_resource(self):
        return self._resource
    def _set_resource(self, resource):
        self._resource = resource
    resource = property(fget=_get_resource, fset=_set_resource,
                      doc="resource of the component")                
    
    def _get_maintenance(self):
        return self._maintenance
    def _set_maintenance(self, maintenance):
        self._maintenance = maintenance
    maintenance = property(fget=_get_maintenance, fset=_set_maintenance,
                      doc="maintenance cost of the component")                

    def component_summary(self):
        out = misc.title('Basic attributes')
        out += 'Label =    %s\n' % self._label
        out += 'Age =     %s\n' % self._age
        out += 'Id =      %s\n' % self._id
        return out

    def __str__(self):
        return self.component_summary()

    def update(self, dt):
        """update commands
        
        Update the age of the component by dt
        
        :param dt: in days
        """
        if type(dt) == datetime.timedelta:
            self._age += dt
        else:
            self._age += datetime.timedelta(dt)
        