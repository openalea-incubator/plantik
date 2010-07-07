from openalea.plantik.biotik.component import ComponentInterface



class Branch(ComponentInterface):
    """Branch class
    
    Specialised version of ComponentInterface dedicated to Branches.
    

    """
    def __init__(self, birthdate=None, id=None, min_radius=0.001):
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
        ComponentInterface.__init__(self, label='Branch', birthdate=birthdate, id=id)
        
        self._length = 0.
        self._radius = min_radius

    
    def _getRadius(self):
        return self._radius
    def _setRadius(self, value):
        self._radius = value
    radius = property(_getRadius, _setRadius, None, "Radius's Docstring")
    
    def _getLength(self):
        return self._length
    def _setLength(self, value):
        self._length = value
    length = property(_getLength, _setLength, None, "Length Docstring")
      
    def update(self, dt):
        """Update the root characteristics
        
        :param dt: in days
        """
        super(Root, self).update(dt)
        
        
    def demand_calculation(self, **kargs):
        pass
    
    def resource_calculation(self, **kargs):
        pass


class GrowthUnit(ComponentInterface):
    """Branch class
    
    Specialised version of ComponentInterface dedicated to Growth Unit.
    

    """
    def __init__(self, birthdate=None, id=None, min_radius=0.001):
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
        ComponentInterface.__init__(self, label='GrowthUnit', birthdate=birthdate, id=id)
        
        self._length = 0.
        self._radius = min_radius

    
    def _getRadius(self):
        return self._radius
    def _setRadius(self, value):
        self._radius = value
    radius = property(_getRadius, _setRadius, None, "Radius's Docstring")
    
    def _getLength(self):
        return self._radius
    def _setLength(self, value):
        self._radius = value
    length = property(_getLength, _setLength, None, "Length Docstring")
      
    def update(self, dt):
        """Update the root characteristics
        
        :param dt: in days
        """
        super(Root, self).update(dt)
        
        
    def demand_calculation(self, **kargs):
        pass
    
    def resource_calculation(self, **kargs):
        pass


    
    
