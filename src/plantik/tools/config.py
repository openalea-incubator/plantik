#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. topic:: config.py status

    functions to read configuration files.

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: fruit.py 8635 2010-04-14 08:48:47Z cokelaer $
"""



def save_config_file(filename=None, config=None):
    """todo
    
    
    >>> options = read_config_file('config.ini', sections=['general']) #doctest: +SKIP
    >>> options = save_config_file('config2.ini', config) #doctest: +SKIP
    
    """
    try:
        fp = open(filename,'w')
    except:
        raise IOError('filename could not be opened')
    import ConfigParser
    if isinstance(config, ConfigParser.RawConfigParser):
        print config
        config.write(fp)
        fp.close()
    
    
def read_config_file(filename, sections=None, default_values= {}):
    """Read sections in a standard config file and returns the options

    The format of the configuration file should be readable by the
    :class:`ConfigParser` standard python module.

    :param filename: a configuration filename to be read
    :param section: a list of strings corresponding to the section to be read
        (default is None, which means read all sections).

    :return: a dictionary containing all the section options. 

    >>> options = read_config_file('config.ini', sections=['general']) #doctest: +SKIP
    >>> options = read_config_file('config.ini') #doctest: +SKIP
    """
    import ConfigParser
    config = ConfigParser.RawConfigParser(default_values)
    res = config.read(filename)

    if sections == None:
        # we suppose that all sections should be read
        sections = config.sections()
    elif type(sections)!=list:
        raise TypeError("""Error, sections argument must be a list of strings 
            corresponding to the sections to be read""")
    options = {}
    # parse all sections and collect the options
    # Since everything is considered as a string, we cast the True/False into boolean
    # and numbers into float; all other cases are considered to be strings
    for section in sections:
        for option in config.options(section):
            if option in options.keys():
                raise ValueError("""
                    This option %s was found in section %s but was already read earlier. 
                    Check that parameters are not identical in your configuration file.""" 
                    % (option, section))
            data = config.get(section, option)
            if data in ['True', 'Yes', 'true', 'yes']:
                options[option] = True
            elif data in ['False', 'false', 'no', 'No']:
                options[option] = False
            else:
                try: # numbers
                    options[option] = config.getfloat(section, option)
                except: #string
                    options[option] = config.get(section, option)

    return options


class Test(object):
    def __init__(self, **kargs):
        for name, value in kargs.items():
            setattr(self, name, value)
            
class ReadConfigFile(object):
    def __init__(self, filename, sections=None, default_values={}):
        import ConfigParser
        self.config = ConfigParser.RawConfigParser(default_values)
        self.config.read(filename) 
    
        if sections == None:
            sections = self.config.sections()
        elif type(sections)!=list:
            raise TypeError("""Error, sections argument must be a list of strings 
                corresponding to the sections to be read""")
        
    
        self.read_sections(sections)
                
    def read_sections(self, sections):
        for section in sections:
            self.__dict__[section] = Test(**self.options2dict(section))
            
            
    def options2dict(self, section):
        options = {}
        for option in self.config.options(section):
            if option in options.keys():
                raise ValueError("""
                    This option %s was found in section %s but was already read earlier. 
                    Check that parameters are not identical in your configuration file.""" 
                    % (option, section))
            data = self.config.get(section, option)
            if data in ['True', 'Yes', 'true', 'yes']:
                options[option] = True
            elif data in ['False', 'false', 'no', 'No']:
                options[option] = False
            else:
                try: # numbers
                    options[option] = self.config.getfloat(section, option)
                except: #string
                    options[option] = self.config.get(section, option)
    
        return options
    