from openalea.plantik.biotik.component import ComponentInterface
from openalea.plantik.tools.plot import CheckVariables



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

        self.variables = ['age', 'radius', 'length']
        for var in self.variables:
            self.__setattr__(var+'_v', [])
        self.save_data_product()
        
        #self.radius = 0.

    def save_data_product(self):
        self.age_v.append(self.age.days)
        self.length_v.append(self._length)
        self.radius_v.append(self._radius)


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
        super(Branch, self).update(dt)
        self.save_data_product()

    def demand_calculation(self, **kargs):
        pass

    def resource_calculation(self, **kargs):
        pass

    def plot(self, variables=None, tag='', clf=True, show=True, symbol='-o'):
        import pylab
        _variables = CheckVariables(self.variables, variables)

        if clf is True:
            pylab.figure()
            pylab.clf()
        for variable in _variables:
            if variable not in ['age']:
                pylab.plot(self.age_v, getattr(self, '%s_v' % variable), symbol, label=variable)
                pylab.xlabel('time since birthdate')
                pylab.ylabel('%s of this %s' % (variable, self.label))
                pylab.grid(True)
        if show==True:
            pylab.show()
        pylab.legend()





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




