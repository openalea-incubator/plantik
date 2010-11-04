#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""strahler module

.. module:: strahler
    :synopsis: strahler utilities

.. topic:: summary

    Compute strahler number

    :Code: in progress
    :Documentation: in progress
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.strahler import *

.. testsetup::

    from openalea.plantik.tools.strahler import *

"""




from openalea.mtg.aml import Rank
import openalea.mtg.traversal as traversal

#__all__ = ['strahler']

    
def strahler_symmetry(mtg):
    """
    .. todo:: to be checked
    """
    return strahler(mtg) - max([Rank(a) for a in mtg])


def strahler_order(g, vid):
    """internal function used by :func:`strahler`
    
    """
    strahler = {}
    for v in traversal.post_order(g, vid):
        children_strahler = [strahler[c] for c in g.children(v)]
        if children_strahler:
            m, M = min(children_strahler), max(children_strahler)
            strahler[v] = M if m != M else M+1
        else: 
            strahler[v] = 1
    return strahler

def strahler(g, vid=2):
    """Returns the strahler number of a MTG for a given vid
    
    :param int vid: 
    """
    return max(strahler_order(g, vid).values()) 
