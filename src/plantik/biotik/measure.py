#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. topic:: measure.py summary

    module dedicated to measurements made on a plant

    :Code status: mature
    :Documentation status: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
        
    :Revision: $Id: leaf.py 9013 2010-05-27 09:06:13Z cokelaer $
    
.. testsetup:: *

    from openalea.plantik.biotik.measure import Measure
    
"""

class Measure(object):
    """Factory used to dynamically store measurements
    
    
    
    >>> m = Measure(radius=1)
    >>> assert m.radius == 1
    
    """ 
    def __init__(self, **kargs):
        for name, value in kargs.items():
            setattr(self, name, value)
            
    def __str__(self):
        
        res = ''
        for name, value in self.__dict__.items():
            res += name + ":" + str(value)
            res += '\n'
        return res 
   