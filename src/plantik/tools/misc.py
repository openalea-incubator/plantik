#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""misc module

.. module:: misc
    :synopsis: misc tools

.. topic:: summary

    misc tools

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.misc import *

.. testsetup::

    from openalea.plantik.tools.misc import *

"""




def title(name, underline="="):
    """Return title underline with a specific character

    :param str name: a string to underline

    >>> title("test")
    'test\\n====\\n'

    """
    res = name + '\n'
    res += underline * len(name) + '\n'
    return res
