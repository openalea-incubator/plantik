import openalea.lpy as lpy
from PyQt4.QtCore import *
from PyQt4.QtGui import *
import time
from openalea.plantgl.all import *
from openalea.mtg.io import lpy2mtg, mtg2lpy, axialtree2mtg, mtg2axialtree
from openalea.mtg.aml import *
import openalea.misc.lsprofcalltree as lsprofcalltree

import sys
import openalea.mtg.traversal as traversal
from math import sqrt

#import tools
#from tools import strahler, strahler_symmetry, mtg_plot


def run(filename='experiment1.lpy'):
    """Run a lsystem


    """
    #if filename==None:
    #    raise ValueError('filename must be provided')
    print 'starting simulation'
    time1 = time.time()
    l = lpy.Lsystem(filename)
    Viewer.animation(False)
    #l.animate()

    context = l.context()
    scales = {}
    parameters = {}
    modules = context.declaredModules()
    for m in modules:
        label = m.name
        parameters[m.name] = m.parameterNames
        scales[m.name] = m.scale

    print scales
    print parameters

    scales = {'A':4,'I':4,'L':4, 'B':2,'U':3, 'P':1}
    assert parameters == {'A': ['Apex'], 'I': ['Internode'],  'L': ['Leaf'], 'P':['Plant'], 'B':['Branch'], 'U':['GrowthUnit'], 'R':[]}

    max_step = l.derivationLength
    print max_step
    tree = l.iterate(1)
    for i in range(0, max_step):
        tree = l.iterate(i, 1, tree)
        #scene = l.sceneInterpretation(tree)
        #mtg1 = axialtree2mtg(tree, scales, scene, parameters)

        #print mtg1.property('Apex')[0]
        #[mtg2.order(id) for id in mtg2.property('Apex')]
        # update the radisu using a pipe model 

        # 2 is the Root's id
        #for vid in traversal.post_order(mtg2, 2)
        #all_radius = plantframe.compute_radius(mtg1, 2, mtg1.property('Internode')[2].radius)
        #print tree
        #tree1 = mtg2axialtree(mtg1, scales, parameters, None)
        #print tree1
        #del tree1[0]
        #del tree1[-1]
        #assert str(tree)==str(tree1[1])
    #print 'strahler=', strahler(mtg1)
    
    time2 = time.time()
    print 'Simulation took %s' % str(time2-time1)
    l.plot(tree)
    Viewer.frameGL.setBgColor(170,170,255)
    Viewer.frameGL.setSize(1024, 1024)
    Viewer.frameGL.saveImage('output.png', 'png')

    lsystem = l
    lstring = tree

    return (lsystem, lstring)

    # first method
    #l.makeCurrent()
    #context = l.context()
    #modules = context.declaredModules()
    #parameters = {}
    #scales = {}
    #for m in modules:
    #    label = m.name
    #    parameters[m.name] = m.parameterNames
    #    scales[m.name] = m.scale
    #scene = l.sceneInterpretation(tree)
    #mtg_plot(mtg2,1)





if __name__=="__main__":
    import cProfile
    import sys
    if len(sys.argv)!=2 and len(sys.argv)!=3:
        raise ValueError("usage: python runlpy.py filename.lpy --profiling")
    filename = sys.argv[1]
    if len(sys.argv)==3:
        option = sys.argv[2]
    else:
        option = 'whatever'

    app = QApplication([])
    Viewer.start()
    if option == '--profiling':
        p = cProfile.Profile()
        #cmd = "run(%s)" % filename
        p.run('run(%s)' % filename)
        k = lsprofcalltree.KCacheGrind(p)
        data = open('prof.kgrind', 'w+')
        k.output(data)
        data.close()
    else:
        run(filename)

