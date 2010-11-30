from openalea.plantik.tools.config import ConfigParams
import openalea.lpy as lpy
from openalea.plantgl.all import *
import openalea.lpy as lpy
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from openalea.plantik.tools import mtgtools
import numpy
from openalea.plantik.tools.levenshtein import LevenshteinDistance
from openalea.plantik.tools.strahler import *
from openalea.stat_tool import *
from openalea.sequence_analysis import *
from openalea.plantik import get_shared_data

app = QApplication([])
Viewer.start()
Viewer.animation(False)

l = lpy.Lsystem(get_shared_data('pruning.lpy'))
options_pruning = l.context()['options']
options_pruning.general.verbose = False
options_pruning.geometry.leaf_view = False

finput = open(get_shared_data('pruning.lpy'), 'r')
code = finput.read() 

production = False

def run(options, code, order=0, age=0, rank=0, height=0, vigor=0, d2a=0, leaf=0.15, max_step=210):
    l = lpy.Lsystem()
    l.set(code)
    l.derivationLength = int(max_step)
    l.context()['options'] = options
    l.context()['options'].context.order_coeff  = order
    l.context()['options'].context.rank_coeff   = rank
    l.context()['options'].context.height_coeff = height
    l.context()['options'].context.d2a_coeff    = d2a
    l.context()['options'].context.age_coeff    = age
    l.context()['options'].context.vigor_coeff  = vigor
    l.context()['options'].leaf.resource  = leaf
    res = l.iterate(1)
    Viewer.animation(False)
    tree = l.iterate(1,max_step, res)
    if production == False:
        l.plot(tree)
        Viewer.camera.set(Vector3(0,90,80), 90, -25)
        Viewer.frameGL.saveImage('pruning_%02d_%02d_%02d_%02d_%02d_%02d_%02.2f.png' % 
            (order, height, rank, age, vigor, d2a, leaf),
            'png')
    return tree

print 'Initialisation',
#meantree, duration = run(options_pruning, code)  
#branches = mtgtools.get_trunk_branch_length(meantree)
#seq1 = mtgtools.create_sequences(meantree)
#print  len(branches), map(mtgtools.convert2LMS,  mtgtools.get_trunk_branch_length(meantree))


seq_data1 = Sequences('/home/cokelaer/Seq07_T_C_b.txt')
seq_data2 = Sequences('/home/cokelaer/Seq07_T_C_f.txt')
print '...done'


def run2(X, max_step=120):
    order = X[0]
    rank = X[1]
    height = X[2]
    age = X[3]
    vigor = X[4]
    d2a = X[5]
    leaf = X[6]
    threshold = X[7]
    pipe = X[8]
    #threshold = 0.9
    if pipe<=0 or threshold <=0 or leaf<=0: return 10
    if threshold>=1 or pipe>=0.99: return 10

    options_pruning.apex.growth_threshold = threshold
    options_pruning.pipe.fraction = pipe

    try:
        tree = run(options_pruning, code, order=order, 
           age=age, height=height, vigor=vigor, 
            rank=rank, d2a=d2a, leaf=leaf, 
            max_step=int(max_step))
        mtg = tree[0][0].mtg
        seq2 = tree[0][0].mtgtools.get_trunk_sequence()
        lms = tree[0][0].mtgtools.get_trunk_info()
        print  '--', len(lms), lms
        print  '--', len(seq2), seq2
    except:
        seq2 = []   
        lms = []
        print '-- failed'
        return 10
        


    if len(lms) == 0 or len(seq2)<=2:
        compatible_seq = Sequences([[1],[2]])
    else:
        if len(set(seq2)) == 1:
            print '!!!!!!!Changing sequence to have at least 2 different values'
        if seq2[1]<3:
            seq2[0] = seq2[1]+1
        else:
            seq2[0] = seq2[1]-1
        compatible_seq = Sequences([[b] for b in seq2])

    distance_matrix = Compare(Merge(SelectVariable(seq_data1,1), compatible_seq), VectorDistance("O"), End="Free")
    idm = ImprovedDistanceMatrix(distance_matrix)
    res1 = idm.cumulated_distance()
    distance_matrix = Compare(Merge(SelectVariable(seq_data1,2), compatible_seq), VectorDistance("O"), End="Free")
    idm = ImprovedDistanceMatrix(distance_matrix)
    res2 = idm.cumulated_distance()
    print "Comparaison. o=%5.2f r=%5.2f h=%5.2f a=%5.2f v=%5.2f d2a=%5.2f leaf=%5.2f t=%5.2f m1=%5.2f m2=%5.2f" % (order, rank, height, age, vigor, d2a, leaf, threshold, res1[-1], res2[-1])

    return res1[-1]

from myanneal import anneal
#res = optimize.anneal(run2, [2 ], lower=[-3], upper=[3], feps=0.5, full_output=True, maxeval=3, dwell=3, maxiter=3, boltzmann=0.5)
"""    order = X[0]
    rank = X[1]
    height = X[2]
    age = X[3]
    vigor = X[4]
    d2a = X[5]
    leaf = X[6]
    threshold = X[7]
    pipe = X[8]
"""
res = anneal(run2, [0,0,0,0,0,0,0.15,0.5,0.9], schedule='fast', lower=[0,-2,-2,-2,-2,-2,0.1,0.1,0.9], upper=[4,2,2,2,2,2,0.2,0.9,0.9], 
    full_output=True, maxiter=10, Ninit=200)
# maxeval=None, dwell=None)
print res
#,0,0,0,0,0,0.15,0.5,0.9], lower=-3, upper=3)
#run2([0,0,0,0,0,0,0.15,0.5,0.9])
