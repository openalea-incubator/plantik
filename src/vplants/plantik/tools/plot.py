#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""plot module

.. module:: plot
    :synopsis: tools to manage pylab plots

.. topic:: summary

    tools to help managing plot (pylab)

    :Code: draft
    :Documentation: draft
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.plot import *

.. testsetup::

    from openalea.plantik.tools.plot import *

"""
import pylab 
from pylab import *

from openalea.sequence_analysis import *
from vplants.plantik import get_shared_data



def DataBasePlots():
    s1 = Sequences(get_shared_data('Seq07_T_C_f.txt'))
    s2 = Sequences(get_shared_data('Seq07_T_C_b.txt'))
    
    # extract type of branches
    lms1 = SelectVariable(s1, 1)
    lms2 = SelectVariable(s2, 1)

    trunk_len1 = [len(lms1[x]) for x in range(len(lms1))]
    trunk_len2 = [len(lms2[x]) for x in range(len(lms2))]


    # extract # internode per branch
    nI1 = SelectVariable(s1, 2)
    nI2 = SelectVariable(s2, 2)

    # extract branch length
    l1 = SelectVariable(s1, 3)
    l2 = SelectVariable(s2, 3)



class PlotParamAnalysis(object):
    def __init__(self, filename):
        import numpy
        import pickle
        self.filename = filename
        self.result = pickle.load(open(filename, 'r'))
        self.match1 = self.result['match1']
        self.match2 = self.result['match2']
        self.match12 = self.result['match12']
        self.volumes = self.result['volumes']
        self.param_min = self.result['param_min']
        self.param_max = self.result['param_max']
        self.param_bins = self.result['param_bins']
        self.param_max.keys()
        self.param_index = {'order':0, 'rank':1, 
            'height':2, 'age':3, 'vigor':4, 'd2a':5, 'leaf':6, 'threshold':7, 'pipe':8 }

    def plot(self, param):
        import numpy
        clf()
        bin = int(self.param_bins[param])
        index = self.param_index[param]
        data1 = []
        data2 = []
        volumes = []
        a = [0,0,0,0,0,0,0,0]
        xmin = self.param_min[param]
        xmax = self.param_max[param]
        x = arange(xmin, xmax, (xmax-xmin)/(bin))
        for i in range(0,bin):
            a[index] = i
            data1.append(self.match1[tuple(a)][0])
            data2.append(self.match2[tuple(a)][0])
            volumes.append(self.volumes[tuple(a)][0])

        figure(1)
        pylab.plot(x, data1, label='braeburn')
        hold(True)
        pylab.plot(x, data2, label='Fuji')
        xlabel(param)
        grid(True)
        ylabel('Matches')
        legend(loc='best')

        figure(2)
        pylab.plot(x, volumes, 'o-')
        xlabel(param)
        grid(True)
        ylabel('Volumes')
        show()

    def imshow(self, p1, p2, order=0, rank=0, height=0, age=0,
            vigor=0, d2a=0, leaf=0, threshold=0, pipe=0):
        """Plot cut of the n dimensional array from parameter_analysis

        :param str p1: the first parameter to look at 
        :param str p2: the second parameter to look at

        by default all other parameter index will be zero. Each of them can be specified.

        imshow('order', 'rank', d2a=2)
        """
        import numpy
        clf()
        extent = self._get_extent(p1, p2)
        #build up the matrix to show
        bin1 = int(self.param_bins[p1])
        bin2 = int(self.param_bins[p2])
        p1_index = self.param_index[p1]
        p2_index = self.param_index[p2]
        data1 = numpy.zeros((bin1, bin2))
        data2 = numpy.zeros((bin1, bin2))
        a = [order, rank, height, age, vigor, d2a, leaf, threshold, pipe]
        for i in range(0,bin1):
            for j in range(0,bin2):
                a[p1_index] = i
                a[p2_index] = j
                data1[i,j] = self.match1[tuple(a)]
                data2[i,j] = self.match2[tuple(a)]
        figure(1)
        imshow(data1, interpolation='nearest', origin='lower', extent=extent)
        colorbar()
        axis('normal')
        xlabel(p1)
        ylabel(p2)
        figure(2)
        imshow(data2, interpolation='nearest', origin='lower', extent=extent)
        colorbar()
        axis('normal')
        xlabel(p1)
        ylabel(p2)


        show()


    def _get_extent(self, p1, p2):
        xmin = self.param_min[p1]
        xmax = self.param_max[p1]
        ymin = self.param_min[p2]
        ymax = self.param_max[p2]
        return [xmin, xmax, ymin, ymax]
