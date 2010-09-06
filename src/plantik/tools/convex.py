#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""convex module

.. module:: convex
    :synopsis: tools related to convex hull enveloppe

.. topic:: summary

    Tools related to convex hull enveloppe

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :References: pgl_utils
    :Usage: >>> from openalea.plantik.biotik.collection import *

.. testsetup:: *

    from openalea.plantik.tools.convex import *
"""

import openalea.plantgl.all as pgl



def gradient( intense ):
    """ 

    .. todo:: move to colors.py
    """
    gradient=[]
    gradient.append( color( 47,255,0, trans=True ) )
    gradient.append( color( 115,255,0, trans=True ) )
    gradient.append( color( 187,255,0, trans=True ) )
    gradient.append( color( 255,255,0, trans=True ) )
    gradient.append( color( 255,204,0, trans=True ) )
    gradient.append( color( 255,162,0, trans=True ) )
    gradient.append( color( 255,95,0, trans=True ) )
    gradient.append( color( 255,0,0, trans=True ) )
    return gradient[ intense ]


def color( r, g, b , trans=False, name='material', diffu = 1):
    """alias to create color Material

    .. todo:: Move to colors.py
    """
    c=pgl.Color3( r,g,b )
    diffuse=diffu
    specular=pgl.Color3(40,40,40)
    emission=pgl.Color3(0,0,0)
    shininess=0
    if trans:
        transparency=0.5
    else:
       transparency=0
    return pgl.Material( name, c, diffuse, specular, emission, shininess, transparency )




transGreen = color( 0, 255, 0, True, 'transGreen' )
Green = color( 0, 100, 0, False, 'Green', diffu=2 )
TestColor = color( 180, 200,240, False, 'Green', diffu=3 )
niceGreen = color( 0, 50, 0, False, 'Green', diffu=3 )

def get_leaves_from_scene(scene):
    """parse a scene and extract the leaves.

    :param Scene scene: a PGL scene
    :return: a new scene with leaves shapes only

    This is appropriate for the scene given by stocatree simulations only.
    where leaves are bezierPatch types.

    .. todo:: improve the code to be more robust and generic.


    """
    shapes = []
    from openalea.plantgl.all import BezierPatch, Scene
    for sh in scene:
        try:
            if type(sh.geometry.geometry.geometry.geometry.geometry) == BezierPatch:
                shapes.append(sh)
        except:
            pass

    scene = Scene()
    for x in shapes:
        scene += x
    return scene


def cvxHull( shape_list_or_scene , color=Green):
    """create a convex hull enveloppe

    :param Scene scene: a scene with shapes to process
    :param color color: a PGL Material to place on the convex hull
    :return: a PGL shape 

    ::

        scene = Scene()
        scene += shapes
        hull = cvxhull(scene, color=Material(0,255,0))
        scene += hull
        Viewer.display(hull)

    """

    group = pgl.Group( [ sh.geometry for sh in shape_list_or_scene ] )
    tglSet = pgl.fit( 'convexhull', group )
    hull = pgl.Shape( tglSet, color )
    return hull


def totalSurface(sc):
    """somme surface groupe de shape"""
    sum = 0
    for i in sc:
        sum += pgl.surface(i.geometry)
    return sum

