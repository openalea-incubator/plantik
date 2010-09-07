#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Internode module

.. module:: internode
    :synopsis: Internode utilities and classes

.. topic:: summary

    Internode utilities and classes

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: growthunit.py 9458 2010-08-30 05:55:55Z cokelaer $
    :Usage:
        >>> from openalea.plantik.biotik.internode import *

.. testsetup::

    from openalea.plantik.biotik.internode import *

"""
from openalea.plantik.biotik.component import *
from openalea.plantik.biotik.collection import CollectionVariables, SingleVariable
from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.growth import GrowthFunction
from math import pi
from openalea.plantik.tools.misc import title


class Internode(ComponentInterface):
    """Internode class

    Specialised version of :class:`~openalea.plantik.biotik.component.ComponentInterface`
    dedicated to Internodes.

    .. warning:: 

        If the parameter store_data is True, then the :attr:`variables` attributes will store 
        the length, radius and age at each time step, which may be costly. It is set to false by
        default.

    :Example:

    >>> from openalea.plantik.biotik.internode import *
    >>> i = Internode(store_data=True)
    >>> i.radius
    0.001
    >>> i.variables.radius.values
    [0.001]


    :plotting:

    If the store_data is True, the you can plot results either from the class instance :meth:`plot`
    of from the variables stored in :attr:`variables`. The former being less flexible with only `plot` of
    radius versus age, length versus age, length versus radius. And the latter provides plot of variable
    versus age (the same as before) as well as histograms.


    .. todo:: this doc. explaine the growthFunction ?

    .. todo:: radius_min, length_max and min must be parameters of the constructor. 
    """
    radius_min = 0.001
    length_max = 0.03
    length_min = 0.001
    cost_per_metamer = 1./(radius_min*radius_min*length_max * pi)
    volume_standard = 3.14159 * radius_min**2 * length_max
    def __init__(self, length_max=length_max,
                 cambial_fraction=0., birthdate=None,
                 id=None, maturation=10,
                 growth_rate=0.5, growth_function='logistic', store_data=False):
        """**Constructor**

        :param float length_max:
        :param float cambial_fraction:
        :param datetime.datetime birthdate:
        :param int id:
        :param float min_radius: in meters
        :param int store_data:
        :param float maturation:
        :param float growth_rate:
        :param str growth_function: linear or logistic

        :attributes:
            * :attr:`length`: total length
            * :attr:`radius`:  radius of the internode (supposed the same from base to top)
            * :attr:`target_radius`:  at each time step, a pipe model may be computed indicating what the new radius should be.
            *  those inherited by :class:`~openalea.plantik.biotik.component.ComponentInterface`: 
            * :attr:`age`, :attr:`demand`, :attr:`birthdate`, ...
            * :attr:`mass`
            * :attr:`volume`

        .. todo:: cambial fraction, possible other parameters: wood density

        """
        self.context = Context()
        ComponentInterface.__init__(self, label='Internode', birthdate=birthdate, id=id)

        self._radius = Internode.radius_min
        self._target_radius= Internode.radius_min
        self._length = GrowthFunction(Internode.length_min,
                                     length_max,
                                     maturation=maturation,
                                     growth_rate=growth_rate,
                                     growth_function=growth_function)

        self.store_data = store_data

        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', values=[self.age.days]))
        self.variables.add(SingleVariable(name='length', unit='meters', values=[self.length]))
        self.variables.add(SingleVariable(name='radius', unit='meters', values=[self.radius]))
        #self.variables.add(SingleVariable(name='demand', unit='biomass unit', values=[self.demand]))
        self.variables.add(SingleVariable(name='living_cost', unit='biomass unit', values=[self.livingcost]))

        self.demand_coeff = 0.
        self.density = 1.
        #self.growing = True
        assert cambial_fraction<=1 and cambial_fraction>=0
        self._mu = cambial_fraction  # % of cambial layer

    def __str__(self):
        res = super(Internode, self).__str__()
        res += self.context.__str__()
        res += self.variables.__str__()
        res += title('other attributes')
        return res

    def resourceCalculation(self):
        """No resource in an internode. 

        returns 0. and set the resource to 0.
        """
        self.resource = 0.
        return self.resource

    def demandCalculation(self, **kargs):
        """ calculate demand as a function of dV

        At each step iteration, there is a need for resources to build up a new
        cambial layer.
        """
        self.demand = self.volume * self.demand_coeff  #TODO good dimension volume versus coeff
        return self.demand

    def _getVolume(self):
        return pi * self.radius * self.radius * self.length
    volume = property(_getVolume, None, None, doc="""returns the internode volume

        .. math::

            \pi r^2 \\times l

        returns the internode volume
        """)

    def _getdVolume(self):
        return pi * (self._target_radius * self._target_radius - self.radius * self.radius) * self.length
    dvolume = property(_getdVolume, None, None, doc="""
        returns dv  

        .. math::
    
            \pi r_{\\rm{target}}^2 * l - \pi r^2 * l
        .. todo:: this doc explaine the target_radius""")


    def _getMass(self):
        return self.density * self.volume
    mass = property(_getMass, None, None, doc="returns the internode mass")

    def _getRadius(self):
        return self._radius
    def _setRadius(self, radius):
        if radius< self._radius:
            raise ValueError("radius decreased in internode !!")
        self._radius = radius
    radius = property(_getRadius, _setRadius, None, doc="radius")
    
    def _getTargetRadius(self):
        return self._target_radius
    def _setTargetRadius(self, target_radius):
        self._target_radius = target_radius
    target_radius = property(_getTargetRadius, _setTargetRadius, None, doc="""
        .. todo:: target radius explaination""")


    def _getLength(self):
        return self._length.growthValue(self.age.days)
    length = property(_getLength, None, None, doc="length")


    def update(self, dt):
        """
        :param float dt: delta time to update 
        .. todo:: 

        if maturation is reached, no need to store more length
        """
        super(Internode, self).update(dt)
        self._compute_livingcost(dt)
        if self.store_data is True:
            self.variables.age.append(self.age.days)
            # once maturation is reached, there is not point is storing the 
            # length, which ha reached a maximum 
            if self.age.days <= self._length.maturation:
                self.variables.length.append(self.length)
            self.variables.radius.append(self.radius)

    def _compute_livingcost(self, dt):
        """
        Within an internode, only the external layer requires a livingcost. The external
        layer is comprise between the max radisu R and the min raidus r.

        So, the  cambial volume is equivalent to the volume of an empty cylinder

        This is a volume that equals :math:`\pi h R^2 (2\mu -\mu^2)`.

        where `\mu` is a fraction of R
        """
        self.livingcost = self.volume * self._mu * (2. - self._mu)
        self.livingcost *= Internode.cost_per_metamer * dt


    def plot(self, variables=['radius', 'length', 'living_cost'], show=True, grid=True, **args):
        """plot some results

        :param list variables: plot results related to the variables provided
        :param bool show: create but do not show the plot (useful for test, saving)
        :param  args: any parameters that pylab.plot would accept.
        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)
