#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""

.. module:: growth
    :synopsis: tools related to growth functions
.. currentmodule:: openalea.plantik.biotik.growth


.. topic:: summary

    Provide tools for growth functions.

    :Code: mature
    :Documentation: completed
    :Tests: 100% coverage
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.biotik.growth import *


.. seealso:: visualea dataflows in :mod:`vplants.plantik.dataflows.growth`

"""


__all__ = ['GrowthFunction']

class GrowthFunction(object):
    """Factory for growth functions

    Growth functions can be used by components such as leaves and internodes
    to modelise the growth of their surface and length, respectively.

    .. plot::
        :include-source:

        from openalea.plantik.biotik.growth import *
        from pylab import *

        gf = GrowthFunction(growth_function='logistic', maturation=12)
        age = range(0, int(gf.maturation)+5)
        plot(age, gf.growthValue(age))
        xlabel('Age in days')
        ylabel('Growth Function output')
        grid()

    """
    growth_function_methods = ['linear', 'sigmoid', 'logistic']

    def __init__(self, A=0., K=1., maturation=12., nu=1.,
                 growth_function='logistic', growth_rate=1):
        r"""**GrowthFunction constructor**

        :param float A: the lower asymptote (default is 0.); read-only attribute.
        :param float K: the upper asymptote (default is 1.); read-only attribute.
        :param float maturation: in days (default is 12); read-only attribute.
        :param str growth_function: the type of growth function. Either 'linear',
            'sigmoid' or 'logistic' (default is 'linear'); read-only attribute
        :param float growth_rate: (default is 1); read-only attribute.


        .. csv-table:: Notations
            :header: "name", "notation", "default value"
            :widths: 15,15,15

            inf bound      ,A                , 0
            sup bound      ,K                , 0
            growth rate    ,:math:`\lambda`  , 1
            maturation     ,:math:`T_m`      , 12
            nu             ,:math:`\nu`      , 1
            age            ,:math:`t_a`              , 0

        .. note:: with the default values of nu=1, growth_rate=1, a logistic
            function is equivalent to a sigmoid function.
        """
        valid_methods = GrowthFunction.growth_function_methods

        assert growth_function in valid_methods, \
            'Wrong value for growth function. Expected %s' % valid_methods

        self._A = float(A)
        self._K = float(K)
        self.nu = float(nu)
        self._growth_rate = float(growth_rate)
        self._growth_function = growth_function
        self._maturation = float(maturation)

    def __str__(self):
        from openalea.plantik.tools.misc import title
        res = title("Growth Function parameter")
        res += "parameter A                 = %s\n"  % self.A
        res += "parameter K                 = %s\n"  % self.K
        res += "parameter maturation        = %s\n"  % self.maturation
        res += "parameter nu                = %s\n"  % self.nu
        res += "parameter growth function   = %s\n"  % self.growth_function
        res += "parameter growth rate       = %s\n"  % self.growth_rate
        return res

    def _getMaturation(self):
        return self._maturation
    maturation = property(_getMaturation, None, None, "getter for maturation")

    def _getGrowthFunction(self):
        return self._growth_function
    growth_function = property(_getGrowthFunction, None, None,
                               "getter for growth function method")

    def _getGrowthRate(self):
        return self._growth_rate
    growth_rate = property(_getGrowthRate, None, None, "getter for growth rate")

    def _getInfBound(self):
        return self._A
    A = property(_getInfBound, None, None, "getter for inf bound")

    def _getSupBound(self):
        return self._K
    K = property(_getSupBound, None, None, "getter for sup bound")

    def growthValue(self, age):
        r"""returns value(s) of the growth function given its age


        :param (float,int,list) age: age at which the growth function should be calculated
        :return: returns a float if `age` is an integer or float and returns
            a numpy.array if `age` is a list.

        .. warning:: The function retunrs *K* if the age if larger than the
            maturation.

        The model used to compute the growth function can be either

            *  'linear'

              .. math::

                    A  + (K-A)\frac{t_a}{T_m}

            * 'sigmoid'

              .. math::

                  A  + \frac{K-A}{ 1 + \exp^{\lambda * (t_a + T_m/2.)}}

            * 'logistic'. See :func:`~openalea.plantik.bioitk.growth.generalisedLogisticFunction`.

        """
        import numpy

        if type(age) in [float, int]:
            if age > self.maturation:
                return self.K

        age = numpy.array(age)

        # set all values greater than maturation to maturation
        age = numpy.where(age>self.maturation, self.maturation, age)

        if self.growth_function == 'linear':
            return self.A  + (self.K-self.A) * age / self.maturation

        elif self.growth_function == 'sigmoid':
            return self.A  + (self.K-self.A) \
                /(1.+numpy.exp(self.growth_rate*(-age+self.maturation/2.)))

        else: # we should be in the logistic case.
            y = generalisedLogisticFunction(age, A=self.A, K=self.K,
                B=self.growth_rate, nu=self.nu, Q=1, M=self.maturation/2.)
            return y



def generalisedLogisticFunction(x, A=0, K=1, B=1, nu=1, Q=1, M=0 ):
    r"""The generalized logistic function

    Also known as Richards' curve is flexible sigmoid function for growth modelling,
    extending the logistic curve.

    .. math::

        f(x) = A + \frac{K-A}{\left( 1+Q \exp^{-B(x-M)} \right)^{1/\nu}}

    :param float A: lower asymptote
    :param float K: upper asymptote
    :param float B: growth rate
    :param float nu: :math:`\nu > 0`,  affects near which asymptote maximum
        growth occurs.
    :param float Q: depends on the value Y(0). For instance if A=0, K=1, Q should be 1.
    :param float M: the time of maximum growth if :math:`Q=\nu`


    A and K efects set the ymin and ymax values. B is the growth rate usually taken
    to be 1. Q, :math:`\nu` and M are for even more tuning. See examples here below
    to get a pictural explanation. M can be seen as a shift parameter if :math:`Q=\nu`

    .. seealso:: :meth:`~openalea.plantik.biotik.growth.GrowthFunction.growth_value`

    :Example of B effects:

    .. plot::
        :include-source:

        from openalea.plantik.biotik.growth import generalisedLogisticFunction as g
        import pylab
        maturation = 12
        x = pylab.linspace(0, maturation, 100)
        pylab.plot(x, g(x, A=0, K=1, B=0.5, M=6), label='B=0.5')
        pylab.hold(True)
        pylab.plot(x, g(x, A=0, K=1, B=1, M=6), label='B=1')
        pylab.plot(x, g(x, A=0, K=1, B=2, M=6), label='B=2')
        pylab.plot(x, g(x, A=0, K=1, B=3, M=6), label='B=3')
        pylab.legend(loc='best')
        pylab.grid(True)

    :M effects:

    .. plot::
        :include-source:

        from openalea.plantik.biotik.growth import generalisedLogisticFunction as g
        import pylab
        maturation = 12
        x = pylab.linspace(0, maturation, 100)
        pylab.plot(x, g(x, A=0, K=1, B=1, M=6), label='M=6')
        pylab.hold(True)
        pylab.plot(x, g(x, A=0, K=1, B=1, M=9), label='M=9')
        pylab.plot(x, g(x, A=0, K=1, B=1, M=3), label='M=3')
        pylab.legend(loc='best')
        pylab.grid(True)

    ::math:`\nu` effect:

    .. plot::
        :include-source:

        from openalea.plantik.biotik.growth import generalisedLogisticFunction as g
        import pylab
        maturation = 12
        x = pylab.linspace(0, maturation, 100)
        pylab.plot(x, g(x, A=0, K=1, B=1, M=6, nu=0.1, Q=1), label=r'$\nu=0.1$')
        pylab.hold(True)
        pylab.plot(x, g(x, A=0, K=1, B=1, M=6, nu=1, Q=1), label=r'$\nu=1$')
        pylab.plot(x, g(x, A=0, K=1, B=1, M=6, nu=10, Q=1), label=r'$\nu=10$')
        pylab.legend(loc='best')
        pylab.grid(True)
    """
    assert nu > 0, "nu must be positive"
    from numpy import exp
    return A + (K - A) / (1. + Q*exp(-B*(x-M)))**(1./nu)





