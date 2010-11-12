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

def run(options, code, order=0, age=0, rank=0, height=0, vigor=0, d2a=0, leaf=0.15):
    l = lpy.Lsystem()
    l.set(code)
    l.derivationLength = int(options.general.max_step)
    l.context()['options'] = options
    l.context()['options'].context.order_coeff  = order
    l.context()['options'].context.rank_coeff   = rank
    l.context()['options'].context.height_coeff = height
    l.context()['options'].context.d2a_coeff    = d2a
    l.context()['options'].context.age_coeff    = age
    l.context()['options'].context.vigor_coeff  = vigor
    l.context()['options'].leaf.resource  = leaf
    res = l.iterate()
    Viewer.animation(False)
    tree = l.iterate(1,50, res)   
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

for this in ['age', 'order', 'leaf', 'vigor', 'height', 'd2a', 'height', 'rank', 'growth_threshold', 'pipe_fraction']:
    assert getattr(options, this).bins >= 1
n1 = options.order.bins
n2 = options.rank.bins
n3 = options.height.bins
n4 = options.age.bins
n5 = options.vigor.bins
n6 = options.d2a.bins
n7 = options.leaf.bins
n8 = options.growth_threshold.bins
n9 = options.pipe_fraction.bins

results1 = numpy.zeros((n1, n2, n3, n4, n5, n6, n7, n8, n9))
results2 = numpy.zeros((n1, n2, n3, n4, n5, n6, n7, n8, n9 ))
results12 = numpy.zeros((n1, n2, n3, n4, n5, n6, n7, n8, n9))
all_results = numpy.zeros((n1, n2, n3, n4, n5, n6, n7, n8, n9), dtype=lpy.AxialTree)
count = 0
import time
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
                                    print "Progress: %f  completed" % (count / float(n1*n2*n3*n4*n5*n6*n7*n8*n9))
                                    options_pruning.apex.growth_threshold = growth_threshold
                                    options_pruning.pipe.fraction = pipe_fraction

                                    print 'param o=',order, ' l=',leaf, ' a=',age, ' p=', height,'v=',vigor
                                    tree = run(options_pruning, code, order=order, 
                                        age=age, height=height, vigor=vigor, 
                                        rank=rank, d2a=d2a)
                                    mtg = tree[0][0].mtg
                                    print 'lpy duration=',tree[0][0].duration 
                                    time1 = time.time()
                                    """branches = mtgtools.get_trunk_branch_length(mtg)
                                    print  '--',len(branches), map(mtgtools.convert2LMS,  
                                                                   mtgtools.get_trunk_branch_length(mtg))
                                    seq2 = mtgtools.create_sequences(mtg)
                                    #print seq2
                                    #print '--leven=',LevenshteinDistance( [s[0] for s in seq1[0]], [s[0] for s in seq2[0]])
                                    #print '--strahler=',strahler(tree)
                                    #Viewer.frameGL.saveImage('output.png', 'png')
                                    #seq2[0] contains a Sequence object with all trunk information LMS 
                                    # if no branchees, all values are equal to zero which raise errror in Merge 
                                    # so we put a branch at the bottom...
                                    if len(branches)==0 :             
                                        compatible_seq = [b for b in seq2[0][0]]
                                        compatible_seq[0][0] = 1
                                        compatible_seq = Sequences(compatible_seq)
                                    else:
                                        compatible_seq = seq2[0]
                                    print 'trunk (%s)=%s', (len(compatible_seq[0]), compatible_seq[0])
                                    #print 'duration=',all[0][0].duration 
                                    distance_matrix = Compare(Merge(SelectVariable(seq_data1,1), compatible_seq), 
                                                VectorDistance("O"))
                                    idm = ImprovedDistanceMatrix(distance_matrix)
                                    res = idm.cumulated_distance()
                                    results1[i,j,k,l,m] = res[-1]
                                    print 'compare1=',res[-1]
                                    print 'duration2=',time.time()-time1
                                    distance_matrix = Compare(Merge(SelectVariable(seq_data2,1), compatible_seq), 
                                                VectorDistance("O"))
                                    idm = ImprovedDistanceMatrix(distance_matrix)
                                    res = idm.cumulated_distance()
                                    results2[i,j,k,l,m] = res[-1]
                                    print 'compare2=',res[-1]
                                    distance_matrix = Compare(Merge(SelectVariable(seq_data1,1), SelectVariable(seq_data2,1), compatible_seq), 
                                                VectorDistance("O"))
                                    idm = ImprovedDistanceMatrix(distance_matrix)
                                    res = idm.cumulated_distance()
                                    results12[i,j,k,l,m] = res[-1]
                                    print 'compare12=',res[-1]
                                    print 'duration2=',time.time()-time1
                                    del tree[0][0].lstring
                                    tree[0][0].mtg.properties()['geometry']={}
                                              all_results[i,j,k,l,m] = tree[0][0]
                                    """
import pickle
pickle.dump({'results':all_results, 'options':options}, open('/tmp/test.dat', 'w'))                    
numpy.save('data1', results1)
numpy.save('data2', results2)
numpy.save('data12', results12)
#pylab.clf(); f = pylab.imshow(results[:,:, 0, 0, 0], interpolation='nearest', origin='lower', extent=[1,3,0.04, 1]); pylab.colorbar(); pylab.axis('normal');pylab.show()
