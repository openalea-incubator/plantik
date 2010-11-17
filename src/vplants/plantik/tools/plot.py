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
from pylab import *
from openalea.sequence_analysis import *
from vplants.plantik import get_shared_data


def _checkVariables(valid_variables, user_variables=None):
    """

    :param valid_variables:
    :param user_variables:
    """
    # if no options provided, returns valid
    if user_variables == None:
        return valid_variables
    else:
        # if user is astring,check its validity
        if type(user_variables)==str:
            if user_variables in valid_variables:
                return [user_variables]
        # else it must be a list ovalid strings
        elif type(user_variables)!=list:
            raise TypeError('variables must be a list of strings or a strings')

        else:
            for variable in user_variables:
                if variable not in valid_variables:
                      raise ValueError('variables must be %s', valid_variables)
            #if we reach this point, all user variable are valid
            return user_variables


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
        self.data = self.result['data']
        self.param_min = self.result['param_min']
        self.param_max = self.result['param_max']
        self.param_bins = self.result['param_bins']
        self.param_max.keys()
        self.param_index = {'order':0, 'rank':1, 
            'height':2, 'age':3, 'vigor':4, 'd2a':5, 'leaf':6, 'threshold':7, 'pipe':8 }

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
        data = numpy.zeros((bin1, bin2))
        a = [order, rank, height, age, vigor, d2a, leaf, threshold, pipe]
        for i in range(0,bin1):
            for j in range(0,bin2):
                a[p1_index] = i
                a[p2_index] = j
                data[i,j] = self.data[tuple(a)]
        imshow(data, interpolation='nearest', origin='lower', extent=extent)
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
