#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""lstring module

.. module:: lstring
    :synopsis: A module to manipulate lstrings and lsystems

.. topic:: summary

    A module to manipulate lstrings and lsystems

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.lstring import *

.. testsetup::

    from openalea.plantik.tools.lstring import *

"""
from openalea.lpy import Lsystem



def lstring_extract(lstring, labels):
    """Parse an lstring an return lstring containing only objects with names found in **label**

    :param AxialTree lstring: a lstring to scan
    :param str label: a string or list of string that shouls be names of module found in the lstring.

    .. doctest::
        :options: +SKIP

        >>> from openalea.plantik.tools.lstring import lstring_extract
        >>> lstring_extract(lstring, 'A')
        >>> lstring_extract(lstring, ['A', 'I'])
    """
    data = []
    for elt in lstring:
        # could not use isinstance for some reason ?
        if elt.name in labels:
            data.append(elt[0])
    if len(data)==0:
        import warnings
        warnings.warn("cannot found any %s in the lstring" % type, UserWarning)
    return data



#def read_lsystem(filename):
#    l = Lsystem(filename)

def create_test_lstring():
    """Create a lstring to play with (in test for instance)
    
    >>> l = create_test_lstring()
    
    """
    from openalea.lpy import AxialTree, ParamModule
    from openalea.plantik import Apex, Leaf, Internode, Branch, \
        GrowthUnit, Plant
    N = 5
    P = ParamModule('P', Plant(1))
    A = ParamModule('A', Apex())
    L = ParamModule('L', Leaf(resource_per_day=0.5))
    I = ParamModule('I', Internode())
    B = ParamModule('B', Branch())
    U = ParamModule('U', GrowthUnit())
    
    a = AxialTree([B, U, A, I, L, A, I, L, A, I, L, A])
    return a
