#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Branch module

.. module branch
    :synopsis: Branches utilities and classes

.. topic:: summary

    Branches utilities and classes

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.biotik.branch import *

.. testsetup::

    from openalea.plantik.biotik.branch import *

"""
from openalea.plantik.biotik.component import *
from openalea.plantik.biotik.collection import CollectionVariables, SingleVariable
from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.growthunit import GrowthUnit



class Branch(GrowthUnit):
    """Branch class

    A branch class is nothing else than a :class:`~openalea.plantik.biotik.growthunit.GrowthUnit` 
    slightly modified to count the number of growth units. So, indirecly speaking, it is also a 
    specialised version  of :class:`~openalea.plantik.biotik.component.ComponentInterface`.


    :Example:

    >>> from openalea.plantik.biotik.branch import *
    >>> branch = Branch()
    >>> branch.radius
    0.001
    >>> branch.variables.radius.values
    [0.001]


    :plotting:

    If the store_data is True, the you can plot results either from the class instance :meth:`plot`
    of from the variables stored in :attr:`variables`. The former being less flexible with only `plot` of
    radius versus age, length versus age, length versus radius. And the latter provides plot of variable
    versus age (the same as before) as well as histograms.


    .. seealso:: :class:`~openalea.plantik.biotik.growthunit.GrowthUnit`
    """
    def __init__(self, birthdate=None, id=None, min_radius=0.001,
                 order=0, path=1, rank=1, store_data=True):
        """**Constructor**

        see :class:`~openalea.plantik.biotik.growthunit.GrowthUnit` documentation

        In addition, the tribute :attr:`growthunit_counter` is set and serve to store the number of 
        growth unit in a branch, if required.
        """
        GrowthUnit.__init__(self, birthdate=birthdate,rank=rank, order=order, path=path, id=id, min_radius=min_radius, store_data=store_data)
        self._label = 'Branch' # for the read_only attributes to reset label from GrowtUnit to Branch
        self.growthunit_counter = 0.# count number of growth units in this branch


