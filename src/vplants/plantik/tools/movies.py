#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""movies module

.. module:: movies
    :synopsis:  Functionalities to create movies.
    :platform: linux for now since you need **mencoder** tool.

.. topic:: summary

    Functionalities to create movies.

    :Code status: mature
    :Documentation status: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.tools.movies import *
    
.. testsetup::
    from openalea.plantik.tools.movies import *

"""

import platform
import glob
import os
import tempfile

def create_movie(input_glob='*.png', output_filename='output', format='avi', width=800, height=600, fps=24, type='png'):
    """generate a movie in avi format from a list of PNG images using mencode

    :param input_glob: a glob to a list of files (default is ``*.png``)
    :param output_filename: the output filename
    :param format: the movie format (default is avi)
    :param width: width of the movie frame (default is 800)
    :param height: height of the movie frame (default is 600)
    :param fps: frame per second (Default is 24)
    :param format: the input format (type is png)

    :platform: linux

    .. note:: the linux command is

        mencoder mf://@/tmp/file.txt -mf w=800:h=600:fps:24:type=png -ovc lavc -lavcopts vcodec=msmpeg4:mbd=2:trell -oac copy -o output.avi

     ::

        create_movie('test*.png', output_filename='movie1', format='avi', fps=20)

    .. todo:: for all platforms
    .. todo:: provide more options
    """
    files = glob.glob(input_glob)
    files.sort()
    if 'linux' in platform.platform().lower():
        #tempfilename = '/tmp/list.txt'
        #tempfile = open(tempfilename, 'w')
        tmpfile = tempfile.NamedTemporaryFile()
        for file in files:
            tmpfile.write(file+'\n')
        #tempfile.close()

        size = '-mf w=%s:h=%s:fps=%s:type=%s' % (width, height, fps, type)
        cmd = 'mencoder mf://@%s %s -ovc lavc -lavcopts vcodec=msmpeg4:mbd=2:trell -oac copy -o %s'\
            % (tmpfile.name, size, output_filename + '.' + format)
        status = os.system(cmd)
        tmpfile.close()

        if status!=0:
            print '!! command failed. check that mencoder is installed of files exists. (%s)' % cmd
    else:
        raise NotImplementedError('create_movie is only available for linux platforms at the moment.')
        #os.system('rm %s' % tempfilename)
