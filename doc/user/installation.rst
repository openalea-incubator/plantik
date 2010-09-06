.. _plantik_installation:

############################
Installation
############################

:Version: |version|
:Date: |today|
:author: Thomas Cokelaer

.. topic:: installation

    The goal of this document is to explain how to install OpenAlea.PlanTiK.

Prerequisites
==============

OpenAlea must be available. Two ways to install OpenAlea: 
    * from source (SVN)
    * from released eggs.

The method here below is for the former case since no eggs have been released for this package.

From the SVN of Virtual Plants team
=======================================

OpenAlea installation
----------------------

.. code-block:: bash

    svn co https://scm.gforge.inria.fr/svn/openalea/trunk openalea
    cd openalea
    python multisetup.py install


VPlants installation
---------------------


.. code-block:: bash

    svn co  https://scm.gforge.inria.fr/svn/vplants/vplants/trunk vplants
    cd vplants
    python multisetup.py tool stat_tool sequence_analysis plantgl mtg
    cd plantik
    python setup.py install

testing
=========

Start your favorite python shell such as **ipython** and try importing all modules. It should work without error if your PYTHONPATH is correctly setup.

.. doctest::

    >>> from openalea.plantik import *

There are some shared data that should be available:


.. doctest::

    >>> from openalea.plantik import get_shared_data
    >>> filename = get_shared_data('appletree_texture.jpg')

check that the filename provided is correct.





