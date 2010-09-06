        

def create_lstring():
    from openalea.lpy import AxialTree, ParamModule
    from openalea.plantik import Apex, Leaf, Internode, Branch, GrowthUnit, Plant
    N = 5
    P = ParamModule('P', Plant(1))
    A = ParamModule('A', Apex())
    L = ParamModule('L', Leaf(resource_per_day=0.5))
    I = ParamModule('I', Internode())
    B = ParamModule('B', Branch())
    U = ParamModule('U', GrowthUnit())
    
    a = AxialTree([B, U, A, I, L, A, I, L, A, I, L, A])
    return a
