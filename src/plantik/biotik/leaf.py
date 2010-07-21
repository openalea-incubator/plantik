#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""
.. topic:: leaf.py summary

    A module dedicated to the leaves

    :Code status: mature
    :Documentation status: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :References:

        1. Colin Smith, Costes Evelyne, On the Simulation of Apple Trees
           Using Statistical and Biomechanical Principles, INRIA
           technical report, 2007

    :Revision: $Id: leaf.py 9013 2010-05-27 09:06:13Z cokelaer $
"""
from openalea.plantik.biotik.context import Context
from openalea.plantik.biotik.component import ComponentInterface
from openalea.plantik.biotik.growth import GrowthFunction
from openalea.plantik.tools.plot import CheckVariables
from math import pi
from openalea.plantik.tools.misc import title



import numpy
from scipy import interpolate 
sigmoid = numpy.array([ 0.00247262,  0.00669285,  0.01798621,  0.04742587,  0.11920292,   0.26894142,  0.5       ,  0.73105858,  0.88079708,  0.95257413,  0.98201379,  0.99330715,  0.99752738])

days = numpy.array([0,1,2,3,4,5,6,7,8,9,10,11,12])

class LeafStocatree():
    """a base class interface for leaves

    A leaf is defined by an **age**, a **mass** and a **surface** (area). Moreover, 
    a **state** is chosen in ['scar', 'growing'].

    In addition, we must set the following attributes that are used to compute the
    mass :meth:`compute_mass` and area :meth:`compute_area`:

        * mass_per_area
        * maturation number of days after which the leaf does not grow anymore
        * max_area of the leaf

    Those attributes should be used to compute the area and mass of the leaf. By default
    these attributes are set to None so as to force the user to specifically provide
    their values.

    There is also a :meth:`initialisation` that may be used by derived classes to check
    that the attributes have been set correctly.

    By default, there is a setter/getter for the state.

    """
    state = ['scar', 'growing']
    def __init__(self):
        self.mass = 0.               # in g
        self.area = 0.              # in m^2
        self.age = 0.                # in days
        self.max_area = None        # in m**2
        self.mass_per_area = None   # g/m**2
        self.maturation = None      # in days
        self.func_leaf_area = None
        self._state = None

        self.pathogen = False

    def compute_mass(self):
        """Compute the mass of the leaf and returns its value (in kgrams)

        :return: area times mass_per_area

        .. warning:: compute_area must be called before.

        """
        self.mass = self.area * self.mass_per_area
        return self.mass

    def compute_area(self):
        """Compute the area of the leaf and returns its value (in m**2)"""
        self.area = self.max_area
        return self.area

    def initialisation(self):
        """check that mass_per_area, maturation and max_area have been set
        to numerical values"""
        for attr in ['mass_per_area', 'maturation', 'max_area']:
            if getattr(self, attr) is None:
                raise NotImplementedError("%s is None. Set a value." % attr)

    def set_state(self, state):
        """returns the state of the leaf"""
        if state in Leaf.state:
            self._state = state
        else:
            raise ValueError("state must be in %s , %s provided" % (Leaf.state,state))

    def get_state(self):
        """set the state of the leaf"""
        return self._state



class AppleLeaf(LeafStocatree):
    """A specialised leaf class for apple trees


    This class inherits methods and attributes from
    :class:`~openalea.stocatree.leaf.Leaf` and specialises
    the :meth:`compute_area` method.

    :Usage:

        leaf = AppleLeaf(maturation=12., petiole_radius=0.0006)
        area = leaf.compute_area(16)
        mass = leaf.compute_mass()


    """
    def __init__(self, state='growing', fall_probability=0.1, maturation=12, mass_per_area=0.220, max_area=0.0030, min_final_area=0.0020, petiole_radius=0.0006, preformed_leaves=8):
        Leaf.__init__(self)
        self.set_state(state)
        self.fall_probability = fall_probability         #per day
        self.maturation       = maturation         #day
        self.mass_per_area    = mass_per_area          #kg/m**2
        self.max_area         = max_area           #m^2
        self.min_final_area   = min_final_area           #m^2
        self.area_range       = self.max_area - self.min_final_area # unit:cm^2
        self.petiole_radius   = petiole_radius          #m
        self.maturity = False
        self.preformed_leaves = preformed_leaves
        self._inversed_preformed_leaves = 1./self.preformed_leaves    # tree.Tree().preformed_leaves =8
        self.initialisation()

    def compute_area(self, number):
        """computes the leaf area

        The growth dynamic of the leaves, as a normalised surface area relative
        to the area at maturity, has been fitted to an S-curve over twelve days,
        based on observation by Kelner [1]. The maximum surface of a neoformed
        leaf :math:`A_{\\textrm{max}}=30 \\textrm{cm}^2` [2], and the density is, as
        a mass per surface area unit is :math:`220 g/m^2` [3].

        The S-curve is hard-coded as a numpy array.

        It is assumed that the first :math:`N_p=8` metamers support preformed leaves,
        with a reduced maximum area according to their order in the growth unit
        following the equation

        .. math::

            \\frac{N_l}{N_p}(A_{\\textrm{max}}-A_{\\textrm{min}}) + A_{\\textrm{min}}

        func_leaf_area = ReadFunction('functions.fset', 'leaf_area')

        :param number: the leaf number (not used if greater than 8, the neoformed leaves)

        .. note:: age must be in days since maturity is in days.


        :references:

            1. J.J Kelner. Personnal communications on upubliashed measurements of leaves (2006)
            2. Massonnet C (2004) Variabilité architecturale et fonctionnelle du système
               aérien chez le pommier (MalusDomestica Borkh.): comparaison de
               quatre cultivars par une approche de modélisation structure-fonction. PhD
               Thesis, SupAgro Montpellier University, Montpellier.
            3. J.L. Regnard, pers. comm.

        The sigmoid function that is used to compute the relative area is as follows 

        .. plot:: pyplots/leaf.py
        """
        if  self.age >= self.maturation:
            relative_area = 1.
        else:
            relative_area = interpolate.interp1d(days, sigmoid)(self.age)

        if number >= self.preformed_leaves:
            self.area = self.max_area * relative_area
        else:
            self.area= relative_area * (self._inversed_preformed_leaves * self.area_range + self.min_final_area)
        return self.area




class Leaf(ComponentInterface):
    """Leaf class

    A Leaf instance creates an object that contain information such as

    - age, mass, area of the leaf
    - order, path and rank of the apex in the tree

    In addition, each apex has several methods that allows to compute the
    demand and resource at a given time. See :func:`demand_calculation` and
    :func:`resource_computation`.

    Finally there is a function :func:`state_transition` that contain a transition
    matrix related to the states mentioned here above.
    """
    petiole_radius = 0.0005
    def __init__(self, birthdate=None, 
                 rank=1, order=0, path=1, id=None, maturation=21, 
                 internode_vigor=1., maintenance=0., resource=0.,
                 growth_function='sigmoid', efficiency_method='constant'):
               
        self.context = Context(rank=rank, order=order, path=path)
        ComponentInterface.__init__(self, label='Leaf', 
                                    birthdate=birthdate, id=id)
        #use _ to access to this inherited attribute
        self._resource = resource
        self.current_resource = 0.
        self.growth_rate = 0.5
        self.maturity = maturation # in days
        self.radius_min = 0.0005
        # leaf min must correspond to internode length min so that leafmaxarea>-leafminarea
        self.area_min = 1. * 0.01 * 0.01   # 1 cm^2 changed into  m^2
        self.internode_vigor = internode_vigor
        self.area_max = 30 * 0.01 * 0.01 * internode_vigor   # 30 cm^2 changed into m^2
        self._radius = self.radius_min
        self._area = GrowthFunction(self.area_min,
                                   self.area_max,
                                   maturation=self.maturity,
                                   growth_rate=self.growth_rate,
                                   growth_function=growth_function)
        self.father_radius = 0
        self.maintenance = maintenance # cost to maintain the elt alive
   
        self.mass_per_area = 220. #g/m^2
        #self.size = self.leaf_min_area
        
        self.lg = 0.
        #data product
        self.variables = ['age', 'area', 'radius', 'resource']
        self.variable_labels = ['age', 'area', 'petiole radius', 'resource']
        for var in self.variables:
            self.__setattr__(var+'_v', [])
        self.save_data_product()
        self.efficiency_method = efficiency_method
        self._leaf_efficiency = 1.
        """self.time_v = [birthdate]
        self.size_v = [self.size]
        self.resource_v = [self.resource]
        """
        self.m1 = 15.
        self.m2 = 150

    def update(self, dt):
        super(Leaf, self).update(dt)
        self.save_data_product()

    def __str__(self):
        res = self.component_summary()
        res += self.context.__str__()
        res += title('other attributes')
        res += ' - demand=%s' % self._demand
        res += ' - resource=%s' % self.resource
        res += ' - allocated=%s' % self._allocated
        res += ' - maintenance=%s' % self._maintenance
        
        return res

    def save_data_product(self):
        """update the vectors that stored data over time"""
        self.age_v.append(self.age.days)
        self.area_v.append(self.area)
        self.radius_v.append(self.radius)
        self.resource_v.append(self.current_resource)
        
    """
        def demand_calculation(self):
        if self.age<leaf.maturation:
            demand_per_area = 1./leaf.max_area
            self.demand = self.area * demand_per_area * leaf_coeff # maximum is therefore less than 1
        else:
            self.demand = 0
        return self.demand

   
    """
    def demand_calculation(self, **kargs):
        self.demand =0.
        return self.demand

    def resource_calculation(self):
        self.current_resource = self.resource * self.area / self.area_max * self.leaf_efficiency()
        return self.current_resource 
        #return self.mass * self.resource * dt

    def leaf_efficiency(self):
        if self.efficiency_method == 'constant':
            return 1.
        elif self.efficiency_method == 'sigmoid':
            from math import exp
            return 1./(1+exp(0.5*(self.m1-self.age.days))) / (1.+exp(0.3*(self.age.days-self.m2)))
    
    def __setstate__(self, data):
        self.__dict__.update(data)

    def _compute_maintenance(self):
        pass
        
    def _getMass(self):
        return self.mass_per_area * self.area
    mass = property(_getMass, None, None, doc="returns the leaf mass in kgs")
    
    def _getRadius(self):
        return self._radius
    def _setRadius(self, radius):
        self._radius = radius
    radius = property(_getRadius, _setRadius, None, doc="radius")

    def _getArea(self):
        return self._area.getValue(self.age.days)
    area = property(_getArea, None, None, doc="area")

    
    
    def plot(self, variables=None, tag='', clf=True, show=True, symbol='-o'):
        import pylab
        _variables = CheckVariables(self.variables, variables)
        
        if clf is True:
            pylab.figure()
            pylab.clf()
        for variable, label in zip(_variables, self.variable_labels):
            if variable != 'age':
                pylab.plot(self.age_v, getattr(self, '%s_v' % variable), symbol, label=label)
                pylab.xlabel('time since birthdate')
                pylab.ylabel('%s of this %s' % (variable, self.label))
                pylab.grid(True)
        if show==True:
            pylab.show()
        pylab.legend()
        pylab.savefig('test_%s_%s_%s.png' % (self.label, tag, variable))
            
    
