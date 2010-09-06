#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""plot module

.. module:: plot
    :synopsis: tools to manage pylab plots

.. topic:: summary

    tools to help managing plot (pylab)

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.plot import *

.. testsetup::

    from openalea.plantik.tools.plot import *

"""


def checkVariables(valid_variables, user_variables=None):
    """

    :param valid_variables:
    :param user_variables:
    """
    # if no options provided, returns valid
    if user_variables == None:
        return valid_variables
    else:
        # if user is astring,check its validity
        if type(user_variables)==str:
            if user_variables in valid_variables:
                return [user_variables]
        # else it must be a list ovalid strings
        elif type(user_variables)!=list:
            raise TypeError('variables must be a list of strings or a strings')

        else:
            for variable in user_variables:
                if variable not in valid_variables:
                      raise ValueError('variables must be %s', valid_variables)
            #if we reach this point, all user variable are valid
            return user_variables

