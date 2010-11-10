#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Surface module

.. module:: surface
    :synopsis: Facilities to read Lstudio surface files
.. currentmodule:: openalea.plantik.tools.surface


.. topic:: Summary

    Facilities to read Lstudio surface files

    :Code status: mature
    :Documentation status: up-to-date
    :Tests: 100%
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$


"""
from openalea.plantgl.all import Vector3, Vector4, Scaled, BezierPatch
from vplants.plantik import get_shared_data

__all__ = ['createSurface', 'leafSurface']

def createSurface(filename=None, ustride=10, vstride=10):
    """Reads a surface file and down sample data if required


    The format files follows the format specified in L-studio, an example
    is provided here below::

        -0.75 0.75   -0.02 0.34   -0.01 1.00
        CONTACT POINT  X: 0.00 Y: 0.00 Z: 0.00
        END POINT  X: 0.00 Y: 0.00 Z: 0.00
        HEADING  X: 0.00 Y: 0.00 Z: 1.00
        UP  X: 0.00 Y: 1.00 Z: 0.00
        SIZE: 1.00
        patch
        TOP COLOR: 0 DIFFUSE: 0.00 BOTTOM COLOR: 0 DIFFUSE: 0.00
        AL: ~ A: ~ AR: ~ 
        L: ~ R: ~ 
        BL: ~ B: ~ BR: ~ 
        -0.01 -0.01 1.00  0.00 -0.02 0.99  0.00 -0.01 1.00  0.00 -0.01 1.00  
        -0.43 0.13 0.76  -0.16 0.34 0.27  0.21 0.34 0.27  0.43 0.12 0.76  
        -0.75 0.00 0.19  -0.25 0.00 0.19  0.25 0.00 0.19  0.75 0.00 0.19  
        -0.01 0.00 -0.01  -0.01 0.00 -0.01  0.00 0.00 -0.01  -0.01 0.00 -0.01 

    :param str filename: the filename of the surface data
    :param int ustride: number of points in u direction
    :param int vstride: number of points in v direction

    ::

        >>> stride_number = 4
        >>> leaf_surface = createSurface('leaf_surface.s', stride_number, stride_number)

    then in Lpy::

        >>> produce PglShape(leaf_surface, r)
    """
    try:
        f = open(filename,'r')
    except:
        raise ValueError('check the filename')

    assert type(ustride) == int
    assert type(vstride) == int
    # read header of the file
    f.readline()
    # read contact point
    v = f.readline().split()
    cpoint = Vector3(float(v[3]),float(v[5]),float(v[7]))

    # read end point
    f.readline()
    #read heading
    v = f.readline().split()
    heading = Vector3(float(v[2]),float(v[4]),float(v[6]))

    # read up 
    v = f.readline().split()
    up = Vector3(float(v[2]),float(v[4]),float(v[6]))

    # read size
    v = f.readline().split()
    size = float(v[1])

    # read name 
    name = f.readline().split()[0]
    # read ctrl points
    for i in xrange(4):
        f.readline()
    ctrlpoints = []
    for i in xrange(4):
        v = f.readline().split()
        row = []
        for j in range(4):
            row.append(Vector4(float(v[j*3]),float(v[j*3+1]),float(v[j*3+2]),1))
        ctrlpoints.append(row)
    smb = Scaled(size, BezierPatch(ctrlpoints, ustride, vstride))
    smb.name = name
    return smb



def leafSurface(u_stride=6, v_stride=6):
    """read leaf_surface.s file and return the surface associated

    :param int u_stride: stride in u direction (default is 6)
    :param int v_stride: stride in v direction (default is 6)

    >>> leaf = leafSurface(6, 12)
    """
    s = createSurface(get_shared_data('leaf_surface.s'), u_stride, v_stride)
    s.name = 'leaf'
    return s

