from openalea.plantik.tools.config import ConfigParams
import openalea.lpy as lpy
from openalea.plantgl.all import *
import openalea.lpy as lpy
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from openalea.plantik.tools import mtgtools
import numpy
from openalea.stat_tool import *
from openalea.sequence_analysis import *
from openalea.plantik import get_shared_data

app = QApplication([])
Viewer.start()
Viewer.animation(False)

#first we read the configuration file for this script, and the pruning model

l = lpy.Lsystem(get_shared_data('pruning.lpy'))
options_pruning = l.context()['options']
options_pruning.general.verbose = False
options_pruning.geometry.leaf_view = False

finput = open(get_shared_data('pruning.lpy'), 'r')
code = finput.read() 

production = False
max_step = 210

def run(options_pruning, code, order=0, age=0, rank=0, height=0, vigor=0, d2a=0, leaf=0.15, pipe_fraction=0.9, growth_threshold=0.9):
    l = lpy.Lsystem()
    l.set(code)
    l.derivationLength = int(max_step)
    options_pruning.apex.growth_threshold = growth_threshold
    options_pruning.pipe.fraction = pipe_fraction
    l.context()['options'] = options_pruning
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


seq_data1 = Sequences('/home/cokelaer/Seq07_T_C_b.txt')
seq_data2 = Sequences('/home/cokelaer/Seq07_T_C_f.txt')

def model(X):

    order   = X['order']
    height  = X['height']
    rank    = X['rank']
    age     = X['age']
    vigor   = X['vigor']
    d2a     = X['d2a']
    leaf    = X['leaf']
    pipe_fraction    = X['pipe']
    growth_threshold = X['threshold']
    print 'param o=',order, ' l=',leaf, ' a=',age, ' h=', height,' v=',vigor, ' r=',rank, ' d2a=', d2a, ' thres=', growth_threshold, ' pipe=' , pipe_fraction
    try:
        tree = run(options_pruning, code, order=order, 
            age=age, height=height, vigor=vigor, 
            rank=rank, d2a=d2a, leaf=leaf, pipe_fraction=pipe_fraction, growth_threshold=growth_threshold)

        mtg = tree[0][0].mtg

        seq2 = tree[0][0].mtgtools.get_trunk_sequence()
        lms = tree[0][0].mtgtools.get_trunk_info()
        print  '--', len(lms), lms, seq2
    except:
        seq2 = []
        lms = []
        print '-- failed'
        tree = None


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


    #compatible_seq = Sequences(seq2)
    distance_matrix = Compare(Merge(SelectVariable(seq_data1,1), compatible_seq),
                                             VectorDistance("O"))
    idm = ImprovedDistanceMatrix(distance_matrix)
    res1 = idm.cumulated_distance()
    distance_matrix = Compare(Merge(SelectVariable(seq_data2,1), compatible_seq),
                                            VectorDistance("O"))
    idm = ImprovedDistanceMatrix(distance_matrix)
    res2 = idm.cumulated_distance()

    res3 = len(seq2)

    if tree:
        try:
            vol = tree[0][0].mtgtools.getVolumeInternodes()
        except:
            vol =  0
    else:
        vol = 0
    print res1[-1], ' ' ,res2[-1], ' ' ,res3, ' ',vol
    return res1[-1], res2[-1], res3, vol



import numpy
import rpy2.robjects as robj
from rpy2.robjects.numpy2ri import numpy2ri #force conversion mode of Robject
r = robj.r

r.require('sensitivity')

def Morris(repet,factors,binf,bsup):
    """ Simplified import of R'Morris function"""
    factors=robj.StrVector(factors)
    binf=numpy.array(binf)
    bsup=numpy.array(bsup)
    d=r.list('oat', 5, 3)
    d= r['names<-'](d,['type','levels','grid.jump'])
    m = r.morris(factors=factors,r=repet,design=d,binf=binf,bsup=bsup)
    param=r['data.frame'](m.r["X"][0])
    pdict = dict((k,numpy.array(param.r[k][0]).tolist()) for k in r.colnames(param))

    l = len(pdict[pdict.keys()[0]])
    print 'Computational cost Morris SA is %d' % l
    return m,pdict

def Morris_IS(morrisPlan, y):
    """ Compute morris sensitivity indicators for a Morris plan and the corresponding model responses"""
    mod=r.tell(morrisPlan, numpy.array(y))
    ee=mod.r['ee'][0]
    mu=r.apply(ee,2,r['mean'])
    mustar=r.apply(ee,2,r('function(x) mean(abs(x))'))
    sigma=r.apply(ee,2,r.sd)
    return mod,numpy.array(mu).tolist(),numpy.array(mustar).tolist(),numpy.array(sigma).tolist(), ee

def plotSens(mu, mus, sigma, labels=None, filename='morris.png'):
    """ moris plot"""
    print 'Saving Morris results'
    import pylab
    pylab.clf()
    #pylab.errorbar(mus, sigma, xerr=sigma, marker='o', ecolor='blue')
    pylab.plot(mus, sigma, 'o')
    pylab.hold(True)
    if labels:
        for i, label in enumerate(labels):
            pylab.text(mus[i]+0.05, sigma[i], label)
    pylab.xlabel(r'$mu^*$', fontsize=16)
    pylab.ylabel(r'$\sigma$', fontsize=16)
    pylab.savefig(filename)


factors = ['order', 'height', 'rank', 'age', 'vigor', 'd2a', 'pipe', 'threshold', 'leaf', 'dummy']
params = {'order':1, 'height':0, 'rank':0, 'age':0, 'vigor':0, 'd2a':0, 'pipe':0.9, 'threshold':0.9, 'leaf':0.15, 'dummy':0}
binf=[0, -1, -1, -1, -1, -1, 0.9, 0.1, 0.10, -3]
bsup=[2,  1,  1,  1,  1,  1, 0.95, 0.2, 0.18,  3]
repet = 8

# run morris plan
plan, pd = Morris(repet, factors=factors, binf=binf, bsup=bsup)


# launch simulations according to morris plan
x = params
l = len(pd['leaf'])
match1 = []
match2 = []
lengths = []
volumes =[]

simulation = {}
simulation['morris'] = {'repet':2, 'factors':factors, 'params':params, 'binf':binf, 'bsup':bsup}
simulation['pruning'] = {'max_step':max_step}

import copy
for simu in range(0,l):
    print 'PROGRESS ', simu, '/', l
    this_param = copy.deepcopy(params)
    for key in pd.keys():
        this_param[key] = pd[key][simu]
    results = model(this_param)
    match1.append(results[0])
    match2.append(results[1])
    lengths.append(results[2])
    volumes.append(results[3])
    print simu, this_param
    simulation[simu] = {'param':this_param, 'results':results}
simulation['match1'] = match1
simulation['match2'] = match2
simulation['lengths'] = lengths
simulation['volumes'] = volumes

print match1
print match2
print lengths
print volumes

mod,mu,mustar,sigma,ee = Morris_IS(plan, match1)
plotSens(mu, mustar, sigma, factors, 'morris_match1.png')
mod, mu,mustar, sigma,ee = Morris_IS(plan, match2)
plotSens(mu,mustar, sigma, factors, 'morris_match2.png')
mod, mu,mustar, sigma,ee = Morris_IS(plan, lengths)
plotSens(mu,mustar, sigma, factors, 'morris_lengths.png')
mod, mu,mustar, sigma,ee = Morris_IS(plan, volumes)
plotSens(mu,mustar, sigma, factors, 'morris_volumes.png')

print ee


import pickle
pickle.dump(simulation, open('morris_results.dat', 'w'))
