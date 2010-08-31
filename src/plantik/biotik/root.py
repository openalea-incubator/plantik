from openalea.plantik.biotik.component import ComponentInterface



class Root(ComponentInterface):
    """Root class

    Specialised version of ComponentInterface dedicated to Root.

    This root class is an abstract root component that is used
    to store global information such as total resource of a plant.


    """
    def __init__(self, initial_resource, birthdate=None):
        """

        """
        ComponentInterface.__init__(self, label='Root', birthdate=birthdate, id=id)
        self._R = initial_resource

    def _getR(self):
        return self._R
    def _setR(self, value):
        self._R = value
    R = property(_getR, _setR, None, doc="returns global resource.")

    def update(self, dt):
        super(Root, self).update(dt)

    def demandCalculation(self):
        return self.demand
    def resourceCalculation(self):
        return self.resource

