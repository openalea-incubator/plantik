#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. module:: growthunit
    :synopsis: GrowthUnit utilities and classes
.. currentmodule:: openalea.plantik.biotik.growthunit

.. topic:: summary

    GrowthUnit utilities and classes

    :Code: mature
    :Documentation: completed
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from vplants.plantik.biotik.growthunit import *

.. testsetup::

    from vplants.plantik.biotik.growthunit import *

"""
from vplants.plantik.biotik.component import *
from vplants.plantik.biotik.collection import CollectionVariables, SingleVariable
from vplants.plantik.biotik.context import Context



class GrowthUnit(ComponentInterface):
    """Specialised version of :class:`~openalea.plantik.biotik.component.ComponentInterface`
    dedicated to GrowthUnits.

    GrowthUnit class does not compute anything special, it mainly serves as 
    storage for various information. The update of the length and radius is 
    made in the :mod:`~openalea.plantik.biotik.plant` module with the
    method :meth:`~openalea.plantik.biotik.plant.Plant.growth_unit_update`

    :Example:

    >>> from vplants.plantik.biotik.growthunit import *
    >>> gu = GrowthUnit()
    >>> gu.radius
    0.001
    >>> gu.variables.radius.values
    [0.001]

    :plotting:

    If the store_data is True, the you can plot results either from the class instance :meth:`plot`
    of from the variables stored in :attr:`variables`. The former being less flexible with only `plot` of
    radius versus age, length versus age, length versus radius. And the latter provides plot of variable
    versus age (the same as before) as well as histograms.

    :Notation:

    * age of a growth unit is denoted :math:`t_a^{(gu)}`

    .. csv-table:: **Notation related to** :class:`~openalea.plantik.biotik.growthunit.GrowthUnit`
        :header: Name, symbol, default value, type
        :widths: 15,20,20, 20
        
        radius_min     , :math:`r^{(gu)}_{min}`    ,  0.001 (same as internode min radius), user parameter
        radius         , :math:`r^{(gu)}`          ,  -                             , attribute
        length         , :math:`l^{(gu)}`          ,    length of the growth unit    ,attribute
        # internode    , :math:`N_{(i)}^{(gu)}`    , 0 by default                    ,attribute
        latency        , :math:`T^{(gu)}_{latency}`, default is 6 days                , user parameter
        

    """
    def __init__(self, birthdate=None, id=None, min_radius=0.001, latency=6, 
                 store_data=True):
        """**Constructor**

        :param datetime.datetime birthdate:
        :param int id:
        :param float min_radius: in meters
        :param int store_data:
        :param float latency: number of days of latency before stopping the gu.

        :attributes:
            * :attr:`length`: total length of the growth unit in meters
            * :attr:`radius`:  radius of at the base of the growth unit (see plants module)
            * those inherited by :class:`~openalea.plantik.biotik.component.ComponentInterface`:
                * :attr:`age`
                * :attr:`demand`
                * :attr:`birthdate`
                * :attr:`state` set to 'growing' by default in the constructor. Then, the :meth:`update`
                  may set to it to 'stopped' if no changement has been done for a duration> :attr:`latency`.
            * :attr:`internode_counter`: number of internodes in the growth unit
            * :attr:`variables` is a :class:`CollectionVariables` instance containing the :attr:`age`,
              :attr:`radius` and :attr:`length` at each time step



        .. note:: when creating a gu, :attr:`state` is by definition set 
            to 'growing'.
        """
        self.context = Context()
        # when creating a gu, it is by definition in a growing state.
        ComponentInterface.__init__(self, label='GrowthUnit', 
                                    birthdate=birthdate, id=id, state='growing')

        self.store_data = store_data

        self._length = 0.
        self._radius = min_radius
        self._latency = latency
        self._internode_counter = 0.

        self.variables = CollectionVariables()
        self.variables.add(SingleVariable(name='age', unit='days', 
                                          values=[self.age.days]))
        self.variables.add(SingleVariable(name='length', unit='meters', 
                                          values=[self.length]))
        self.variables.add(SingleVariable(name='radius', unit='meters', 
                                          values=[self.radius]))

        self.__step_without_growing = 0

    def _getInternode(self):
        return self._internode_counter
    def _setInternode(self, value):
        prev = self._internode_counter
        self._internode_counter = value
        if self._internode_counter == prev:
            self.__step_without_growing += 1
        else:
            self.__step_without_growing = 0
    internode_counter = property(_getInternode, _setInternode, None, 
                                 "getter/setter to the GU radius")

    def _getRadius(self):
        return self._radius
    def _setRadius(self, value):
        if value< self._radius:
            raise ValueError("radius decreased in GU update!!")
        self._radius = value
    radius = property(_getRadius, _setRadius, None, 
            doc="getter/setter to the growth unit radius. Cannot decrease !")

    def _getLength(self):
        return self._length
    def _setLength(self, value):
        self._length = value
    length = property(_getLength, _setLength, None, "getter/setter to the GU length")

    def _getLatency(self):
        return self._latency
    latency = property(_getLatency, None, None, "getter to the GU latency")



    def update(self, dt):
        """Update the GU characteristics at each time step

        This function updates the :attr:`age` of the component by **dt**
        
        Moreover, if **store_data** is True, the age, length and radius 
        :attr:`variables` are also stored at each time step as long as 
        the growth unit state is *growing*, which is True when 
        the attribute :attr:`__step_without_growing` times :math:`\Delta t`
        is greater than the latency :math:`T_{latency}^{(gu)}`
          
        Tasks: 
        
        #. increment age by dt
        #. calls :meth:`demandCalculation`, :meth:`resourceCalculation` and 
           :meth:`computeLivingCost`
        #. store age into variables.age
        #. store radius into variables.radius
        #. store length into variables.length


        :param float dt: in days 

        
        """
        super(GrowthUnit, self).update(dt)
        self.demandCalculation()
        self.resourceCalculation()
        if self.store_data is True and self.state == 'growing':
            self.variables.age.append(self.age.days)
            self.variables.length.append(self.length)
            self.variables.radius.append(self.radius)
        if self.__step_without_growing * dt > self.latency:
            self.state = 'stopped'


    def demandCalculation(self, **kargs):
        """no demand for a gu (i.e., zero)"""
        pass

    def resourceCalculation(self, **kargs):
        """no resource for a gu (i.e., zero)"""
        pass

    def plot(self, variables=['radius', 'length'], show=True, grid=True, **args):
        """plot some results

        :param list variables: plot results related to the variables provided
        :param bool show: create but do not show the plot (useful for test, saving)
        :param  args: any parameters that pylab.plot would accept.

        .. plot::
            :width: 30%
            :include-source:

            from vplants.plantik.biotik.growthunit import *
            b = GrowthUnit()
            for v in range(1,100):
                b.radius = (v*0.001)**0.5
                b.length = v*0.01
                if v>50:
                    b.state = 'stopped'
                b.update(1)
            b.plot('radius')

        """
        self.variables.plot(variables=variables, show=show, grid=grid, **args)


    def __str__(self):
        from vplants.plantik.tools.misc import title
        res = super(GrowthUnit, self).__str__()
        res += self.context.__str__()
        res += self.variables.__str__()
        res += title('other growth unit attributes')
        res += '\n'
        for name in self.variables.keys():
            res += "%s = %s" % (name, getattr(self, name))
            res += '\n'

        return res
