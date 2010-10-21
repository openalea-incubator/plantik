from openalea.mtg.aml import Rank
import openalea.mtg.traversal as traversal

__all__ = ['strahler']

    
def strahler_symmetry(mtg):
    return strahler(mtg) - max([Rank(a) for a in mtg])


def strahler_order(g, vid):
    strahler = {}
    for v in traversal.post_order(g, vid):
        children_strahler = [strahler[c] for c in g.children(v)]
        if children_strahler:
            m, M = min(children_strahler), max(children_strahler)
            strahler[v] = M if m != M else M+1
        else: 
            strahler[v] = 1
    return strahler

def strahler(g, vid=2):
   return max(strahler_order(g, vid).values())
