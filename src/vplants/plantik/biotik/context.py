#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Context module

.. module:: context
    :synopsis: context definition

.. topic:: context summary

    context definition

    :Code: mature
    :Documentation: completed
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.biotik.context import *

.. testsetup::
    from openalea.plantik.biotik.context import *
"""





class Context(object):
    """Simple structure to store topological information


    This class allows to store order, height to the root, rank and distance of a lateral apex
    to the apex on the same axis.

    :Example:
    
    >>> c = Context()
    >>> assert c.order == None
    >>> c.order = 3
    >>> assert c.order == 3

    """
    def __init__(self, rank=None, order=None, height=None, d2a=None):
        """**Context constructor**

        :attributes:
            * :attr:`order` read/write
            * :attr:`height` read/write
            * :attr:`rank` read/write
            * :attr:`distance_to_apex` read/write
        """
        self._rank = rank
        self._height = height
        self._order = order
        self._d2a = d2a

    def __str__(self):
        res =  '\nContext\n'
        res += '=======\n'
        res += ' - rank     = %s\n' % self.rank
        res += ' - height   = %s\n' % self.height
        res += ' - order    = %s\n' % self.order
        res += ' - distance_to_apex    = %s\n' % self.d2a
        return res

    def _set_height(self, height):
        self._height = height
    def _get_height(self):
        return self._height
    height = property(_get_height, _set_height, None, 
                      "getter/setter for height")

    def _set_order(self, order):
        self._order = order
    def _get_order(self):
        return self._order
    order = property(_get_order, _set_order, None, "getter/setter for order")

    def _set_rank(self, rank):
        self._rank = rank
    def _get_rank(self):
        return self._rank
    rank = property(_get_rank, _set_rank, None, "getter/setter for rank")

    
    
    def _set_d2a(self, d2a):
        self._d2a = d2a
    def _get_d2a(self):
        return self._d2a
    d2a = property(_get_d2a, _set_d2a, None, "getter/setter for distance to apex")

    
    
