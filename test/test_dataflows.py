from openalea.core.alea import *

pm = PackageManager(verbose=False)
pm.init(verbose=False)


def test_dataflow_test():
    names = ['ConfigParserRead', 'ConfigParserSave', 'ConfigParams']
    for i in range(0, len(names)):
        yield check,'test', names[i]


def check(wralea, name):
    res = run(('vplants.plantik.%s' % wralea, name),{},pm=pm)
    from pylab import close
    close('all')

