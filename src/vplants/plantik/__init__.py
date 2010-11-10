__revision__ = "$Id$"


from openalea.deploy import get_metainfo


version = get_metainfo('vplants.plantik', 'version')
authors = get_metainfo('vplants.plantik', 'author')




def get_shared_data(file):
    from os.path import join as pj
    from openalea.deploy.shared_data import get_shared_data_path
    import openalea.plantik
    shared_data_path = get_shared_data_path(openalea.plantik.__path__)
    return pj(shared_data_path, file)

from vplants.plantik import biotik
from biotik import *

from vplants.plantik import tools
from tools import *

from vplants.plantik import plants
from plants import *

from vplants.plantik import simulation
from simulation import *
