#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""collection module

.. module:: collection
    :synopsis:

.. topic:: summary

    :Code: mature
    :Documentation: mature
    :Tests: 100%
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage: >>> from openalea.plantik.biotik.collection import *

.. testsetup:: *

    from openalea.plantik.biotik.collection import *
"""
import copy



class SingleVariable(object):
    """A variable factory containing evolution of a variable over time.


    
    with plotting viewpoints. 
    This class allows to declare a variable so that it can be easily manipulated
    during or after a simulation is over. It also provide viewpoints (plot and
    histogram)

    Parameters such as the :attr:`name`, :attr:`unit` and :attr:`values` can
    be provided.

    :Example:

        >>> par1 = SingleVariable(name='age', unit='mV')
        >>> par1.name == 'age'
        True
        >>> par1.append(1)
        >>> par1.values == [1]
        True

    .. warning:: implementation is not perfect...see code comments related to
        attributes.

        Be aware that the following code should work as expected.

        >>> par1 = SingleVariable(name='age', unit='mV')
        >>> par1.append(1)
        >>> par1 = SingleVariable(name='age', unit='mV')
        >>> par1.values
        []
    """
    def __init__(self, name, values=[], unit='not specified', dt=1):
        """**Constructor**

        :param str name: the variable name (compulsory)
        :param list values: a list of values (default is [])
        :param str unit: a  unit label that may be used in the plots
        :param float dt: a time step (for plotting)

        :Attributes:
            * :attr:`name` read-only
            * :attr:`unit` read-only
            * :attr:`values` read/write use the :meth:`append` method to write
            * :attr:`dt` read-only
        """
        assert type(name) == str, 'name must be a string'
        assert type(unit) == str, 'unit must be a string'

        self._name = name
        self._unit = unit
        # !! Issues with deletion.
        # var1 = SingleVariable()
        # var1.append(1)
        # var1 = SingleVarible()
        # var1 still contains the [1] value!!
        # but using this deepcopy, it works...
        self._values = copy.deepcopy(values)
        
        
        self._dt = dt

    def __str__(self):
        return repr(self.values)

    def append(self, value):
        """append a value to :attr:`values`

        :param int,float value: a valid value to append to :attr:`values`

        """
        # !!! use self.values not self._values otherwise memory issue may arise
        #assert type(value) in [int, float], "values to be appended must be int
        # or float %s provided %s" % (value, type(value))
        self.values.append(value)

    #def __delete__(self):
    #    print 'deletin'

    def _del_values(self):
        self._values = []
        del self._values
    def _get_values(self):
        return self._values
    values = property(fget=_get_values, fset=None, fdel=_del_values, 
                      doc='getter to values attribute. Set add values, use :meth:`append`')

    def _get_name(self):
        return self._name
    name = property(fget=_get_name, fset=None, doc='getter to name attribute')

    def _get_unit(self):
        #self = args[0]
        return self._unit
    unit = property(fget=_get_unit, fset=None, doc='getter to unit attribute')

    def _set_dt(self, dt):
        self._dt = dt
    def _get_dt(self):
        return self._dt
    dt = property(fget=_get_dt, fset=_set_dt, 
                  doc='getter/setter to dt attribute')

    def plot(self, x=None, show=True, grid=True, id=1, **args):
        """Plot the values of the variable against time or a given x array.


        :param list x: if no x data is provided, then an array based on 
            :attr:`dt` is computed otherwise, plot(x, self.values) is called.
        :param bool grid: put a grid
        :param bool show: show the final plot
        :param `**args`: all standard pylab.plot parameters may be provided.

        .. plot::
            :include-source:
            :width: 30%

            from openalea.plantik.biotik.collection import SingleVariable
            from numpy.random import randn
            v = SingleVariable(name="temperature", unit="kelvin", dt=0.1)
            _dummy = [v.append(randn()) for x in xrange(1000)]            
            v.plot()
        """
        import pylab
        pylab.figure(id)
        pylab.clf()
        if x == None:
            x = pylab.linspace(0, len(self.values)-1, len(self.values)) * self.dt
            line2d = pylab.plot(x, self.values, label=self.name, **args)
        else:
            line2d = pylab.plot(x, self.values, label=self.name, **args)

        pylab.xlabel('Time (in days)')
        pylab.ylabel('%s (%s)' % (self.name.replace('_','\_').title(), self.unit))
        if show: 
            pylab.show()
        pylab.grid(grid)

        return line2d

    def hist(self, grid=True, show=True, id=1, **args):
        """Plot histogram of the variable values

        :param bool grid: put a grid
        :param bool show: show the final plot

        .. plot::
            :include-source:
            :width: 30%

            from openalea.plantik.biotik.collection import SingleVariable
            from pylab import randn
            v = SingleVariable(name="temperature", unit="kelvin", dt=0.1)
            _dummy = [v.append(randn()) for x in xrange(1000)]
            v.hist()

        """

        import pylab
        pylab.figure(id)
        pylab.clf()
        pylab.hist(self.values, **args)
        pylab.xlabel('%s (%s)' % (self.name.replace('_','\_').title(), self.unit))
        if show: 
            pylab.show()
        pylab.grid(grid)



class CollectionVariables(dict):
    """A collection of :class:`~openalea.plantik.biotik.collection.SingleVariable` objects.

    This class allows to collect several 
    :class:`~openalea.plantik.biotik.collection.SingleVariable` into a single 
    object and to append and access relevant data more easily.

    :Example:

    >>> col = CollectionVariables()
    >>> var1 = SingleVariable(name='age', unit='days')
    >>> var2 = SingleVariable(name='temperature', unit='celsius')
    >>> col.add(var1)
    >>> col.add(var2)
    >>> col.age.values
    []
    >>> assert sorted(col.keys()) == ['age', 'temperature']
    >>> col.append([1,100])
    >>> col.age.values
    [1]
    >>> col.temperature.values
    [100]
    >>> col.temperature.hist()

    """
    def add(self, par):
        """add a SingleVariable object to the collection dictionary.

        :param SingleVariable par: the object to be added

        this method append the :attr:`names` to the dictionary.
        If the name has already been set, an error is raised.

        .. todo:: this is a deepcopy that should be removed. Yet, tests must work!
        """
        # fill the dictionary. copy required or cleanup SingleVariable in such a way
        # that test_collection and make doctest do not fail.
        import copy
        if par.name in self.__dict__.keys():
            raise ValueError("name '%s' already exists !" % par.name)
        else:
            self.__dict__[par.name] = copy.deepcopy(par)
        # this causes some reference issues during deletion time
        #setattr(CollectionVariables, par.name, property(fget=lambda x: self.__dict__[par.name], fset=None))
        #self._names.append(par.name)

    def keys(self):
        """Alias to __dict__.keys() to get list of singleVariables names"""
        return self.__dict__.keys()

    def append(self, values):
        """

        :param list values: a list of values corresponding to the different
            variables. The order must be the alphabetical order to the variables
            names.
            
            
        >>> col = CollectionVariables()
        >>> col.add(SingleVariable(name='radius', unit='days', values=[1]))
        >>> col.add(SingleVariable(name='age', unit='days', values=[0]))
        >>> assert sorted(col.keys()) == ['age', 'radius']
        >>> col.radius.values
        [1]
        >>> col.age.values
        [0]
        >>> col.append([1,2])
        >>> col.radius.values
        [1, 2]
        >>> col.age.values
        [0, 1]


        """
        if len(values) != len(self.keys()):
            raise SyntaxError("""
                If you want to use the append method of a Collection, the input parameters
                must be of the same length as the collection itself and the order should be
                the order of the names attributes. See the documentation of the
                CollectionVariables.append method for more details""")
        for name, value in zip(sorted(self.keys()), values):
            self.__dict__[name].append(value)


    def __str__(self):
        import openalea.plantik.tools.misc as misc
        res = misc.title("SingleVariables found in this collection are:")
        for name in self.keys():
            res += " * "+name + ": values length is " + \
                str(len(getattr(self, name).values)) + "\n"
        return res

    def _valid_names(self, names=None):
        """check that input names are part of the singleVariables

        First, this function transform names into a list it is not already a 
        list. If None is provided, then, we use the dictionary keys as a list.

        Second, this function checks that the input parameter `names` is correct.
        Indeed, if the contents of `names` is not None then it is checked with
        respect to the variables.keys().

        :return: list of names depending on the input parameter `names`

        >>> from openalea.plantik.biotik.collection import *
        >>> col = CollectionVariables()
        >>> col.add(SingleVariable(name='age', unit='days', values=[1]))
        >>> col._valid_names('age')
        ['age']
        >>> col._valid_names(['age'])
        ['age']
        """
        if names == None:
            return self.keys()
        else:
            assert type(names) in [str, list, None]
            if type(names) == str:
                names = [names]
            for name in names:
                assert name in self.keys(), 'invalid name provided %s ' % name
            return names

    def plot(self, variables=None, show=True, grid=True, **args):
        """calls singleVariable plot function for all variables

        .. plot::
            :include-source:
            :width: 30%

            from openalea.plantik.biotik.collection import *
            from pylab import randn
            col = CollectionVariables()
            col.add(SingleVariable(name='radius', unit='days', values=[1]))
            for x in xrange(10): col.radius.append(float(randn(1)))
            col.plot(show=True, grid=True)

        """
        names = self._valid_names(variables)
        for i, name in enumerate(names):
            self.__dict__[name].plot(show=show, grid=grid, id=i+1, **args)

    def hist(self, variables=None, show=True, grid=True, **kargs):
        """calls singleVariable hist function for all variables

        :Usage:

        ::

            hist(show=True)
            hist(grid=False, color='red')
            hist(variables='age', grid=False, color='red')

        .. plot::
            :include-source:
            :width: 30%

            from openalea.plantik.biotik.collection import *
            from pylab import randn
            col = CollectionVariables()
            col.add(SingleVariable(name='radius', unit='days', values=[1]))
            col.add(SingleVariable(name='length', unit='days', values=[1]))
            for x in xrange(10): col.radius.append(float(randn(1)))
            for x in xrange(1000): col.length.append(float(randn(1)))
            col.hist(show=True, grid=True, color='red')

        """
        names = self._valid_names(variables)
        for i, name in enumerate(names):
            self.__dict__[name].hist(show=show, grid=grid, id=i+1, **kargs)

