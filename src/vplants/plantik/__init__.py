__revision__ = "$Id$"

"""import simulation
import plants
import tools
import biotik

from biotik import *
from plants import *
from tools import *
from simulation import *
"""


def get_shared_data(file):
    from os.path import join as pj
    from openalea.deploy.shared_data import get_shared_data_path
    import openalea.plantik
    shared_data_path = get_shared_data_path(openalea.plantik.__path__)
    return pj(shared_data_path, file)

