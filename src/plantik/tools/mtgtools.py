"""

:Authors: Thomas Cokelaer, Damien Fumey

"""


from openalea.mtg import *
from openalea.mtg.aml import *




def activate(g):
    Activate(g)

def get_trunk_index(g):
    return Components(g.root, Scale=2)[0]


def get_axes(g):
    return Components(g.root, Scale=2)

def get_all_branch_length(g):
    [g.property('Branch')[x].length   for x in Components(g.root, Scale=2)]

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



#Plot(v1, 1,6, "Gaussian", ViewPoint="SegmentProfile")
