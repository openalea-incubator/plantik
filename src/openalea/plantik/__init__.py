# Redirect path
import os
import vplants.plantik

__path__ = vplants.plantik.__path__ + __path__[:]

from vplants.plantik.__init__ import *
