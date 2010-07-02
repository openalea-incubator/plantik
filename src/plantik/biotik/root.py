from openalea.plantik.biotik.component import ComponentInterface



class Root(ComponentInterface):
    """Root class
    
    Specialised version of ComponentInterface dedicated to Root.
    
    This root class is an abstract root component that is used
    to store global information such as total resource of a plant. 
    
    
    """
    def __init__(self, initial_resource, birthdate=None, 
                 id=None, min_radius=0.001):
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
        ComponentInterface.__init__(self, label='Root', birthdate=birthdate, id=id)
        
        self._radius = min_radius
        self._R = initial_resource

    
    def _getRadius(self):
        return self._radius
    def _setRadius(self, value):
        self._radius = value
    radius = property(_getRadius, _setRadius, None, "Radius's Docstring")
        
        
    def _getR(self):
        return self._R
    def _setR(self, R):
        self._R = R
    R = property(_getR, _setR, None, doc="returns global resource.")
   
    def update(self, dt):
        """Update the root characteristics
        
        :param dt: in days
        """
        super(Root, self).update(dt)
        self._radius *= 1.0

        # if hypothesis is to reset the root ressource.
        
    def demand_calculation(self, **kargs):
        len(kargs)
        self.demand = 0
        return self.demand
    def resource_calculation(self, **kargs):
        len(kargs)
        self.resource = 0
        return self.resource

