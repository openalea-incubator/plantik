#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Color module

.. module:: color
    :synopsis: aliases to color materials
    
.. topic:: leaf.py summary

    A module dedicated to colors defined in PlantGL format.

    :Code status: mature
    :Documentation status: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: colors.py 9007 2010-05-26 14:34:18Z cokelaer $
"""


__all__ = ['Colors']


from vplants.plantgl.all import Material, Color3


class Colors():
    """Define the indices for the colours to be used in the geometrical representation.
    """
    def __init__(self):

        self.background = 0
        self.error      = 1
        self.fruit       = 14
        self.leaf        = 15
        self.autumn_leaf = 16
        self.petal       = 17
        self.stamen      = 18
        self.bark        = 19
        self.ground      = 20
        self.red         = 2

        self.black  = Material(Color3(0,0,0),2,Color3(40,40,40),Color3(0,0,0),1,0)
        self.red    = Material(Color3(255,0,0),0,Color3(0,0,0),Color3(0,0,0),1,0)
        self.leaf    = Material(Color3(15,35,14),3.02857,Color3(47,47,47),Color3(0,0,0),1,0)

