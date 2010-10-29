###############################################################################
# -*- python -*-
#
#       Copyright or (C) or Copr. 2010 INRIA - CIRAD - INRA
#
#       File author(s): Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
#
#       Distributed under the Cecill-C License.
#       See accompanying file LICENSE.txt or copy at
#           http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html
#
#       OpenAlea WebSite : http://openalea.gforge.inria.fr
#
###############################################################################

__doc__="""plantik config nodes"""
__revision__ = " $Revision$ "
__author__ = "$Author$"
__date__ = "$Date$"


from openalea.core import Node
from openalea.core import Factory, IFileStr, IInt, IBool, IFloat, \
    ISequence, IEnumStr, IStr, IDirStr, ITuple3, IDict, ITuple




class ConfigParserGenerator(Node):
    """Build up a ConfigParser instance with a list of section names and associated dictionaries.

    length of sections should the same as the list of dictionaries

    .. dataflow:: vplants.plantik.test ConfigParserGenerator

    .. sectionauthors:: Thomas Cokelaer
    """
    def __init__(self):

        Node.__init__(self)
        self.add_input(name='sections')
        self.add_input(name='options')
        self.add_output(name='config')

    def __call__(self, inputs):
        from ConfigParser import ConfigParser
        config = ConfigParser()

        sections = self.get_input('sections')
        options = self.get_input('options')
        if type(sections) != list:
            sections = [sections]
        if type(options) != list:
            options = [options]
        
        print sections
        print options

        assert len(sections) == len(options)

        for section, option in zip(sections, options):
            config.add_section(section)
            for key, value in option.iteritems():
                config.set(section, key, str(value))

        return config

class ConfigParams(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='configParser or filename')
        self.add_output(name='config')

    def __call__(self, inputs):
        from vplants.plantik.tools import config
        config_instance = self.get_input('configParser or filename')
        new_config = config.ConfigParams(config_instance)
        return (new_config, )


class ConfigSectionInternode(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='name', interface=IStr, value='internode')
        self.add_input(name='cambial_fraction', interface=IFloat, value=0.008)
        self.add_input(name='maturation', interface=IFloat, value=10)
        self.add_input(name='store_data', interface=IBool, value=False)
        self.add_output(name='section_name', interface=IStr, value=None)
        self.add_output(name='options', interface=IDict, value={})

    def __call__(self, inputs):
        res = {}
        for key in ['cambial_fraction', 'maturation', 'store_data']:
            res[key] = self.get_input(key)
        return (self.get_input('name'), res, )

class ConfigSectionLeaf(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='name', interface=IStr, value='leaf')
        self.add_input(name='resource', interface=IFloat(0,1,0.01), value=0.2)
        self.add_input(name='maturation', interface=IFloat, value=21)
        self.add_input(name='growth_function', interface=IEnumStr(['sigmoid']), value='sigmoid')
        self.add_input(name='efficiency_method', interface=IEnumStr(['unity','sigmoid']), value='unity')
        self.add_input(name='store_data', interface=IBool, value=False)
        self.add_output(name='section_name', interface=IStr, value=None)
        self.add_output(name='options', interface=IDict, value={})

    def __call__(self, inputs):
        res = {}
        for key in ['resource', 'maturation', 'growth_function', 'efficiency_method', 'store_data']:
            res[key] = self.get_input(key)
        return (self.get_input('name'), res, )




class ConfigSectionApex(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='name', interface=IStr, value='apex')
        self.add_input(name='demand', interface=IFloat(0,1,0.01), value=1./3.)
        self.add_input(name='plastochron', interface=IFloat, value=3.)
        self.add_input(name='store_data', interface=IBool, value=True)
        self.add_input(name='growth_threshold', interface=IFloat, value=0.2)
        self.add_output(name='section_name', interface=IStr, value=None)
        self.add_output(name='options', interface=IDict, value={})

    def __call__(self, inputs):
        res = {}
        for key in ['demand', 'plastochron', 'store_data', 'growth_threshold']:
            res[key] = self.get_input(key)
        return (self.get_input('name'), res, )



class ConfigSectionGeneral(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='name', interface=IStr, value='general')
        self.add_input(name='verbose', interface=IBool, value=True)
        self.add_input(name='max_step', interface=IInt, value=210)
        self.add_input(name='max_elements', interface=IInt, value=5000)
        self.add_input(name='time_step', interface=IInt, value=1)
        self.add_input(name='save_image', interface=IBool, value=False)
        self.add_input(name='movie', interface=IBool, value=False)
        self.add_input(name='tag', interface=IStr, value='test')
        self.add_input(name='starting_year', interface=IFloat, value=2000)
        self.add_input(name='colorcode', interface=IEnumStr(['normal', 'order', 'length', 'allocated']), value='normal')
        self.add_input(name='fast', interface=IBool, value=False)
        self.add_output(name='section_name', interface=IStr, value=None)
        self.add_output(name='options', interface=IDict, value={})

    def __call__(self, inputs):
        res = {}
        for key in ['verbose', 'max_step', 'max_elements', 'time_step', 'save_image',
            'movie', 'tag', 'starting_year', 'colorcode', 'fast']:
            res[key] = self.get_input(key)
        return (self.get_input('name'), res, )

class ConfigSectionTropism(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='name', interface=IStr, value='tropism')
        self.add_input(name='tropism', interface=IBool, value=True)
        self.add_input(name='z-tropism', interface=IFloat, value=-1)
        self.add_input(name='elasticity', interface=IFloat(0,1,0.01), value=0.05)

        self.add_output(name='section_name', interface=IStr, value=None)
        self.add_output(name='options', interface=IDict, value={})
    def __call__(self, inputs):
        res = {}
        for key in ['tropism', 'z-tropism', 'elasticity']:
            res[key] = self.get_input(key)
        return (self.get_input('name'), res, )




class ConfigParserOptions(Node):
    """read a section from a config file and return dictionary with key/value pairs"""
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='config')
        self.add_input(name='section', interface=IStr, value=None)
        self.add_output(name='options')

    def __call__(self, inputs):
        config = self.get_input('config')
        section = self.get_input('section')
        res = {}
        if section in config.sections():
            options = config.options(section)
            for option in options:
                try:
                    res[option] = config.getboolean(section, option) 
                except:
                    try:
                        res[option] = config.getfloat(section, option) 
                    except:
                        res[option] = config.get(section, option) 
        return res

class ConfigParserSections(Node):
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='config')
        self.add_output(name='sections')

    def __call__(self, inputs):
        config = self.get_input('config')
        return config.sections()

class SaveConfigParser(Node):
    """Save a ConfigParser object"""
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='filename', interface=IStr, value=None)
        self.add_input(name='config', interface=IStr, value=None)
        self.add_output(name='output')

    def __call__(self, inputs):
        #saveConfigParser is simply calling ConfigParser but with additional sanity checks.
        from vplants.plantik import tools
        tools.saveConfigParser(self.get_input('filename'), self.get_input('config'))

class ReadConfigParser(Node):
    """Read a configuration file using a ConfigParser module"""
    def __init__(self):
        Node.__init__(self)
        self.add_input(name='filename', interface=IStr, value=None)
        self.add_output(name='config')

    def __call__(self, inputs):
        from ConfigParser import ConfigParser
        config = ConfigParser()
        filename = self.get_input('filename')
        config.read(filename)
        return config
