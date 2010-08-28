#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Color module

.. module:: color
    :synopsis: aliases to color materials
    
.. topic:: summary

    A module dedicated to colors defined in PlantGL format.

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: colors.py 9007 2010-05-26 14:34:18Z cokelaer $
    :Usage: >>> from openalea.plantik.tools.colors import *

.. testsetup:: 

    from openalea.plantik.tools.colors import *
"""


__all__ = ['Colors']


from vplants.plantgl.all import Material, Color3


class Colors():
    """Define the indices for the colours to be used in the geometrical representation.
    
    There are some attributes that are defined as `Material` from `PlantGL` package.
    For instance, the color black is define as follows::

        black  = Material(Color3(0,0,0),2,Color3(40,40,40),Color3(0,0,0),1,0)

    For now, colors are `black`, `red` and `leaf`.


    .. doctest::

        >>> colors = Colors()
        >>> colors.black
        Material(name='black',ambient=Color3(0,0,0),)

    .. seealso:: http://en.wikipedia.org/wiki/Phong_shading
    """
    def __init__(self):
        #to be cleaned
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

        # Material constructor is:
        # Material( ambient=(160,160,160),diffuse=1,specular=(40,40,40),emission=(0,0,0),shininess=1,transparency=0)
        transparency = 0
        shininess = 1

        self.black  = Material('black', Color3(0,0,0), 2, Color3(40,40,40), Color3(0,0,0), 1, transparency)
        self.red    = Material('red', Color3(255,0,0),0,Color3(0,0,0),Color3(0,0,0),1, transparency)
        self.leaf    = Material('leaf', Color3(15,35,14),3.02857,Color3(47,47,47),Color3(0,0,0),1,transparency)

