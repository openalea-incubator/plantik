"""
.. topic:: lstring.py summary

    A module to manipulate lstrings and lsystems

    :Code status: mature
    :Documentation status: draft
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :References:
        1. Colin Smith, Costes Evelyne, On the Simulation of Apple Trees Using 
           Statistical and Biomechanical Principles, INRIA technical report, 2007

    :Revision: $Id: fruit.py 8981 2010-05-25 12:12:34Z cokelaer $
"""


from openalea.lpy import Lsystem




def lstring_extract(lstring, label):
    """
    Returns a list of objects of type=type found in the lstring

    >>> lstring_extract(lstring, 'Apex')
    """
    data = []
    for elt in lstring:
        # could not use isinstance for some reason ?
        try:
            if elt[0].label in label:
                data.append(elt[0])
        except:
            pass
    if len(data)==0:
        import warnings
        warnings.warn("cannot found any %s in the lstring" % type, UserWarning)
    return data



def _read_lsystem(filename):
    from openalea.mtg.io import lpy2mtg
    l = Lsystem(filename)
    return lpy2mtg(lstring,l)


 
def _axialtree():
    #[mtg.property('Apex')[a].demand for a in mtg.property('Apex').keys()]
    pass
