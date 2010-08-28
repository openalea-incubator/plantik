#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Config module

.. module:: config
    :synopsis: functionalities to read/write config file easily

.. topic:: config.py status

    Functionalities to read/write config file easily. This module is base upon
    :mod:`ConfigParser`.

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id: fruit.py 8635 2010-04-14 08:48:47Z cokelaer $
    :Usage: >>> from openalea.plantik.tools.config import *

.. testsetup::
    
    from openalea.plantik.tools.config import *
"""



def saveConfigFile(filename=None, config=None):
    """Save an existing config object into a file.


    >>> config = ReadConfigFile('config.ini') #doctest: +SKIP
    >>> saveConfigFile('config2.ini', config) #doctest: +SKIP

    """
    try:
        fp = open(filename,'w')
    except:
        raise IOError('filename could not be opened')
    import ConfigParser
    if isinstance(config, ConfigParser.RawConfigParser):
        config.write(fp)
        fp.close()


def _read_config_file(filename, sections=None, default_values= {}):
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


class Section(object):
    """utility to set attributes in a dictionary

    Used by :class:`~openalea.plantik.tools.config.ReadConfigFile`
    """
    def __init__(self, **kargs):
        for name, value in kargs.items():
            setattr(self, name, value)

class ReadConfigFile(object):
    """Read sections in a standard config file

    The format of the configuration file should be readable by the
    :mod:`ConfigParser` standard python module.

    This class ease the manipulation of such structure. For instance, consider
    the following configutation file::

        [general]
        step = 1
        [misc]
        verbose = True 

    then, you can read and manipulate it as follows::

        >>> options = ReadConfigFile('config.ini') #doctest: +SKIP
        >>> options = ReadConfigFile('config.ini', sections=['general']) #doctest: +SKIP
        >>> options.general.step
        1
        >>> options.misc.verbose
        True

    .. note:: The configuration file is not a python module, so everything is a string. 
        Private methods (not for users called :meth:`_read_sections` and :meth:`_options2dict`
        convert the string into appropriate python objects and transfor each subsections
        into an independant dictionary.

    """
    def __init__(self, filename, sections=None, default_values={}):
        """**constructor**

        :param string filename: a valid configuration filename (readable by :class:`ConfigParser`)
        :param sections: a list of strings corresponding to the section to be read (optional)
            (default is None, which means read all sections).

        :attributes: 
            * :attr:`config`: the original ConfigParser config file.

        :return: a dictionary containing all the section options.

        .. todo:: explain default_values parameter.
        """

        import ConfigParser
        self.config = ConfigParser.RawConfigParser(default_values)
        res = self.config.read(filename)
        if res == []:
            raise IOError("Error: File %s not found" % filename)
        if sections == None:
            sections = self.config.sections()
        elif type(sections)!=list:
            raise TypeError("""Error, sections argument must be a list of strings
                corresponding to the sections to be read""")


        self.__init_done = False
        self._read_sections(sections)

    def _read_sections(self, sections):
        """add each section as an attribute to the class 

        This is to ease the manipulation of the config file parameters and sections

        For instance, let us suppose a configuration file with a section called `general`
        where the option `step` has the value 10. Then, without this class and 
        method you would write::

            parser = ConfigParser.RawConfigParser()
            config = parser.read(filename)
            section = 'general'
            options = config.options(section)
            value = options['step']
            assert value == 10

        Whereas now, one would simply write::

            config = ReadConfigFile(filename)
            assert config.general.step == 10

        .. note:: this method is called by the constructor only once, using it would not change anything.
        """
        if self.__init_done == False:
            for section in sections:
                self.__dict__[section] = Section(**self._options2dict(section))
            self.__init_done = True
        else:
            import warnings
            warnings.warn('singleton already called. Not effect.')

    def _options2dict(self, section):
        """Parser for the configuration file. This is used to validate the ini file.
        
        Convert the values found in the configuration file (string) into appropriate 
        standard object.

        For now, boolean, string, float and int are parsed.

        If an option is True/Yes/true/yes then it is transformed into True.
        If an option is False/No/no/false then it is transformed into False.
        Otherwise, we use the config.getfloat to check for valid numbers, and 
        finally all the remaining cases are returned as strings.

        This function checks that there are no redundancy between names in a 
        given section.
        """
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

