#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Branch module

.. module branch
    :synopsis: MTG utilities and data extraction

.. topic:: summary

    Utilities to manage MTG and extract relevant information

    :Code: mature
    :Documentation: mature
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.mtgtools import *

.. testsetup::

    from openalea.plantik.tools.mtgtools import *

"""
from openalea.mtg import *
from openalea.mtg.aml import *

import tempfile


class MTGTools(object):
    """a specialised MTG class

    This class allows to manipulate an MTG (save/load as pickled object), extract and plot 
    relevant information and select ids using SQL request.

    First you need to create an instance that accepts only one parameter that is a valid mtg.

    >>> mtgtools = MTGTools()

    Later, you can set the :attr:`mtg` attribute either directly or loading a a pickled MTG
    as follows:

    >>> from openalea.plantik import get_shared_data
    >>> mtgtools = MTGTools()
    >>> mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))


    Then you can access to specialised methods:

    >>> res = mtgtools.getVolumeInternodes()
    >>> res = mtgtools.getVolumeInternodes(order=1)

    or standard MTG usage using again the :attr:`mtg` attribute. 

    >>> sorted(mtgtools.mtg.properties().keys())
    ['Apex', 'Branch', 'GrowthUnit', 'Internode', 'Leaf', 'Plant', 'edge_type', 'geometry', 'label']

    .. note:: When you set the :attr:`mtg` attribute, the :meth:`update` method is called. What this function does is to update
        the :attr:`ids` to store the indices of all leaves, internodes, growth units, apices and branches. This is quite handy to
        manipulate MTG. Similarly, the :meth:`update` method is also called when using :meth:`load_pickle`.

    Another great feature of this class is to allows users to create a database out of MTG, asusming that is fulfill
    some restrictions. See :meth:`createDB`, :meth:`select_id` and  :meth:`requestDB` methods for more details.

    """
    def __init__(self, mtg=None ):
        """**Constructor**

        .. warning:: right now, this module expect the MTG to have the following labels: L, A, I, U, B


        .. todo:: search for the label automatically.

        :param MTG mtg: a valid mtg


        :attributes:

            * :attr:`ids`: dictionary containing the indices for each label



        """
        self._mtg = mtg
        self.ids = {'L':None,'I':None,'U':None,'B':None, 'A':None}
        self.scales = {'A':4,'I':4,'L':4, 'P':1, 'B':2, 'U':3}
        self.modules = ['A','I','L','U','B']
        self.parameters = { 'A': ['Apex'], 
                            'I': ['Internode'],  
                            'L': ['Leaf'],
                            'P':['Plant'], 
                            'U':['GrowthUnit'], 
                            'B':['Branch']}

        self.DB = None

    def save_pickle(self, filename):
        import pickle
        if self.mtg != None:
            pickle.dump(self.mtg, open(filename, "w"))

    def load_pickle(self, filename):
        import pickle
        try:
            mtg = pickle.load(open(filename, "r"))
            self.mtg = mtg #this setter also calls the update() method!
        except:
            pass

    def update(self):
        """update the mtg and relevant information

        :param MTG mtg: then new mtg

        update the ids of the leaves, apices, branches, growthunits and internodes.

        """
        import inspect
        if inspect.stack()[1][3] != '_setMTG':
            import warnings
            warnings.warn("no need to call update() function. Use the setter for mtg attribute instead that automatically calls update()")
        for module in ['A','I','L']:
            self.ids[module] = [id for id in self.mtg.vertices(scale=4) if self.mtg.class_name(id)==module]
        self.ids['U'] = [id for id in self.mtg.vertices(scale=3) if self.mtg.class_name(id)=='U']
        self.ids['B'] = [id for id in self.mtg.vertices(scale=2) if self.mtg.class_name(id)=='B']

        #check correctness of number of elements.
        length = 0
        for module in self.modules:
            length += len(self.ids[module])
        # Plant=1 + mtgroot=1
        #assert len(self.mtg) == length+2


    def _setMTG(self, mtg):
        self._mtg = mtg
        self.update()
    def _getMTG(self):
        return self._mtg
    mtg = property(fget=_getMTG, fset=_setMTG, doc="getter/setter for mtg attribute")


    def getBranchesLength(self, order=None):
        """Returns branches lengths at a given order

        :param int order: select only branches at this order

        timeit gives 45 us

        ::
        
            getBranchesLength(order=1)
        """
        return self.getLength(order=order, type='B')

    def getBranchesRank(self, order=None):
        """returns branches rank at a given order

        :param int order: select only branches at this order
        """
        return self.getRank(order=order, type='B')

    def getLength(self, order=None, type=None):
        """

        getLength(type='U', order=0)
        getLength(type='B', order=1)
        """
        module = self.parameters[type][0]
        if order != None:
            res = [self.mtg.property(module)[id].length for id in self.ids[type] 
                if self.mtg.order(id)==order]
        else:
            res = [self.mtg.property(module)[id].length for id in self.ids[type]]
        return res

    def getRank(self, type=None, order=None):
        module = self.parameters[type][0]
        from openalea.mtg.algo import rank 
        if order != None:
            res = [rank(self.mtg, id) for id in self.ids[type] 
                if self.mtg.order(id)==order]
        else:
            res = [rank(self.mtg, id) for id in self.ids[type]]
        return res

    def connectDB(self):
        """Connect to the database

        It also associate a label to each column given by a request using 
        the row_factorDB function. See sqlite3 documentation.

        """
        import sqlite3
        conn = sqlite3.connect(self.dbfile[1])
        self.DB = conn.cursor()
        self.DB.row_factory = self._rowFactoryDB

    def _rowFactoryDB(self, cursor, row):
        """associate a description/key to the tuple returned by execute method of sqlite

        This is used by connectDB to associat c.row_factory with a descriptor. 
        See sqlite3 documentation for more details.
        """
        d = {}
        for idx, col in enumerate(cursor.description):
            d[col[0]] = row[idx]
        return d

    def requestDB(self, request, column=None):
        """Execute the request on the DB

        :param str request: a valid SQL request
        :param str column: a valid column name (e.g., "id")
        :returns: a sqlite cursor (iterator) or a list if column is a valid label

        >>> from openalea.plantik import *
        >>> mtgtools = MTGTools()
        >>> mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
        >>> mtgtools.createDB()
        >>> mtgtools.connectDB()
        >>> rows = mtgtools.requestDB("select id from mtg where ord==1 and label=='I'", column="id")
        >>> assert type(rows) == list

        """
        res = self.DB.execute(request)
        if column is not None:
            try:
                res = [x[column] for x in res]
            except:
                IndexError("column value seems wrong")
            return res
        else:
            return res

    def closeDB(self):
        """close the DB

        .. todo:: icheck this is true...
        """
        self.DB.close()
        #delete db ? TODO

    def createDB(self):
        """Create a database out of a MTG obiject.

        Stores the label, rank, id, order and scale into a database that can
        be accessed later on using the :meth:`requestDB` and :meth:`select_id` methods.
        The requests are standard SQL commands and the table to look at is called (you guess
        it?):  **mtg**

        .. note:: the database is stored in a temporary file `dbMTG`. For instance
            in /tmp directory under linux systems, which name is stored in :attr:`_dbfile`
            do not use it though!.
        ::
    
            mtgtools = MTGTools
            mtgtoos.mtg = myfavoriteMTG
            mtgtools.createDB()
            mtgtools.connectDB()
            mtgtools.requestDB("select * from mtg")
        """
        import sqlite3
        import tempfile
        from openalea.mtg.algo import rank  as getrank
        self.dbfile = tempfile.mkstemp('dbMTG')
        conn = sqlite3.connect(self.dbfile[1])
        c = conn.cursor()
        c.execute("create table mtg (scale int, ord int, label text, rank int, id int)")
        vertices = self.mtg.vertices()
        for id in vertices:
            scale = self.mtg.scale(id)
            label = self.mtg.label(id)
            order = self.mtg.order(id)
            rank = getrank(self.mtg, id)
            c.execute("insert into mtg values (?,?,?,?,?)", (scale, order, label, rank, id))
        conn.commit()
        c.close()


    def select_id(self, select="id", order=None, label=None, scale=None, rank=None, id=None):
        request = "select %s from mtg " % select
        where = False
        if order !=None:
            if where == False: request += " where ";  where = True
            request += "ord == %s " % order
        if label !=None:
            if where == False: 
                request += " where ";  
                where = True
            else:
                request += " and "
            request += "label == '%s' " % label
        if scale !=None:
            if where == False: 
                request += " where ";  
                where = True
            else:
                request += " and "
            request += "scale == '%s' " % scale
        if rank !=None:
            if where == False: 
                request += " where ";  
                where = True
            else:
                request += " and "
            request += "rank == '%s' " % rank
        if id !=None:
            if where == False: 
                request += " where ";  
                where = True
            else:
                request += " and "
            request += "id == '%s' " % id
        self.createDB()
        self.connectDB()
        try:
            res = self.requestDB(request, column=select)
        except:
            print "request " + request  + " failed."
        self.closeDB()
        return res


    def getVolumeInternodes(self, order=None):
        """return total volume at a given order

        :param int order: if no order is provided, returns total volume

        >>> from openalea.plantik.tools.mtgtools import MTGTools
        >>> from openalea.plantik import get_shared_data
        >>> mtgtools = MTGTools()
        >>> mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
        >>> res = mtgtools.getVolumeInternodes()
        >>> res = mtgtools.getVolumeInternodes(order=1)

        """
        from openalea.plantik import Internode
        ids = self.select_id(order=order, label="I")
        return sum([self.mtg.property('Internode')[id].volume for id in ids ])/ Internode.volume_standard


    def getAreaLeaves(self, order=None):
        """return total are at a given order

        :param int order: if no order is provided, returns total volume

        >>> res = mtgtools.getAreaLeaves()
        >>> res = mtgtools.getAreaLeaves(order=1)
        """
        ids = self.select_id(order=order, label="L")
        return sum([self.mtg.property('Leaf')[id].area for id in ids ])


    def hist_apex_order(self, show=False):
        """plot histogram of the order (using apices order)

        .. plot::

            from openalea.plantik import *
            mtgtools = MTGTools()
            mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
            mtgtools.hist_apex_order() 

        """
        orders = self.select_id(select="ord", label='A')
        import pylab
        pylab.figure()
        pylab.clf()
        pylab.hist(orders, range(0,max(orders)+1))
        if show: pylab.show()


def branch_rank_on_trunk(g):
    return [g.property('Branch')[id].context.rank for id in g.components(1) if g.class_name(id) == 'B']


def convert2LMS(length):
    """ values fixed Costes et al 2003 or equivalent"""
    if length<0.05:
        return 1
    elif length< 0.2:
        return 2
    else:
        return 3  

def create_sequences(g):
    """
    0: nothing
    1: Short
    2: Medium
    3: Long
    """
    from openalea.sequence_analysis import Sequences
    Activate(g)
    apices_ids = [id for id in Components(2, 4) if Class(id)=='A']
    branch_ids = Sons(2)
    branch_length = [g.property('Branch')[id].length for id in Sons(2)]
    branch_rank = [g.property('Branch')[id].context.rank for id in Sons(2)]
    apices_rank = [g.property('Apex')[id].context.rank for id in g.components_at_scale(2, 4) if Class(id)=='A']
    values = []
    for rank in apices_rank:
        values.append((rank, 0))
    for rank, length in zip(branch_rank, branch_length):
        values.append((rank, convert2LMS(length)))
    import numpy
    dtype = [('index', int), ('length', float)]

    a = numpy.array(values, dtype=dtype)
    new = numpy.sort(a, order='index')
    return Sequences([[[int(x)] for x in new['length']]]), new


def activate(g):
    Activate(g)

def get_trunk_index(g):
    return Components(g.root, Scale=2)[0]

def get_trunk_sequences(g):
    pass

def get_axes(g):
    return Components(g.root, Scale=2)

def get_all_branch_length(g):
    return [g.property('Branch')[x].length   for x in Components(g.root, Scale=2)]

def _get_trunk_branch_length(g):
    """ use mtgtools.getBranchLength, twice as fast"""
    trunk_id = get_trunk_index(g)
    indices = Sons(trunk_id, EdgeType='+')
    length = [g.property('Branch')[x].length   for x in indices]
    return length

def get_trunk_branch_radius(g):
    trunk_id = get_trunk_index(g)
    indices = Sons(trunk_id, EdgeType='+')
    length = [g.property('Branch')[x].radius   for x in indices]
    return length

def get_branch_metamer_number_on_trunk(g):
    """ get branches on the trunk and returns number of metamer/internode
    in each of these branches"""
    length = [len([y for y in Components(x, Scale=4) if Class(y)=='I']) for x in Sons(get_trunk_index(g), EdgeType='+')]
    return length

def plot(g):
    import pylab
    pylab.hist(get_trunk_branch_length(g))
    pylab.title('Branch length histogram on the trunk')
    pylab.show()
    pylab.figure(2)
    pylab.hist(get_trunk_branch_radius(g))
    pylab.title('Branch radius histogram on the trunk')
    pylab.show()
    pylab.figure(3)
    pylab.hist(get_branch_metamer_number_on_trunk(g))
    pylab.title('Metamer number histogram (all branches on the trunk)')
    pylab.show()



def create_sequence1(g):
    var1 = get_trunk_branch_length(g)
    from openalea.sequence_analysis.sequences import Sequences
    return Sequences(var1)

def stat(g):
    print 'branch length:', get_trunk_branch_length(g)
    print 'branch category:', map(convert2LMS, get_trunk_branch_length(g))

#Plot(v1, 1,6, "Gaussian", ViewPoint="SegmentProfile")
