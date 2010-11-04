#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""

.. module:: config
    :synopsis: functionalities to read/write config file easily

.. topic:: openalea.plantik.tools.config module summary

    Functionalities to read/write config file easily. This module is based upon
    :mod:`ConfigParser`.

    :Code: mature
    :Documentation: completed
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.tools.config import *

.. testsetup::

    from openalea.plantik.tools.config import *


.. seealso:: visualea dataflows in :mod:`openalea.plantik.dataflows.config`
"""

__all__ = ["saveConfigParser", "ConfigParams", "createConfigParserExample"]


def createConfigParserExample():
    """Create a simple example of ConfigParser instance to play with

    >>> from openalea.plantik.tools.config import createConfigParserExample
    >>> c = createConfigParserExample()
    >>> assert 'Section1' in c.sections()
    >>> assert 'Section2' in c.sections()

    This example builds up a ConfigParser instance from scratch.

    This is equivalent to having the following input file::

        [Section1]
        int = 15
        bool = true
        float = 3.14159
        baz = fun
        bar = python
        foo = %(bar)s is %(baz)s!

        [Section2]
        test = 1
        booltest = False
        booltest2 = No

    and using the read method of ConfigParser as follows::

        >>> from ConfigParser import ConfigParser
        >>> config = ConfigParser()
        >>> config.read(filename)
        >>> return config

    """
    from ConfigParser import ConfigParser
    config = ConfigParser()
    config.add_section('Section1')
    config.set('Section1', 'int', '15')
    config.set('Section1', 'bool', 'true')
    config.set('Section1', 'float', '3.1415')
    config.set('Section1', 'baz', 'fun')
    config.set('Section1', 'bar', 'Python')
    config.set('Section1', 'foo', '%(bar)s is %(baz)s!')
    config.add_section('Section2')
    config.set('Section2', 'test', '1')
    config.set('Section2', 'booltest', 'False')
    config.set('Section2', 'booltest2', 'No')
    return config


def saveConfigParser(filename=None, config=None):
    """Save an existing ConfigParser instance into a file.

    :param str filename: a valid filename
    :param ConfigParser config: the config parser instance to save

    >>> config = ConfigParams('config.ini') #doctest: +SKIP
    >>> saveConfigParser('config2.ini', config.config) #doctest: +SKIP

    .. seealso:: *SaveConfigFile* VisuAlea node :mod:`openalea.plantik.dataflows.config`

    """
    try:
        fp = open(filename,'w')
    except:
        raise IOError('filename could not be opened')
    import ConfigParser
    if isinstance(config, ConfigParser.RawConfigParser):
        config.write(fp)
        fp.close()


class _set_section(object):
    """utility to set attributes in a dictionary

    Used by :class:`~openalea.plantik.tools.config.ConfigParams`
    """
    def __init__(self, **kargs):
        for name, value in kargs.items():
            setattr(self, name, value)



class config_base(object):
    """A base class that provides common methods to manipulate
    :class:`ConfigParser` instances.


    .. note:: Used by :class:`ConfigParams` and :class:`ConfigParams`

    """
    def __init__(self):
        self.config = None

    def _config2dict(self, section):
        """utility that extract options of a ConfigParser section into a dictionary

        :param ConfigParser config: a ConfigParser instance
        :param str section: the section to extract

        :returns: a dictionary where key/value contains all the options/values of the section required

        Let us build up  a standard config file::

            >>> import ConfigParser
            >>> config = ConfigParser.ConfigParser()
            >>> c.add_section('general')
            >>> c.set('general', 'step', str(1))
            >>> c.set('general', 'verbose', 'True')

        To access to the step options, you would write::

            >>> c.get('general', 'step')

        this function returns a dictionary that may be manipulated as follows::

            >>> d_dict.general.step

        """
        options = {}
        for option in self.config.options(section):
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


    def save(self, filename):
        """Save the original ConfigParser instance in  a file.

        This function is an alias to :func:`saveConfigParser`

        :param str filename: a valid filename
        """
        saveConfigParser(filename, self.config)


class ConfigParams(config_base):
    """Convert a **ConfigParser** instance into **ConfigParams** object.

    A :class:`~openalea.plantik.tools.config.ConfigParams` object ease the access to sections and options from a
    :class:`~ConfigParser.ConfigParser` instance. This class keeps track of the original
    ConfigParser instance (in the attribute *config*).

    In the following example, we first create a ConfigParser instance using
    the :func:`~openalea.plantik.tools.config.createConfigParserExample`, which
    is converted using :class:`ConfigParams`::

        >>> from openalea.plantik.tools.config import createConfigParserExample
        >>> config = createConfigParserExample()
        >>> config_params = ConfigParams(config)

    Then, we can easily access any of the options as follows::

        >>> assert config_params.Section1.int == 15

    .. seealso:: *ConfigParams* VisuAlea node :mod:`openalea.plantik.dataflows.config`

    """
    def __init__(self, config_or_filename):
        """**Constructor**

        :param (ConfigParser,str) config: a ConfigParser instance or a filename
        """
        from ConfigParser import ConfigParser
        config_base.__init__(self)

        if type(config_or_filename) == str:
            config = ConfigParser()
            config.read(config_or_filename)
            self.config = config
        else:
            self.config = config_or_filename

        try:
            sections = self.config.sections()
            for section in sections:
                self.__dict__[section] = _set_section(**self._config2dict(section))
        except:
            raise SyntaxError("Could not convert sections from the ConfigParser instance !!")



