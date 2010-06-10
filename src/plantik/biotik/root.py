from openalea.plantik.biotik.component import ComponentInterface


class Root(ComponentInterface):
    """Root class
    
    Specialised version of ComponentInterface dedicated to Root.
    
    This root class is an abstract root component that is used
    to store global information such as total resource of a plant. 
    
    
    """
    def __init__(self, initial_resource, label='Root', birthdate=None, id=None):
        """
        
        :param initial_resource: the amount of initial resource/biomass of 
            the root
        :param label: default is 'Root'
        :param birthdate:
        :param id:
        
        :attributes:
            * those inherited by SimulationInterface: :attr:`age`, 
              :attr:`demand`, :attr:`birthdate`, ...
            * :attr:`radius`
            * :attr:`R` the global resource available in the root system
        """
        ComponentInterface.__init__(self, label, birthdate, id=id)
        
        self.radius=0.001
        self._R = initial_resource
        
        
    def _get_R(self):
        return self._R
    def _set_R(self, R):
        self._R = R
    R = property(fget=_get_R, fset=_set_R, 
                 doc="returns global resource.")
   
    def update(self, dt):
        """Update the root characteristics
        
        :param dt: in days
        """
        super(Root, self).update(dt)
        self.radius *= 1.0

        # if hypothesis is to reset the root ressource.
        
    def demand_calculation(self, **kargs):
        self.demand = 0
        return self.demand
    def resource_calculation(self, **kargs):
        self.resource = 0
        return self.resource

