#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Color module

.. module:: color
    :synopsis: aliases to color materials
.. currentmodule:: openalea.plantik.tools.colors

.. topic:: summary

    A module dedicated to colors defined in PlantGL format.

    :Code: in progress but mature
    :Documentation: mature
    :Tests: 
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.tools.colors import *

.. testsetup:: 

    from openalea.plantik.tools.colors import *
"""


__all__ = ['Colors', 'gradient', 'Green', 'TransGreen']


from vplants.plantgl.all import Material, Color3


class Colors(object):
    """Define the indices for the colours to be used in the PlantGL

    There are some attributes that are defined as `Material` from `
    PlantGL` package. For instance, the color black is define as follows::

        black  = Material(Color3(0,0,0),2,Color3(40,40,40),Color3(0,0,0),1,0)

    For now, colors are `black`, `red` and `leaf`, and `blue`.


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
        # Material( ambient=(160,160,160),diffuse=1,
        #    specular=(40,40,40),emission=(0,0,0),shininess=1,transparency=0)
        transparency = 0
        #shininess = 1

        specular= Color3(40,40,40,)
        emission=Color3(0,0,0)
        self.black = self.create_rgb_color(0,0,0, 'black', 2, specular,
                                        emission, 1, transparency)
        self.red = self.create_rgb_color(255,0,0, 'red', 0, Color3(0,0,0),
                                        emission, 1, transparency)
        self.blue = self.create_rgb_color(0,0,255, 'blue', 2, Color3(0,0,0),
                                        emission, 1, transparency)
        self.green = self.create_rgb_color(0,0,255, 'green', 2, Color3(0,0,0),
                                        emission, 1, transparency)
        
    @staticmethod
    def create_rgb_color(r, g, b, name="not specified",
                             diffusion=1, 
                             specular=Color3(40,40,40), 
                             emission=Color3(0,0,0),
                             shininess=0,
                             transparency=0):
        """Alias to Material, allows to easily add colors to your class
        
        This is a staticmethod, which can therefore be used outside::
        
            mycolor = Colors.create_rgb_color(0,10,0, name='test')
        """
        c = Color3(r, g, b)
             
        return Material(name, c, diffusion, specular, emission, shininess, 
                            transparency)
    
    
def gradient( intense ):
    """Generates a gradient of 8 colors, return the intense'th one

    :param int intense:
    
    >>> gradient(1)
    Material(name='not specified',ambient=Color3(115,255,0),diffuse=1,shininess=0,transparency=0.5)
    """
    gradient = []
    gradient.append( Colors.create_rgb_color( 47, 255, 0, transparency=0.5 ) )
    gradient.append( Colors.create_rgb_color( 115, 255, 0, transparency=0.5) )
    gradient.append( Colors.create_rgb_color( 187, 255, 0, transparency=0.5 ) )
    gradient.append( Colors.create_rgb_color( 255, 255, 0, transparency=0.5 ) )
    gradient.append( Colors.create_rgb_color( 255, 204, 0, transparency=0.5 ) )
    gradient.append( Colors.create_rgb_color( 255, 162, 0, transparency=0.5 ) )
    gradient.append( Colors.create_rgb_color( 255, 95, 0, transparency=0.5 ) )
    gradient.append( Colors.create_rgb_color( 255, 0, 0, transparency=0.5 ) )
    return gradient[ intense ]
    
#: predefined colors are transparent TransGreen
TransGreen = Colors.create_rgb_color(0, 255, 0, transparency=0.5, 
                                     name='transGreen')
#: predefined colors is Green
Green = Colors.create_rgb_color(0, 100, 0, name='Green', diffusion=2 )
#TestColor = Colors.create_rgb_color(180, 200, 240,  name='Green', diffusion=3 )
#niceGreen = Colors.create_rgb_color(0, 50, 0,  name='Green', diffusion=3 )
