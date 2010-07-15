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


def plot(g):
    import pylab
    pylab.hist(get_trunk_branch_length(g))
    pylab.show()
    pylab.figure(2)
    pylab.hist(get_trunk_branch_radius(g))
    pylab.show()


def create_sequence1(g):
    var1 = get_trunk_branch_length(g)
    from openalea.sequence_analysis.sequences import Sequences
    return Sequences(var1)


