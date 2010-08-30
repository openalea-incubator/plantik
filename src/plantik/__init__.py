import simulation
import plants
import tools
import biotik

from biotik import *
from plants import *
from tools import *
from plants import *


from openalea.deploy.shared_data import get_shared_data_path
from os.path import join as pj

def get_shared_data(file):
    import openalea.plantik
    shared_data_path = get_shared_data_path(openalea.plantik.__path__)
    return pj(shared_data_path, file)

