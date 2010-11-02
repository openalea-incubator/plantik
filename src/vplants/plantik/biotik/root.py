from vplants.plantik.biotik.component import ComponentInterface



class Root(ComponentInterface):
    r"""Specialised version of :class:`~openalea.plantik.biotik.component.ComponentInterface`
    dedicated to Roots.

    :Example:

    >>> from vplants.plantik.biotik.root import *
    >>> i = Root(initial_resource=10)
    >>> i.R
    10
    
    
    This root class is an abstract root component that is used
    to store global information such as total resource of a plant.


    .. deprecated:: 0.2 stored in plants (DARC values)
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

