#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. topic:: context summary

    classes to manipulate context

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.biotik.context import *
"""




class Context(object):
    """Simple structure to store topological information

    see the contuctor for more information

    >>> c = Context(rank=1, order=1, path=1)
    >>> assert c.order == 1
    >>> c.order = 3
    >>> assert c.order == 3

    """
    def __init__(self, rank=None, order=None, path=None):
        """**Context constructor**

        :attributes:
            * :attr:`order`
            * :attr:`path`
            * :attr:`rank`
        """
        self._rank = rank
        self._path = path
        self._order = order

    def __str__(self):
        res =  '\nContext\n'
        res += '=======\n'
        res += ' - rank=%s\n' % self.rank
        res += ' - path=%s\n' % self.path
        res += ' - order=%s\n' % self.order
        return res


    def _set_path(self, path):
        self._path = path
    def _get_path(self):
        return self._path
    path = property(_get_path, _set_path, None, "getter/setter for path")

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


