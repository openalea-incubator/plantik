from openalea.plantik.tools.config import ReadConfigFile
import openalea.lpy as lpy
from openalea.plantgl.all import *
import openalea.lpy as lpy
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from openalea.plantik.tools import mtgtools
import numpy

app = QApplication([])
Viewer.start()
options = ReadConfigFile('parameter_analysis.ini')

l = lpy.Lsystem(options.general.filename)
options_pruning = l.context()['options']
options_pruning.general.verbose = False

finput = open(options.general.filename, 'r')
code = finput.read() 

def run(options, code):
    l = lpy.Lsystem()
    l.set(code)
    l.derivationLength = options.general.max_step
    l.context()['options'] = options
    l.iterate()
    l.context()['options'] = options
    Viewer.animation(False)
    tree = l.iterate()   

    #results = mtgtools.get_trunk_branch_length(tree[0][0].mtg)
    return tree[0][0].mtg
    #len(results),map(mtgtools.convert2LMS,  mtgtools.get_trunk_branch_length(tree[0][0].mtg))
    l.plot(tree)

for x in numpy.linspace(0.2,2,10):
    #options_pruning.leaf.resource = x
    options_pruning.context.order_coeff = x
    options_pruning.general.max_step = 150
    print x, 
    tree = run(options_pruning, code)
    
    branches = mtgtools.get_trunk_branch_length(tree)
    print  len(branches), map(mtgtools.convert2LMS,  mtgtools.get_trunk_branch_length(tree))
