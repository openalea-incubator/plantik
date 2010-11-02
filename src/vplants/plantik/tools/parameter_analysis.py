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

app = QApplication([])
Viewer.start()
Viewer.animation(False)

options = ConfigParams('parameter_analysis.ini')

l = lpy.Lsystem(options.general.filename)
options_pruning = l.context()['options']
options_pruning.general.verbose = False
options_pruning.geometry.leaf_view = False

finput = open(options.general.filename, 'r')
code = finput.read() 

def run(options, code):
    l = lpy.Lsystem()
    l.set(code)
    l.derivationLength = int(options.general.max_step)
    l.context()['options'] = options
    l.iterate()
    #l.context()['options'] = options
    Viewer.animation(False)
    tree = l.iterate()   

    #results = mtgtools.get_trunk_branch_length(tree[0][0].mtg)
    return tree
    #len(results),map(mtgtools.convert2LMS,  mtgtools.get_trunk_branch_length(tree[0][0].mtg))
    #l.plot(tree)

print 'Initialisation',
options_pruning.general.max_step = 210
options_pruning.context.order_coeff = 2
#meantree, duration = run(options_pruning, code)  
#branches = mtgtools.get_trunk_branch_length(meantree)
#seq1 = mtgtools.create_sequences(meantree)
#print  len(branches), map(mtgtools.convert2LMS,  mtgtools.get_trunk_branch_length(meantree))
    
    
from openalea.stat_tool import *

from openalea.sequence_analysis import *
seq_data1 = Sequences('/home/cokelaer/Seq07_T_C_b.txt')
seq_data2 = Sequences('/home/cokelaer/Seq07_T_C_f.txt')
print '...done'

for this in ['age', 'order', 'leaf', 'vigor', 'path']:
    assert getattr(options, this).bins >= 1
n1 = options.order.bins
n2 = options.leaf.bins
n3 = options.age.bins
n4 = options.path.bins
n5 = options.vigor.bins
    
results1 = numpy.zeros((n1, n2, n3, n4, n5))
results2 = numpy.zeros((n1, n2, n3, n4, n5))
results12 = numpy.zeros((n1, n2, n3, n4, n5))
all_results = numpy.zeros((n1, n2, n3, n4, n5), dtype=lpy.AxialTree)
count = 0
import time
for i, order in enumerate(numpy.linspace(options.order.min, options.order.max, n1)):
    for j, leaf in enumerate(numpy.linspace(options.leaf.min, options.leaf.max, n2)):
        for k, age in enumerate(numpy.linspace(options.age.min,options.age.max, n3)):
            for l, path in enumerate(numpy.linspace(options.path.min,options.path.max, n4)):
                for m, vigor in enumerate(numpy.linspace(options.vigor.min,options.vigor.max, n5)):
                    count += 1
                    print count / float(n1*n2*n3*n4*n5)
                    options_pruning.leaf.resource = leaf
                    options_pruning.context.order_coeff = order
                    options_pruning.context.age_coeff = age
                    options_pruning.context.height_coeff = path
                    options_pruning.context.vigor_coeff = vigor
                    options_pruning.general.max_step = 140

                    print 'param o=',order, ' l=',leaf, ' a=',age, ' p=', path,'v=',vigor
                    tree = run(options_pruning, code)
                    mtg = tree[0][0].mtg
                    print 'lpy duration=',tree[0][0].duration 
                    time1 = time.time()
                    branches = mtgtools.get_trunk_branch_length(mtg)
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
import pickle
pickle.dump({'results':all_results, 'options':options}, open('/tmp/test.dat', 'w'))                    
numpy.save('data1', results1)
numpy.save('data2', results2)
numpy.save('data12', results12)
#pylab.clf(); f = pylab.imshow(results[:,:, 0, 0, 0], interpolation='nearest', origin='lower', extent=[1,3,0.04, 1]); pylab.colorbar(); pylab.axis('normal');pylab.show()
