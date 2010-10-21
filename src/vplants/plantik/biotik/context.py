#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Context module

.. module:: context
    :synopsis: context definition

.. topic:: context summary

    context definition

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.biotik.context import *

.. testsetup::
    from openalea.plantik.biotik.context import *
"""




class Context(object):
    """Simple structure to store topological information

    see the contuctor for more information

    >>> c = Context()
    >>> assert c.order == None
    >>> c.order = 3
    >>> assert c.order == 3

    """
    def __init__(self, rank=None, order=None, height=None):
        """**Context constructor**

        :attributes:
            * :attr:`order`
            * :attr:`height`
            * :attr:`rank`
        """
        self._rank = rank
        self._height = height
        self._order = order

    def __str__(self):
        res =  '\nContext\n'
        res += '=======\n'
        res += ' - rank=%s\n' % self.rank
        res += ' - height=%s\n' % self.height
        res += ' - order=%s\n' % self.order
        return res


    def _set_height(self, height):
        self._height = height
    def _get_height(self):
        return self._height
    height = property(_get_height, _set_height, None, "getter/setter for height")

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


