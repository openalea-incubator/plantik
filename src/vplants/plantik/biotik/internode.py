#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""

.. module:: internode
    :synopsis: Internode utilities and classes
.. currentmodule:: openalea.plantik.biotik.internode

.. topic:: summary

    Internode utilities and classes

    :Code: mature
    :Documentation: completed
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: growthunit.py 9458 2010-08-30 05:55:55Z cokelaer $
    :Usage:
        >>> from vplants.plantik.biotik.internode import *

.. testsetup::

    from vplants.plantik.biotik.internode import *

"""
from vplants.plantik.biotik.component import *
from vplants.plantik.biotik.collection import CollectionVariables, SingleVariable
from vplants.plantik.biotik.context import Context
from vplants.plantik.biotik.growth import GrowthFunction
from math import pi
from vplants.plantik.tools.misc import title


class Internode(ComponentInterface):
    r"""Internode. Specialised version of :class:`~openalea.plantik.biotik.component.ComponentInterface`
    
    :Example:

    >>> from vplants.plantik.biotik.internode import *
    >>> i = Internode(store_data=True, growth_rate=1)
    >>> i.radius
    0.001

    Use the :meth:`update` to increment the age of a component. This method
    will take care of updating relevant properties such as the internode length. 

    :plotting:

    If the argument store_data is set to True, attributes such as length are
    stored over time in the :attr:`variables`, which you can plot using either 
    the :meth:`plot` method or from the variables stored in :attr:`variables`. 
    
    .. seealso:: :mod:`~openalea.plantik.biotik.collection` module

    :Notation:

    * the age of the internode is denoted :math:`t_a`

    .. csv-table:: **Notation related to** :class:`~openalea.plantik.biotik.internode.Internode`
        :header: Name, symbol, default value
        :widths: 15,20,20
        
        radius_min          , :math:`r^{(i)}_{min}`       , 0.001 meters
        radius              , :math:`r^{(i)}`             , output
        radius target       , :math:`r^{(i)}_{target}`    , internal
        final length        , :math:`l^{(i)}`             , user input
        length              , :math:`l^{(i)}`             , output
        length_min          , :math:`l^{(i)}_{min}`       , 0.001 meters
        length_max          , :math:`l^{(i)}_{max}`       , 0.03 meters
        maturation          , :math:`T^{(i)}_m`           , 10 days
        growth rate         , :math:`\lambda^{(i)}`       , 1
        nu (logistic)       , :math:`\nu^{(i)}`           , 1
        cambial fraction    , :math:`p_c`                 , 0 %
        volume              , :math:`V^{(i)}`             , output
        density             , :math:`\rho^{(i)}`          , internal
        mass                , :math:`m^{(i)}`             , output
     
    """
    
    
    
    def __init__(self, final_length=0.03, length_max=0.03, length_min=0.001, 
                 cambial_fraction=0., birthdate=None,
                 id=None, maturation=10, radius_min=0.001,
                 growth_rate=1, growth_function='logistic', store_data=False,
                 nu=1):
        r"""**Constructor**


        :param float final_length: final length :math:`l^{(i)_{\rm{final}}}`
        :param float length_max: maximum internode length, :math:`l^{(i)}_{max}` (default is 3cm)
        :param float length_min: maximum internode length, :math:`l^{(i)}_{min}` (default is 0.1cm)
        :param float cambial_fraction: :math:`p_c` (default is 0.) 
        :param datetime.datetime birthdate:
        :param int id:
        :param float maturation: :math:`T^{(i)}_m` (default is 10) 
        :param float radius_min: starting radius of an internode, :math:`r^{(i)}_{min}` (in meters) (default is 0.001)        
        :param str growth_function: linear or logistic (default is logistic) 
        :param float growth_rate: :math:`\lambda` (default is 1)
        :param float nu: :math:`\nu^{(i)}` parameter of the logistic function (default is 1)
        :param int store_data: store length, radius, demand at each time step (default is False)

        .. note:: the growth function is logistic by default, which is identical 
            to a sigmoid function isnce :math:`\nu=1` and :math:`\lambda=1`.
            
        
        :attributes:
            * :attr:`length`: internode length
            * :attr:`radius`:  internode radius (supposed the same from base to top)
            * :attr:`target_radius`:  at each time step, a pipe model may be computed indicating what the new radius should be.
            *  those inherited by :class:`~vplants.plantik.biotik.component.ComponentInterface`: 
                * :attr:`age`
                * :attr:`demand`
                * :attr:`birthdate`, ...
            * :attr:`mass`
            * :attr:`volume`
    
        """
        self.radius_min = radius_min
        self.length_max = length_max
        self.length_min = length_min
        self.final_length = final_length
        assert final_length >= length_min, 'final length must be greater or equal to min length'
        assert length_max>=length_min, 'max length must be greater or equal to min length'

        self.volume_standard = 3.14159 * self.radius_min**2 * self.length_max
        self.cost_per_metamer = 1./(self.radius_min*self.radius_min
                                    *self.length_max * pi)
        
        self.context = Context()
        ComponentInterface.__init__(self, label='Internode', 
                                    birthdate=birthdate, id=id)

        self._radius = self.radius_min
        self._target_radius = self.radius_min
        self._length = GrowthFunction(self.length_min,
                                     self.final_length,
                                     maturation=maturation,
                                     growth_rate=growth_rate, nu=nu,
                                     growth_function=growth_function)

        self.store_data = store_data

        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', 
                                          values=[self.age.days]))
        self.variables.add(SingleVariable(name='length', unit='meters', 
                                          values=[self.length]))
        self.variables.add(SingleVariable(name='radius', unit='meters', 
                                          values=[self.radius]))
        #self.variables.add(SingleVariable(name='demand', 
        #    unit='biomass unit', values=[self.demand]))
        self.variables.add(SingleVariable(name='living_cost', 
                                          unit='biomass unit', 
                                          values=[self.livingcost]))

        self.demand_coeff = 0.
        self.density = 1.
        
        assert cambial_fraction <= 1 and cambial_fraction >= 0
        self._mu = cambial_fraction  # % of cambial layer alive

    def __str__(self):
        res = super(Internode, self).__str__()
        res += self.context.__str__()
        res += self.variables.__str__()
        res += title('other attributes')
        return res

    def resourceCalculation(self):
        """No resource in an internode. 

        For now, it is not used (r=0)
        """
        self.resource = 0.
        return self.resource

    def demandCalculation(self, **kargs):
        """demand of the internode

        For now, this is not used (i.e., d=0)
        """
        #demand_coeff is zero, so d=0
        self.demand = self.volume * self.demand_coeff  
        return self.demand

    def _getVolume(self):
        """Returns total internode volume

        .. math::

            \pi r^2 \\times l^{(i)}
        """        
        return pi * self.radius * self.radius * self.length
    volume = property(_getVolume, None, None)
    
    def _getdVolume(self):
        r"""Retuns the volume that is not yet built 
        
        .. seealso:: :attr:`target_radius`
        
        .. math::
    
            dV = \pi l^{(i)} \left( r_{\rm{target}}^2  -  r^2  \right)
        
        """
        return pi * (self._target_radius * self._target_radius - 
                     self.radius * self.radius) * self.length
    dvolume = property(_getdVolume, None, None)

    def _getMass(self):
        r"""returns the mass of the internode
        
        .. math:: 
        
            m^{(i)} = V^{(i)}  \rho^{(i)}
            
        """
        return self.density * self.volume
    mass = property(_getMass, None, None)

    def _getRadius(self):
        return self._radius
    def _setRadius(self, radius):
        if radius< self._radius:
            raise ValueError("radius decreased in internode !!")
        self._radius = radius
    radius = property(_getRadius, _setRadius, None, doc="internode radius. Cannot decrease !")
    
    def _getTargetRadius(self):
        return self._target_radius
    def _setTargetRadius(self, target_radius):
        self._target_radius = target_radius
    target_radius = property(_getTargetRadius, _setTargetRadius, None, doc=r"""
    Target radius :math:`r_{\rm{target}}` that the internode tend to reach
    
    This is used by the pipe model.
    
    
    """)


    def _getLength(self):
        return self._length.growthValue(self.age.days)
    length = property(_getLength, None, None, 
                      doc="internode length :math:`l^{(i)}`")

    def update(self, dt):
        """Update function

        This update function performs the following tasks:

        #. increment age by dt
        #. calls :meth:`demandCalculation`, :meth:`resourceCalculation` and 
           :meth:`computeLivingCost`
        #. store age :attr:`variables`
        #. store length in :attr:`variables`
        #. store radius in :attr:`variables`
        

        :param float dt: 

        .. note:: when maturation is reached, length is not stored any more
        """

        super(Internode, self).update(dt)
        self._compute_livingcost(dt)
        self.demandCalculation()
        self.resourceCalculation()
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
        self.livingcost *= self.cost_per_metamer * dt


    def plot(self, variables=['radius', 'length', 'living_cost'], 
             show=True, grid=True, **args):
        """plot radius, length and living cost over time

        :param list variables: plot results related to the variables provided
        :param bool show: create but do not show the plot (useful for test, saving)
        :param  args: any parameters that pylab.plot would accept.
        
        
        .. plot:: 
            :include-source:
            
            from pylab import *
            from vplants.plantik.biotik.internode import Internode
            i = Internode(store_data=True)
            for v in range(1,30):
                i.update(1)
            i.plot('length')
            
        .. note:: Although, the iteration went over 30 days, the plot shows only 10
            days because the internode reaced maturity after 10 days. 
        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)

