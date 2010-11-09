#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""boxcounting module

.. module:: boxcounting
    :synopsis: boxcounting
.. currentmodule:: openalea.plantik.tools.boxcounting

.. topic:: summary

    box counting plots

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :References: vplants.fractalysis.engine
    :Usage:
        >>> from openalea.plantik.tools.boxcounting import *

.. testsetup::

    from openalea.plantik.tools.boxcounting import *

"""
import vplants.plantgl.all as pgl
import numpy
from math import log
import math
try:
    from scipy.stats import linregress
    scipystats = True

except:
    scipystats = False
    pass

__all__ = ["boxcounting"]

def boxcounting(scene, maxd=10, show=False, library='plantik'):
    """Run the boxcounting based on openalea.fractalysis

    :param scene: a PlantGL scene
    :param int maxd: max number of boxes ? 
    :param library: either ['fractalysis' or 'plantik']
    
    .. note:: By default the box counting uses functions from plantik
       written in pure python to avoid a dependency over the package
       fractalysis. However, this is 40 times slower than the original
       code from fractalysis, which is written in CPP. So, if you
       want a fast computation, switch the library argument to 'fractalyis'
       instead of plantik.  
    
    
    Plot 2 figures showing:

    .. plot::

        from openalea.plantik.tools import runlpy
        from openalea.plantik import get_shared_data
        from openalea.plantik.tools.boxcounting import boxcounting
        (lsystem, lstring) = runlpy.run(get_shared_data('pruning.lpy'),\
            verbose=False, show=False)
        boxcounting(lsystem.getLastComputedScene(), 10, show=True)

    .. figure:: pruning_example.png
        :width: 50%

        Example of output given by **pruning.lpy**
        Example of outputs given by **boxcounting** applied on the output of **pruning.lpy** 
        (i.e., the lsystem and lstring).


    
    """
    vec = range(2, maxd)

    if library=='fractalysis':
        from openalea.fractalysis import engine
        delta = numpy.array([engine.computeGrid(scene, i)[1] for i in vec])
        n_delta = numpy.array([engine.computeGrid(scene, i)[0] for i in vec])
    elif library=='plantik':
        delta = numpy.array([myComputeGrid(scene, i)[1] for i in vec])
        n_delta = numpy.array([myComputeGrid(scene, i)[0] for i in vec])
    else:
        raise ValueError('library must be plantik or fractalysis')

    log_inv_delta = numpy.array([log(1./i) for i in delta])
    log_n_delta = numpy.log(n_delta)

    if scipystats == False:
        return

    slope, itcept, r, ttp, stderr = linregress(log_inv_delta, log_n_delta)
    import pylab
    pylab.figure(1)
    pylab.clf()
    pylab.plot(log_inv_delta, log_n_delta, 'rx', label='Measured data')
    pylab.plot(log_inv_delta, slope*log_inv_delta+itcept, 
               label=r'y=%0.2fx+%0.2f , $r^2$ = %0.2f' % (slope, itcept,r))
    pylab.grid(True)
    pylab.xlabel(r'$\ln{\frac{1}{\delta}}$', size=16)
    pylab.ylabel(r'$\ln{N_\delta}$', fontsize=16)
    pylab.legend(loc='best')
    if show == True: 
        pylab.show()

    slope, itcept, r, ttp, stderr = linregress(1./delta, n_delta)
    pylab.figure(2)
    pylab.clf()
    pylab.plot(1./delta, n_delta, 'rx', label='Measured data')
    pylab.plot(1./delta, slope*(1./delta)+itcept, 
               label=r'y=%0.2fx+%0.2f , $r^2$ = %0.2f' % (slope, itcept,r))
    pylab.grid(True)
    pylab.xlabel(r'$\delta$', size=16)
    pylab.ylabel(r'$N_\delta$', fontsize=16)
    pylab.legend(loc='best')
    if show == True: 
        pylab.show()


    return log_n_delta, log_inv_delta, n_delta, delta




#equivalent to PointDiscretize of Fractalysis
def PointDiscretize(scene):
    """return an array of center/surface pair for every triangle in the scene"""
    res = []
    t = pgl.Tesselator()
    for sh in scene:
        sh.geometry.apply(t)
        d = t.triangulation
        for i in range(d.indexListSize()):
            center = (d.pointAt(i, 0) + d.pointAt(i, 1) + d.pointAt(i, 2))/3
            surf = pgl.surface(d.pointAt(i, 0), d.pointAt(i, 1), d.pointAt(i, 2))
            res.append((center, surf))
    return res 
 
#equivalent to engine.computeGrid of Fractalysis
def myComputeGrid(scene, maxGridSize):
    points = PointDiscretize(scene)
    mbbox = mybbox2(scene)
    intercepted, voxelSize = scene2Grid(points, mbbox, maxGridSize)
    return intercepted, voxelSize
    
#equivalent to bbox2 of cpp code of fractalysis.engine
def mybbox2(scene):
    d = pgl.Discretizer()
    bbc = pgl.BBoxComputer(d)
    bbc.process(scene)
    epsilon = pgl.Vector3(0.01, 0.01, 0.01)        
    return (bbc.result.lowerLeftCorner-epsilon, 
            bbc.result.upperRightCorner+epsilon)


#equivalent to scene2grid of cpp code of fractalysis.engine
def scene2Grid(points, mbbox, gridSize):
    origin = mbbox[0]
    step = (mbbox[1] - mbbox[0]) / gridSize
    voxelSize = math.pow(step.x*step.y*step.z , 1./3. )
    gridSize3 = gridSize * gridSize * gridSize # nbr de voxels
    gridData = numpy.zeros(gridSize3+1)
    gsize2 = gridSize*gridSize
    gsizem1 = gridSize-1
    for point in points:
        (i, j, k) = mygridIndex(point[0] - origin, step)
        index = min(i, gsizem1) * gsize2  + min(j, gsizem1) * gridSize +\
                min(k,gsizem1)
        gridData[index] += 1
    intercepted = 0
    for i in gridData:
        if i > 0:
            intercepted += 1 #si la case > 0 elle a ete intercepte
    return intercepted, voxelSize
    
#equivalent to scene2grid of cpp code of fractalysis.engine
def mygridIndex(point, step):
    i = math.floor(point.x / step.x)
    j = math.floor(point.y / step.y)
    k = math.floor(point.z / step.z)
    return (i, j, k)
