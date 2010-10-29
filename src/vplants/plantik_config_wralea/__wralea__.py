
# This file has been generated at Fri Oct 29 10:37:31 2010

from openalea.core import *


__name__ = 'vplants.plantik.config'

__editable__ = True
__description__ = 'to be done'
__license__ = 'CECILL-C'
__url__ = 'http://openalea.gforge.inria.fr/doc/openalea/pylab/doc/_build/html/contents.html'
__alias__ = []
__version__ = '0.8.0'
__authors__ = 'Thomas Cokelaer'
__institutes__ = 'INRIA/CIRAD'
__icon__ = 'icon.png'


__all__ = ['code_ConfigParserSections', 'code_ConfigParserOptions', '_178706636', 'code_ConfigSectionInternode', 'code_SaveConfigParser', 'code_ConfigParams', 'code_ConfigSectionGeneral', 'code_ConfigSectionApex', 'code_ConfigParserGenerator', 'code_ConfigSectionTropism', 'code_ReadConfigParser', 'configuration', 'code_ConfigSectionLeaf']



code_ConfigParserSections = Factory(name='ConfigParserSections',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigParserSections',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ConfigParserOptions = Factory(name='ConfigParserOptions',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigParserOptions',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )



_178706636 = DataFactory(name='pruning.ini',
                    description='Example of configuration file',
                    editors=None,
                    includes=None,
                    )



code_ConfigSectionInternode = Factory(name='ConfigSectionInternode',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigSectionInternode',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_SaveConfigParser = Factory(name='ConfigParserSave',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='SaveConfigParser',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ConfigParams = Factory(name='ConfigParams',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigParams',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ConfigSectionGeneral = Factory(name='ConfigSectionGeneral',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigSectionGeneral',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ConfigSectionApex = Factory(name='ConfigSectionApex',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigSectionApex',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ConfigParserGenerator = Factory(name='ConfigParserGenerator',
                authors='Thomas Cokelaer (wralea authors)',
                description='',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigParserGenerator',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ConfigSectionTropism = Factory(name='ConfigSectionTropism',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigSectionTropism',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




code_ReadConfigParser = Factory(name='ConfigParserRead',
                authors='Thomas Cokelaer (wralea authors)',
                description='Read a ConfigParser',
                category='todo',
                nodemodule='code',
                nodeclass='ReadConfigParser',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




configuration = CompositeNodeFactory(name='configuration',
                             description='',
                             category='Unclassified',
                             doc='',
                             inputs=[{  'desc': '', 'interface': None, 'name': 'IN1', 'value': None}],
                             outputs=[{  'desc': '', 'interface': None, 'name': 'OUT1'}],
                             elt_factory={  2: ('vplants.plantik.config', 'ConfigSectionLeaf'),
   3: ('vplants.plantik.config', 'ConfigSectionInternode'),
   4: ('vplants.plantik.config', 'ConfigSectionTropism'),
   5: ('vplants.plantik.config', 'ConfigSectionApex'),
   6: ('vplants.plantik.config', 'ConfigParserGenerator'),
   7: ('vplants.plantik.config', 'ConfigSectionGeneral')},
                             elt_connections={  146849172: (6, 0, '__out__', 0),
   146849184: (4, 1, 6, 1),
   146849196: (3, 1, 6, 1),
   146849208: (2, 0, 6, 0),
   146849220: (5, 1, 6, 1),
   146849232: (4, 0, 6, 0),
   146849244: (7, 0, 6, 0),
   146849256: (3, 0, 6, 0),
   146849268: (5, 0, 6, 0),
   146849280: (2, 1, 6, 1),
   146849292: (7, 1, 6, 1)},
                             elt_data={  2: {  'block': False,
         'caption': 'ConfigSectionLeaf',
         'delay': 0,
         'factory': '<openalea.core.node.NodeFactory object at 0xba0e0cc> : "ConfigSectionLeaf"',
         'hide': True,
         'id': 2,
         'lazy': True,
         'port_hide_changed': set(),
         'posx': 142.8599042641026,
         'posy': -163.1393435901723,
         'priority': 0,
         'use_user_color': False,
         'user_application': None,
         'user_color': None},
   3: {  'block': False,
         'caption': 'ConfigSectionInternode',
         'delay': 0,
         'factory': '<openalea.core.node.NodeFactory object at 0xba06eac> : "ConfigSectionInternode"',
         'hide': True,
         'id': 3,
         'lazy': True,
         'port_hide_changed': set(),
         'posx': 241.72334197874852,
         'posy': -47.970600770629986,
         'priority': 0,
         'use_user_color': False,
         'user_application': None,
         'user_color': None},
   4: {  'block': False,
         'caption': 'ConfigSectionTropism',
         'delay': 0,
         'factory': '<openalea.core.node.NodeFactory object at 0xba0e74c> : "ConfigSectionTropism"',
         'hide': True,
         'id': 4,
         'lazy': True,
         'port_hide_changed': set(),
         'posx': -146.72853399818695,
         'posy': -121.98663773091607,
         'priority': 0,
         'use_user_color': False,
         'user_application': None,
         'user_color': None},
   5: {  'block': False,
         'caption': 'ConfigSectionApex',
         'delay': 0,
         'factory': '<openalea.core.node.NodeFactory object at 0xba0e5cc> : "ConfigSectionApex"',
         'hide': True,
         'id': 5,
         'lazy': True,
         'port_hide_changed': set(),
         'posx': -17.748847280818662,
         'posy': -174.27030391288616,
         'priority': 0,
         'use_user_color': False,
         'user_application': None,
         'user_color': None},
   6: {  'block': False,
         'caption': 'ConfigParserGenerator',
         'delay': 0,
         'factory': '<openalea.core.node.NodeFactory object at 0xba0e80c> : "ConfigParserGenerator"',
         'hide': True,
         'id': 6,
         'lazy': True,
         'port_hide_changed': set(),
         'posx': -27.894267036339379,
         'posy': 78.519431027058573,
         'priority': 0,
         'use_user_color': False,
         'user_application': None,
         'user_color': None},
   7: {  'block': False,
         'caption': 'ConfigSectionGeneral',
         'delay': 0,
         'factory': '<openalea.core.node.NodeFactory object at 0xba0e70c> : "ConfigSectionGeneral"',
         'hide': True,
         'id': 7,
         'lazy': True,
         'port_hide_changed': set(),
         'posx': -304.89426703633939,
         'posy': -172.48056897294146,
         'priority': 0,
         'use_user_color': False,
         'user_application': None,
         'user_color': None},
   '__in__': {  'block': False,
                'caption': 'In',
                'delay': 0,
                'hide': True,
                'id': 0,
                'lazy': True,
                'port_hide_changed': set(),
                'posx': 71.46102517259942,
                'posy': -260.78245639312013,
                'priority': 0,
                'use_user_color': False,
                'user_application': None,
                'user_color': None},
   '__out__': {  'block': False,
                 'caption': 'Out',
                 'delay': 0,
                 'hide': True,
                 'id': 1,
                 'lazy': True,
                 'port_hide_changed': set(),
                 'posx': 69.614609655556109,
                 'posy': 191.46151724280045,
                 'priority': 0,
                 'use_user_color': False,
                 'user_application': None,
                 'user_color': None}},
                             elt_value={  2: [  (0, "'leaf'"),
         (1, '0.20000000000000001'),
         (2, '21'),
         (3, "'sigmoid'"),
         (4, "'unity'"),
         (5, 'False')],
   3: [  (0, "'internode'"),
         (1, '0.0080000000000000002'),
         (2, '10'),
         (3, 'False')],
   4: [(0, "'tropism'"), (1, 'True'), (2, '-1'), (3, '0.050000000000000003')],
   5: [  (0, "'apex'"),
         (1, '0.33333333333333331'),
         (2, '3.0'),
         (3, 'True'),
         (4, '0.20000000000000001')],
   6: [],
   7: [  (0, "'general'"),
         (1, 'True'),
         (2, '210'),
         (3, '5000'),
         (4, '1'),
         (5, 'False'),
         (6, 'False'),
         (7, "'test'"),
         (8, '2000'),
         (9, "'normal'"),
         (10, 'False')],
   '__in__': [],
   '__out__': []},
                             elt_ad_hoc={  2: {  'position': [142.8599042641026, -163.1393435901723],
         'useUserColor': False,
         'userColor': None},
   3: {  'position': [241.72334197874852, -47.970600770629986],
         'useUserColor': False,
         'userColor': None},
   4: {  'position': [-146.72853399818695, -121.98663773091607],
         'useUserColor': False,
         'userColor': None},
   5: {  'position': [-17.748847280818662, -174.27030391288616],
         'useUserColor': False,
         'userColor': None},
   6: {  'position': [-27.894267036339379, 78.519431027058573],
         'useUserColor': False,
         'userColor': None},
   7: {  'position': [-304.89426703633939, -172.48056897294146],
         'useUserColor': False,
         'userColor': None},
   '__in__': {  'position': [71.46102517259942, -260.78245639312013],
                'useUserColor': False,
                'userColor': None},
   '__out__': {  'position': [69.614609655556109, 191.46151724280045],
                 'useUserColor': False,
                 'userColor': None}},
                             lazy=True,
                             eval_algo='LambdaEvaluation',
                             )




code_ConfigSectionLeaf = Factory(name='ConfigSectionLeaf',
                authors='Thomas Cokelaer (wralea authors)',
                description='Save a ConfigParser object into a file',
                category='todo',
                nodemodule='code',
                nodeclass='ConfigSectionLeaf',
                inputs=None,
                outputs=None,
                widgetmodule=None,
                widgetclass=None,
               )




