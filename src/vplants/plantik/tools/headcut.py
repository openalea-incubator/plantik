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

# number od max steps for the simulation
max_step = 210
# number of simulations
N = 20

""" do not change anything below !! Script used for heading cut

Generates images of the results, that is number of L, M, S shoots
after heading cut is made.

"""

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

    l.context()['options'].pruning.method = 'trunk'
    l.context()['options'].pruning.trunk_time = 90
    l.context()['options'].pruning.trunk_height = 20



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


def model():

    order   = 0.1
    height  = 0
    rank    = -0.1
    age     = -0.1
    vigor   = 0.0
    d2a     =  0.05
    leaf    = 0.12
    pipe_fraction    = 0.9
    growth_threshold = 0.1
    #pruning is made in run()

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

    return seq2

import numpy

def run_model():
    res = {}
    for i in range(0,N):
        print i ,'/',N
        result = model()
        result = numpy.array(result)
        res[i] = result

    count = {}
    count ['L'] = [0,0,0,0,0,0,0,0,0,0]
    count ['M'] = [0,0,0,0,0,0,0,0,0,0]
    count ['S'] = [0,0,0,0,0,0,0,0,0,0]

    for i in range(0,N):
        for x in numpy.where(res[i][-3:-9:-1]==1)[0]:
            count['S'][x] += 1
        for x in numpy.where(res[i][-3:-9:-1]==2)[0]:
            count['M'][x] += 1
        for x in numpy.where(res[i][-3:-9:-1]==3)[0]:
            count['L'][x] += 1
    res['count'] = count
    return res


def plot_head_cut(count, N):
    import pylab
    from pylab import matplotlib
    s  = count['S']
    m  = count['M']
    l  = count['L']
    s.reverse()
    m.reverse()
    l.reverse()
    S = numpy.array(count['S'])/float(N)
    M = numpy.array(count['M'])/float(N)
    L = numpy.array(count['L'])/float(N)
    print N, S
    matplotlib.rc('font', size=22)
    pylab.figure(1)
    x = pylab.linspace(0, len(S), len(S))[::-1]
    pylab.barh(x, L, left=0, color='#666666', label='Long'); 
    pylab.barh(x, M, left=L, color='#CCCCCC', label='Medium'); 
    pylab.barh(x, S, left=L+M, color='#999999', label='Short'); 
    pylab.ylabel('Rank from cut')
    pylab.xlabel('Probability')
    pylab.legend(loc='best')
    pylab.grid(True, linewidth=2)
    pylab.axis(origin='upper')
    pylab.yaxis = pylab.ylim()
    pylab.gca().set_ylim([0,11])
    pylab.gca().set_ylim(pylab.gca().get_ylim()[::-1])
    pylab.savefig('temp.png')


if __name__ == "__main__":


    res = run_model()
    count = res['count']
    print count
    plot_head_cut(count, N)
    import pickle
    pickle.dump(res, open('head_cut_histogram.dat', 'w'))


"""
{'L': [0, 0, 0, 0, 10, 7, 31, 148, 197, 198],
 'M': [0, 0, 0, 0, 7, 46, 148, 50, 3, 2],
 'S': [0, 0, 0, 0, 82, 141, 21, 2, 0, 0]}

200 N {'S': [0, 0, 1, 13, 130, 97, 0, 0, 0, 0], 'M': [5, 3, 32, 156, 56, 5, 0, 0, 0, 0], 'L': [195, 197, 167, 31, 9, 17, 0, 0, 0, 0]}
"""


