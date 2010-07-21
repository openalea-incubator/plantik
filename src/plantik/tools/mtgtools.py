"""

:Authors: Thomas Cokelaer, Damien Fumey

"""


from openalea.mtg import *
from openalea.mtg.aml import *


def branch_length_on_trunk(g):
    return [g.property('Branch')[id].length for id in g.components(1) 
            if g.class_name(id) == 'B' and Order(id)==1]

def branch_rank_on_trunk(g):
    return [g.property('Branch')[id].context.rank for id in g.components(1) if g.class_name(id) == 'B']


def convert2LMS(length):
    if length<0.10:
        return 1
    elif length< 0.3:
        return 2
    else:
        return 3  
    
def create_sequences(g):
    """
    0: nothing
    1: Short
    2: Medium
    3: Long
    """
    from openalea.sequence_analysis import Sequences
    apices_ids = [id for id in Components(2, 4) if Class(id)=='A']
    branch_ids = Sons(2)
    branch_length = [g.property('Branch')[id].length for id in Sons(2)]
    branch_rank = [g.property('Branch')[id].context.rank for id in Sons(2)]
    apices_rank = [g.property('Apex')[id].context.rank for id in Components(2, 4) if Class(id)=='A']
    
    values = []
    for rank in apices_rank:
        values.append((rank, 0))
        
    for rank, length in zip(branch_rank, branch_length):
        values.append((rank, convert2LMS(length)))
        
    import numpy
    dtype = [('index', int), ('length', float)]

    a = numpy.array(values, dtype=dtype)
    new = numpy.sort(a, order='index')
    

    
    return Sequences([[[int(x)] for x in new['length']]])
    

def activate(g):
    Activate(g)

def get_trunk_index(g):
    return Components(g.root, Scale=2)[0]

def get_trunk_sequences(g):
    pass

def get_axes(g):
    return Components(g.root, Scale=2)

def get_all_branch_length(g):
    return [g.property('Branch')[x].length   for x in Components(g.root, Scale=2)]

def get_trunk_branch_length(g):
    trunk_id = get_trunk_index(g)
    indices = Sons(trunk_id, EdgeType='+')
    length = [g.property('Branch')[x].length   for x in indices]
    return length

def get_trunk_branch_radius(g):
    trunk_id = get_trunk_index(g)
    indices = Sons(trunk_id, EdgeType='+')
    length = [g.property('Branch')[x].radius   for x in indices]
    return length

def get_branch_metamer_number_on_trunk(g):
    """ get branches on the trunk and returns number of metamer/internode
    in each of these branches"""
    length = [len([y for y in Components(x, Scale=4) if Class(y)=='I']) for x in Sons(get_trunk_index(g), EdgeType='+')]
    return length

def plot(g):
    import pylab
    pylab.hist(get_trunk_branch_length(g))
    pylab.title('Branch length histogram on the trunk')
    pylab.show()
    pylab.figure(2)
    pylab.hist(get_trunk_branch_radius(g))
    pylab.title('Branch radius histogram on the trunk')
    pylab.show()
    pylab.figure(3)
    pylab.hist(get_branch_metamer_number_on_trunk(g))
    pylab.title('Metamer number histogram (all branches on the trunk)')
    pylab.show()



def create_sequence1(g):
    var1 = get_trunk_branch_length(g)
    from openalea.sequence_analysis.sequences import Sequences
    return Sequences(var1)

def stat(g):
    print 'branch length:', get_trunk_branch_length(g)
    print 'branch category:', map(convert2LMS, get_trunk_branch_length(g))

#Plot(v1, 1,6, "Gaussian", ViewPoint="SegmentProfile")
