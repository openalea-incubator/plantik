#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""boxcounting module

.. module:: boxcounting
    :synopsis: boxcounting

.. topic:: summary

    box counting plots

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.mtgtools import *

.. testsetup::

    from openalea.plantik.tools.mtgtools import *

"""
from openalea.fractalysis import engine
import numpy
from math import log
from scipy.stats import linregress


def boxcounting(scene, maxd=10, show=False):
    """Run the boxcounting based on openalea.fractalysis

    Plot 2 figures showing:

    ::

        from openalea.plantik.tools import runlpy
        from openalea.plantik import get_shared_data
        from openalea.plantik.tools.boxcounting import boxcounting
        (lsystem, lstring) = runlpy.run(get_shared_data('pruning.lpy'))
        boxcounting(lsystem, lstring)

    .. figure:: pruning_example.png
        :width: 50%

        Example of output given by **pruning.lpy**

    .. figure:: boxcounting1.png
        :width: 50%

    .. figure:: boxcounting2.png
        :width: 50%

        Example of outputs given by **boxcounting** applied on the output of **pruning.lpy** 
        (i.e., the lsystem and lstring).


    """
    vec = range(2,maxd)

    delta = numpy.array([engine.computeGrid(scene, i)[1] for i in vec])
    n_delta = numpy.array([engine.computeGrid(scene, i)[0] for i in vec])

    log_inv_delta = numpy.array([log(1./i) for i in delta])
    log_n_delta = numpy.log(n_delta)

    slope , itcept , r , ttp , stderr = linregress(log_inv_delta, log_n_delta)
    import pylab
    pylab.figure(1)
    pylab.clf()
    pylab.plot(log_inv_delta, log_n_delta, 'rx', label='Measured data')
    pylab.plot(log_inv_delta, slope*log_inv_delta+itcept, label=r'y=%0.2fx+%0.2f , $r^2$ = %0.2f' % (slope, itcept,r))
    pylab.grid(True)
    pylab.xlabel(r'$\ln{\frac{1}{\delta}}$',size=12)
    pylab.ylabel(r'$\ln{N_\delta}$',fontsize=12)
    pylab.legend(loc='best')
    if show==True: pylab.show()

    slope , itcept , r , ttp , stderr =linregress(1./delta, n_delta)
    pylab.figure(2)
    pylab.clf()
    pylab.plot(1./delta, n_delta, 'rx', label='Measured data')
    pylab.plot(1./delta, slope*(1./delta)+itcept, label=r'y=%0.2fx+%0.2f , $r^2$ = %0.2f' % (slope, itcept,r))
    pylab.grid(True)
    pylab.xlabel(r'$\delta$',size=12)
    pylab.ylabel(r'$N_\delta$',fontsize=12)
    pylab.legend(loc='best')
    if show==True: pylab.show()


    return log_n_delta, log_inv_delta, n_delta, delta
