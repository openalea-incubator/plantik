#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""convex module

.. module:: convex
    :synopsis: tools related to convex hull envelope

.. topic:: summary

    Tools related to convex hull envelope

    :Code: mature but could be improved to be more generic
    :Documentation: up-to-date
    :Tests: 100% 
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :References: pgl_utils
    :Usage: >>> from openalea.plantik.biotik.collection import *

.. testsetup:: *

    from openalea.plantik.tools.convex import *
"""
import openalea.plantgl.all as pgl
from vplants.plantik.tools.colors import Green


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

    .. figure:: convex.png
        :width: 50%

        Example of convex hull enveloppe (of the leaves) added on top of a tree generated with pruning.lpy

    """

    group = pgl.Group( [ sh.geometry for sh in shape_list_or_scene ] )
    tglSet = pgl.fit( 'convexhull', group )
    hull = pgl.Shape( tglSet, color )
    return hull


def totalSurface(scene):
    """Returns the total surface of the shape in a scene

    :param Scene scene: a PGL scene with shapes
    :return: the total surface area 

    .. todo:: what are the units ? """
    sum = 0
    for i in scene:
        sum += pgl.surface(i.geometry)
    return sum

