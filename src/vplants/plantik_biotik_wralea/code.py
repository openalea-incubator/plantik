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

from openalea.plantik.biotik import growth


class GrowthFunction(Node):
    """

    nu is used by the logistic methods only and should be stricly positive
    """

    def __init__(self):
        Node.__init__(self)
        self.add_input(name='time')
        self.add_input(name='method',       interface=IEnumStr(growth.GrowthFunction.growth_function_methods), value='sigmoid')
        self.add_input(name='inf bound',    interface=IFloat, value=0)
        self.add_input(name='sup bound',    interface=IFloat, value=1)
        self.add_input(name='growth rate',  interface=IFloat(-5,5,0.05), value=1)
        self.add_input(name='maturation',   interface=IFloat, value=12)
        self.add_input(name='nu',           interface=IFloat(0,100,0.1), value=1)

        self.add_output(name='data')

    def __call__(self, inputs):
        A = self.get_input('inf bound')
        K = self.get_input('sup bound')
        nu = self.get_input('nu')
        maturation = self.get_input('maturation')
        method = self.get_input('method')
        time = self.get_input('time')
        growth_rate = self.get_input('growth rate')

        gf = growth.GrowthFunction(A=A, K=K, nu=nu, maturation=maturation, growth_function=method, growth_rate=growth_rate)
        res = gf.growthValue(time)

        return (res, )


