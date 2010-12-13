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

#first we read the configuration file for this script, and the pruning model
options = ConfigParams('parameter_analysis.ini')

l = lpy.Lsystem(get_shared_data(options.general.filename))
options_pruning = l.context()['options']
options_pruning.general.verbose = False
options_pruning.geometry.leaf_view = False

finput = open(get_shared_data(options.general.filename), 'r')
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
        Viewer.frameGL.saveImage('pruning_%2.2f_%2.2f_%2.2f_%2.2f_%2.2f_%2.2f_%2.2f.png' % 
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
all_sequences = []
print '...done'

for this in ['age', 'order', 'leaf', 'vigor', 'height', 'd2a', 'height', 'rank', 'growth_threshold', 'pipe_fraction']:
    assert getattr(options, this).bins >= 1

n1 = int(options.order.bins)
n2 = int(options.rank.bins)
n3 = int(options.height.bins)
n4 = int(options.age.bins)
n5 = int(options.vigor.bins)
n6 = int(options.d2a.bins)
n7 = int(options.leaf.bins)
n8 = int(options.growth_threshold.bins)
n9 = int(options.pipe_fraction.bins)

bins = [n1, n2, n3, n4, n5, n6, n7, n8, n9]
param_bins = {'order':n1, 'rank':n2, 'height':n3,
            'age':n4, 'vigor':n5, 'd2a':n6, 
            'leaf':n7, 'threshold':n8, 'pipe':n9}
param_min = {'order': options.order.min,
            'rank':options.rank.min,
            'height':options.height.min,
            'age':options.age.min,
            'vigor':options.vigor.min,
            'd2a':options.d2a.min,
            'leaf':options.leaf.min,
            'threshold':options.growth_threshold.min,
            'pipe':options.pipe_fraction.min}
param_max = {'order': options.order.max,
            'rank':options.rank.max,
            'height':options.height.max,
            'age':options.age.max,
            'vigor':options.vigor.max,
            'd2a':options.d2a.max,
            'leaf':options.leaf.max,
            'threshold':options.growth_threshold.max,
            'pipe':options.pipe_fraction.max}

results1 = numpy.zeros(bins)
results2 = numpy.zeros(bins)
results12 = numpy.zeros(bins)
volumes= numpy.zeros(bins)
all_results = numpy.zeros(bins, dtype=lpy.AxialTree)

repetitions = options.general.repetition
count = 0
import time
for repet in range(0, repetitions):
  for i, order in enumerate(numpy.linspace(options.order.min, options.order.max, n1)):
    for j, rank in enumerate(numpy.linspace(options.rank.min, options.rank.max, n2)):
        for k, height in enumerate(numpy.linspace(options.height.min,options.height.max, n3)):
            for l, age in enumerate(numpy.linspace(options.age.min,options.age.max, n4)):
                for m, vigor in enumerate(numpy.linspace(options.vigor.min,options.vigor.max, n5)):
                    for n, d2a in enumerate(numpy.linspace(options.d2a.min,options.d2a.max, n6)):
                        for o, leaf in enumerate(numpy.linspace(options.leaf.min,options.leaf.max, n7)):
                            for p, growth_threshold in enumerate(numpy.linspace(options.growth_threshold.min,options.growth_threshold.max, n8)):
                                for q, pipe_fraction in enumerate(numpy.linspace(options.pipe_fraction.min,options.pipe_fraction.max, n9)):
                                    count += 1
                                    print "\n----->Progress: %f  completed" % (100*count / float(n1*n2*n3*n4*n5*n6*n7*n8*n9*repetitions))
                                    options_pruning.apex.growth_threshold = growth_threshold
                                    options_pruning.pipe.fraction = pipe_fraction
                                    print 'param o=',order, ' l=',leaf, ' a=',age, ' h=', height,' v=',vigor, ' r=',rank, ' d2a=', d2a, ' thres=', growth_threshold, ' pipe=' , pipe_fraction
                                    try:
                                        tree = run(options_pruning, code, order=order, 
                                            age=age, height=height, vigor=vigor, 
                                            rank=rank, d2a=d2a, leaf=leaf, 
                                            max_step=int(options.general.iteration))
                                        mtg = tree[0][0].mtg

                                        print 'lpy duration=',tree[0][0].duration 
                                        seq2 = tree[0][0].mtgtools.get_trunk_sequence()
                                        lms = tree[0][0].mtgtools.get_trunk_info()
                                        print  '--', len(lms), lms, seq2
                                    except:
                                        seq2 = []   
                                        lms = []
                                        print '-- failed'
                                        tree = None
                                    time1 = time.time()


                                    """
                                    #print seq2
                                    #print '--leven=',LevenshteinDistance( [s[0] for s in seq1[0]], [s[0] for s in seq2[0]])
                                    #print '--strahler=',strahler(tree)
                                    #Viewer.frameGL.saveImage('output.png', 'png')
                                    #seq2[0] contains a Sequence object with all trunk information LMS 
                                    # if no branchees, all values are equal to zero which raise errror in Merge 
                                    # so we put a branch at the bottom...
                                    """
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
                                    all_sequences.append([[b] for b in seq2])
                                    # for some reasons, the sequenc emust contain at least 2 different values. 
                                    # For instance, [2,2,2] will raise an error

                                    #compatible_seq = Sequences(seq2)
                                    distance_matrix = Compare(Merge(SelectVariable(seq_data1,1), compatible_seq),
                                                VectorDistance("O"), End="Free")
                                    idm = ImprovedDistanceMatrix(distance_matrix)
                                    res = idm.cumulated_distance()
                                    results1[i,j,k,l,m,n,o,p,q] = res[-1]
                                    print 'compare1=',res[-1],
                                    distance_matrix = Compare(Merge(SelectVariable(seq_data2,1), compatible_seq),
                                            VectorDistance("O"),End="Free")
                                    idm = ImprovedDistanceMatrix(distance_matrix)
                                    res = idm.cumulated_distance()
                                    results2[i,j,k,l,m,n,o,p,q] = res[-1]
                                    print 'compare2=',res[-1]
                                    distance_matrix = Compare(Merge(SelectVariable(seq_data1,1),
                                        SelectVariable(seq_data2,1), compatible_seq), VectorDistance("O"), End="Free")
                                    idm = ImprovedDistanceMatrix(distance_matrix)
                                    res = idm.cumulated_distance()
                                    results12[i,j,k,l,m,n,o,p,q] = res[-1]
                                    print 'compare12=',res[-1],


                                    if tree:
                                        try:
                                            volumes[i,j,k,l,m,n,o,p,q] =  tree[0][0].mtgtools.getVolumeInternodes()
                                        except:
                                            volumes[i,j,k,l,m,n,o,p,q] =  0
                                    else:
                                        volumes[i,j,k,l,m,n,o,p,q] =  0
                                    #del tree[0][0].lstring
                                    #tree[0][0].mtg.properties()['geometry']={}
                                    #all_results[i,j,k,l,m] = tree[0][0]



import pickle
#pickle.dump({'results':all_results, 'options':options}, open('/tmp/test.dat', 'w'))


pickle.dump({'match12':results12, 'match1':results1, 'match2':results2, 'volumes':volumes, 
            'param_min':param_min, 'param_max':param_max, 'param_bins':param_bins, 'all_sequences':all_sequences},  open('results.dat','w'))


"""
from openalea.plantik.tools.plot import *


"""

