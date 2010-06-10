
# Redirect path
import os

cdir = os.path.dirname(__file__)
pdir = os.path.join(cdir, "../../plantik")
pdir = os.path.abspath(pdir)

__path__ = [pdir] + __path__[:]

from vplants.plantik.__init__ import *
