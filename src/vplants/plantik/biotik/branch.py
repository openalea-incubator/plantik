#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Branch module

.. module:: branch
    :synopsis: Branches utilities and classes

.. topic:: summary

    Branches utilities and classes

    :Code: mature
    :Documentation: mature
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from vplants.plantik.biotik.branch import *

.. testsetup::

    from vplants.plantik.biotik.branch import *

"""
#from vplants.plantik.biotik.component import *
from vplants.plantik.biotik.collection import CollectionVariables, SingleVariable
from vplants.plantik.biotik.context import Context
from vplants.plantik.biotik.growthunit import GrowthUnit



class Branch(GrowthUnit):
    """Branch component
    
    A branch component is a :class:`~openalea.plantik.biotik.growthunit.GrowthUnit` 
    slightly modified to count the number of growth units instead of the internodes. 
    
    :Example:

    >>> from vplants.plantik.biotik.branch import *
    >>> branch = Branch()
    >>> branch.radius
    0.001
    >>> branch.growthunit_counter
    0
    
    .. seealso:: :class:`~openalea.plantik.biotik.growthunit.GrowthUnit`
    """
    def __init__(self, birthdate=None, id=None, min_radius=0.001, store_data=True):
        """**Constructor**

        :param datetime.datetime birthdate:
        :param int id:
        :param float min_radius:
        :param bool store_data:
        
        There is one attribute, :attr:`growthunit_counter` that counts the number
        of GU in a branch.
        
        see :class:`~openalea.plantik.biotik.growthunit.GrowthUnit` for details

        """
        GrowthUnit.__init__(self, birthdate=birthdate, id=id, min_radius=min_radius, store_data=store_data)
        self._label = 'Branch' # for the read_only attributes to reset label from GrowtUnit to Branch
        self.growthunit_counter = 0# count number of growth units in this branch


    def __str__(self):
        from vplants.plantik.tools.misc import title
        res = super(Branch, self).__str__()
        res += title('other attributes')
        res += 'growthunit counter %s' % self.growthunit_counter
        return res

