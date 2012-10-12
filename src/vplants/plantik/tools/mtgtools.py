#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""Branch module

.. module:: branch
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
import openalea.mtg.algo as algo


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

    >>> res = mtgtools.getVolumeInternodes()    #doctest: +SKIP
    >>> res = mtgtools.getVolumeInternodes(order=1) #doctest: +SKIP

    or standard MTG usage using again the :attr:`mtg` attribute. 

    >>> sorted(mtgtools.mtg.properties().keys())
    ['Apex', 'Branch', 'GrowthUnit', 'Internode', 'Leaf', 'Plant', 'edge_type', 'geometry', 'label']

    .. note:: When you set the :attr:`mtg` attribute, the :meth:`update` method is called. What this function does is to update
        the :attr:`ids` to store the indices of all leaves, internodes, growth units, apices and branches. This is quite handy to
        manipulate MTG. Similarly, the :meth:`update` method is also called when using :meth:`load_pickle`.

    :Database interaction:

    Another great feature of this class is to allows users to create a database out of MTG.
    See :meth:`createDB`, :meth:`select` and  :meth:`select_attribute`, :meth:`requestDB` methods for more details.
    To give you an insight, it allows you to retrieve a list of ids given some criteria. It work as follows::


        [mtgtools.mtg.property('Branch')[id].length for id in mtgtools.select(label="B", order=1)]
        175us

    which command is twice as fast (and simpler) as a standard call to::

        [mtgtools.mtg.property('Branch')[id].length for id in mtgtools.mtg.vertices() if mtgtools.mtg.label(id)=="B" and mtgtools.mtg.order(id)==1]
        795us

    and 90 times as fast as a command badly written (notice the inversion of if statements)::

        [mtgtools.mtg.property('Branch')[id].length for id in mtgtools.mtg.vertices() if mtgtools.mtg.order(id)==1 and mtgtools.mtg.label(id)=="B"]
        15ms

    Yet, if you requete is simple (only on the label of vertices), it is even faster to directly use the list of ids stored in :attr:`ids` as follows::

        [mtgtools.mtg.property('Branch')[id].length for id in mtgtools.ids['B'] if mtgtools.mtg.order(id)==1]
        58us

    In general, you would only need the :meth:`select_attribute` method and use it as follows:

    .. plot::
        :include-source:
        :width: 50%

        from openalea.plantik import *
        mtgtools = MTGTools()
        mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
        import pylab
        pylab.hist(mtgtools.select_attribute("area", label="L"))

    """
    def __init__(self, mtg=None, verbose=True ):
        """**Constructor**

        .. warning:: right now, this module expect the MTG to have the following labels: L, A, I, U, B


        .. todo:: search for the label automatically.

        :param MTG mtg: a valid mtg


        :attributes:

            * :attr:`ids`: dictionary containing the indices for each label
            * :attr:`parameters`: dictionary containing the indices for each label



        """
        self.verbose = verbose
        self._mtg = mtg
        self.ids = {'L':None,'I':None,'U':None,'B':None, 'A':None}
        self.scales = {'A':4,'I':4,'L':4, 'P':1, 'B':2, 'U':3}
        self.modules = ['A','I','L','U','B']

        #: dictionary giving the full Label of the following labels: A, I, L, P, U, B
        # that are: Apex, Internode, Leaf, Plant, GrowthUnit, and Branch
        self.parameters = { 'A': ['Apex'], 
                            'I': ['Internode'],  
                            'L': ['Leaf'],
                            'P':['Plant'], 
                            'U':['GrowthUnit'], 
                            'B':['Branch']}

        self.DB = None

    def save_pickle(self, filename):
        """Save the MTG into a pickle file

        :param str filename: 

        .. todo:: set an output directory or temp file into a temp directory.
        """
        import pickle
        if self.mtg != None:
            pickle.dump(self.mtg, open(filename, "w"))

    def load_pickle(self, filename):
        """Load a pickled file.

        :param str filename: the filename to load with :mod:pickle
        :return: the mtg file 
        """
        import pickle
        try:
            mtg = pickle.load(open(filename, "r"))
            self.mtg = mtg #this setter also calls the update() method!
        except:
            import warnings
            warnings.warn('Picled file %s could not be found' % filename)

    def update(self, debug=0):
        """update the mtg and relevant information

        :param MTG mtg: the new mtg

        This function parse the MTG, and extract the ids of all labels found in :attr:`parameters`.

        Then ids are accessible via the :attr:`ids` and allows to speed up further request made on
        the MTG. 
        

        """
        if debug==1:
            import inspect
            if inspect.stack()[1][3] != '_setMTG':
                import warnings
                warnings.warn("no need to call update() function. Use the setter for mtg attribute instead that automatically calls update()")

        for k,v in self.parameters.iteritems():
            self.ids[k] =  self.mtg.properties()[v[0]].keys()

        #check correctness of number of elements.
        length = 0
        for module in self.modules:
            length += len(self.ids[module])
        # Plant=1 + mtgroot=1
        assert len(self.mtg) == length+2


    def _setMTG(self, mtg):
        self._mtg = mtg
        self.update()
    def _getMTG(self):
        return self._mtg
    mtg = property(fget=_getMTG, fset=_setMTG, doc="getter/setter for mtg attribute")


    def getBranchesLength(self, order=None):
        """Returns branches lengths at a given order

        :param int order: select only branches at this order

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

        This function does not use the DB but the ids store while setting the MTG attribute.
        Therefore, using the ids stored in a list, it is quite fast but limite to order and type. 
        For instance::

            %timeit mtgtools.getLength(order=1, type='B')
            45us

        """
        module = self.parameters[type][0]
        if order != None:
            res = [self.mtg.property(module)[id].length for id in self.ids[type] 
                if self.mtg.order(id)==order]
        else:
            res = [self.mtg.property(module)[id].length for id in self.ids[type]]
        return res

    def getRank(self, type=None, order=None):
        """returns the ranks of all object of a given type and order

        :param str type:
        :param int order:
        :return: list of ranks

        """
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
        try:
            conn = sqlite3.connect(self.dbfile[1])
        except AttributeError, e:
            if self.verbose:
                print "MTGTools error: Cannot access dbfile ? Trying to create one by calling createDB() method."
            try:
                self.createDB()
            except:
                print "DB could not be created. Try manually....trying again",
                try:
                    self.createDB()
                except:
                    print "...failed"
            else:
                if self.verbose:
                    print "DB created succesfully. Connecting...",
                conn = sqlite3.connect(self.dbfile[1])
                if self.verbose:
                    print "succeeded."


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

        if self.DB == None:
            self.connectDB()
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
        be accessed later on using the :meth:`requestDB` and :meth:`select` methods.
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
    
        if you do not like SQL request, you may try the :meth:`select` method.
        The previous command would be equivalent to 



        ::

            mtgtools.select(select="*")
        """
        import sqlite3
        import tempfile
        from openalea.mtg.algo import rank  as getrank
        self.dbfile = tempfile.mkstemp('dbMTG')
        conn = sqlite3.connect(self.dbfile[1])
        c = conn.cursor()
        c.execute("create table mtg (scale int, ord int, label text, rank int, id integer, complex integer)")
        vertices = self.mtg.vertices()
        for id in vertices:
            scale = self.mtg.scale(id)
            label = self.mtg.label(id)
            order = self.mtg.order(id)
            complex = self.mtg.complex(id)
            rank = getrank(self.mtg, id)
            c.execute("insert into mtg values (?,?,?,?,?,?)", \
                      (scale, order, label, rank, id, complex))
        conn.commit()
        c.close()

    def select_attribute(self, attribute, **kargs):
        """Select attribute given user parameter inputs

        :param attribute: attribute to extract from the nodes that match the other input parameters
        :param label: select node that match this label
        :param order: select node that match this order
        :param scale: select node that match this scale
        :param complex: select node that match this complex
        :param rank: select node that match this rank

        ::

            data = mtgtools.select_attribute("length", order=1, label="B")

        .. seealso:: :meth:`select`, :meth:`requestDB`
        """

        label = kargs.get("label")
        if kargs.get("label") == None:
            print "provide a valid label.Labels are %s" % self.parameters.keys()
            return
        return [getattr(self.mtg.property(self.parameters[label][0])[id], 
                        attribute) for id in self.select(**kargs)]


    def select(self, select="id", order=None, label=None, scale=None, 
               rank=None, complex=None):
        """Return ids in the DB that fit the user parameter inputs.

        :param label: select node that match this label
        :param order: select node that match this order
        :param scale: select node that match this scale
        :param rank: select node that match this rank
        :param complex: select node that match this complex

        ::

            ids = mtgtools.select(select="id", order=1, label="B")

        then::

            [getattr(mtgtools.mtg.property('Branch')[id], 'length') for id in ids]


        .. seealso:: :meth:`select_attribute`, :meth:`requestDB`
        """
        assert select in ["id", "ord", "scale", "label", "rank", "complex"]
        request = "select %s from mtg " % select
        where = False

        # make this code more robust using kargs 
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
        if complex !=None:
            if where == False: 
                request += " where ";  
                where = True
            else:
                request += " and "
            request += "complex == '%s' " % complex
        if rank !=None:
            if where == False: 
                request += " where ";  
                where = True
            else:
                request += " and "
            request += "rank == '%s' " % rank
        res = self.requestDB(request, column=select)
        #self.closeDB()
        return res


    def getVolumeInternodes(self, order=None):
        """return total volume at a given order

        :param int order: if no order is provided, returns total volume

        >>> from openalea.plantik.tools.mtgtools import MTGTools
        >>> from openalea.plantik import get_shared_data
        >>> mtgtools = MTGTools()
        >>> mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
        >>> res = mtgtools.getVolumeInternodes()  #doctest: +SKIP
        >>> res = mtgtools.getVolumeInternodes(order=1) #doctest: +SKIP

        """
        from openalea.plantik.biotik import Internode
        ids = self.select(order=order, label="I" )
        volume_standard = self.mtg.property('Internode')[ids[0]].volume_standard
        return sum([self.mtg.property('Internode')[id].volume 
                    for id in ids ])/ volume_standard

    def getAreaLeaves(self, order=None):
        """return area leaves given order

        :param int order: if no order is provided, returns total volume

        >>> res = mtgtools.getAreaLeaves() #doctest: +SKIP
        >>> res = mtgtools.getAreaLeaves(order=1) #doctest: +SKIP
        """
        return self.select_attribute("area", order=order, label="L")


    def hist_apex_order(self, show=False):
        """plot histogram of the order (using apices order)

        .. plot::

            from openalea.plantik import *
            mtgtools = MTGTools()
            mtgtools.load_pickle(get_shared_data('pruning_example.mtg'))
            mtgtools.hist_apex_order() 

        """
        orders = self.select(select="ord", label='A')
        import pylab
        pylab.figure()
        pylab.clf()
        pylab.hist(orders, range(0,max(orders)+1))
        if show: pylab.show()

    def set_order_path_rank(self):
        """Extract the order,rank.height and populate the object context accordingly


        This function parse the whole MTG, extract the rank, order and height and update
        the context instance of each object. This is used by pruning.lpy in plant.update().

        .. seealso:: :class:`~openalea.plantik.biotik.context.Context`

        .. todo:: to be optimised.

        .. note:: does not use DB facilities
        """
        from openalea.mtg.algo import rank, order, height

        g = self.mtg

        for id in g.vertices():
            node = g.node(id)
            if node.scale()>=2:
                obj = g.property(self.parameters[node.label][0])[id]
                obj.context.rank = rank(g, id)
                obj.context.order = order(g, id)
                obj.context.height = height(g, id)



    def distance_to_apex_and_order_reassignment(self):
        """need to be called  only if pruning is done.

        """
        for bid in self.ids['B']:
            # the following statement looks for all element of same order as the branch but at scale 4
            branch_components = list(self.mtg.components_at_scale (bid, scale=4))
            #print bid, len(branch_components), branch_components

            axis_id = list(algo.axis(self.mtg, bid, scale=4))
            if len(axis_id)>0:
                last_axis_id = axis_id[-1]
            else:
                continue
            apices_ids = [x for x in branch_components if self.mtg.class_name(x)=='A']

            # if the last element is an apex, it means we have an unpruned axes, so nothing to be done
            if self.mtg.label(last_axis_id) == 'A':
                pass
                # if so, we compute the distance between all apices at order 3 with this apices

            #otherwise, we need to reassign order to lateral meristem to get a new apex.
            else:
                #get last apex and decrease its order by 1
                try:
                    this_id = apices_ids[-1]
                    self.mtg.property('Apex')[this_id].context.order -= 1
                except:
                    pass

            #in all cases, recompute the distance between lateral meristem and apex
            heights = [algo.alg_height(self.mtg, branch_components[0], x) for x in apices_ids]
            try:
                max_heights = max(heights)
                distances = [abs(x - max_heights) for x in heights]

                for i, d in zip(apices_ids, distances):
                    #print i, d, self.mtg[i]
                    self.mtg.property('Apex')[i].context.d2a = d
            except:
                pass



    def get_branch_radius_on_trunk(self):
        """return all radius of branches on the trunk. 

        Branches on the trunk have order 1 since the trunk 
        itself has order 0

        """
        return self.select_attribute("radius", label="B", order=1)

    def get_internode_length_on_axis(self, axis_order=None):
        """
        Internode have same order as the axis on which they stands

        default beahviour is returns all internode length from any trunk/branch
        """
        if axis_order == None:
            return self.select_attribute("length", label="I")
        else:
            assert type(axis_order)==int
            return self.select_attribute("length", label="I", order=axis_order)


    def get_branch_length_on_trunk(self):
        """return all length of branches on the trunk"""
        return self.select_attribute("length", label="B", order=1)

    def get_axes(self):
        """return indices of all branches
        
        .. note:: same as self.select(label="B")

        .. warning:: call createDB or connectDB before usage
        """
        return self.select(label="B")

    def create_sequence_branch_on_trunk(self):
        """return sequence of the branch category on trunk

        where category are L, M, or S
        """
        var1 = self.get_branch_length_on_trunk()
        from openalea.sequence_analysis.sequences import Sequences
        return Sequences(convert2LMS(var1))

    def plot(self, show=True):
        import pylab
        pylab.figure(1)
        pylab.hist(self.get_branch_radius_on_trunk())
        pylab.title('Branch radius histogram on the trunk')
        if show==True:pylab.show()
        pylab.figure(2)
        pylab.hist(self.get_branch_radius_on_trunk())
        pylab.title('Branch radius histogram on the trunk')
        if show==True:pylab.show()


    def get_branch_position(self, order=1):
        """Returns the branch position (height) found on the main trunk

        :param int order: instead of the trunk, you can select branches height
            on other axis. However, the returned list contained results for all
            axis of this order.
        """
        g = self.mtg
        #order 1 to select branches on the main trunk
        ids = self.select(label='B', order=order)
        positions = []
        for id in ids:
            try:
                internode_id = g.components_at_scale_iter(id, 4).next()
                pos = g.property('Internode')[internode_id].context.height-1
            except:
                pos = 0
            positions.append(pos)
        assert len(positions) == len(ids)
        return positions

    def get_trunk_info(self):
        """returns LMS info of branches on the trunk"""
        return convert2LMS(self.get_branch_length_on_trunk())

    def get_trunk_sequence(self):
        """returns a trunk sequence of branch LMS info """
        # This command gets the apices of order 1. If a branch of order 1 grew, 
        # this gives the length of each branch in number of internodes.
        #trunk_rank_apices_method = self.select(label='A', order=1,select='rank')
        ranks = self.select(label='I', order=0,select='rank')
        if len(ranks)==0:
            return []
        trunk = [0] * len(ranks)
        branches_LMS = self.get_trunk_info()
        branches_position = self.get_branch_position()
        try:
            for LMS, pos in zip(branches_LMS, branches_position):
                trunk[pos-1] = LMS
        except:
            print len(ranks), len(branches_LMS)
            print branches_LMS
            print branches_position
        return trunk

def branch_rank_on_trunk(g):
    return [g.property('Branch')[id].context.rank 
            for id in g.components(1) if g.class_name(id) == 'B']


def convert2LMS(length):
    """Convert a length into labels L, M, S


    L, M, S stand for Long, Medium, Samll. 
    
    * S(1): if l<0.05
    * M(2) if 0.05<=l<0.2
    * L(3) if l>=0.2

    values fixed Costes et al 2003 or equivalent

    :param float length:
    :return: int 1 for S, 2 for M and 3 for L
    """
    if type(length) != list:
        if length<0.05:
            return 1
        elif length< 0.2:
            return 2
        else:
            return 3
    elif type(length) == list:
        res = []
        for x in length:
            if x<0.05:
                res.append(1)
            elif x< 0.2:
                res.append(2)
            else:
                res.append(3)
        return res

def _create_sequences(g):
    """
    0: nothing
    1: Short
    2: Medium
    3: Long


    to be cleaned and added to mtgtools
    """
    from openalea.sequence_analysis import Sequences
    Activate(g)
    apices_ids = [id for id in Components(2, 4) if Class(id)=='A']
    branch_ids = Sons(2)
    branch_length = [g.property('Branch')[id].length for id in Sons(2)]
    branch_rank = [g.property('Branch')[id].context.rank for id in Sons(2)]
    apices_rank = [g.property('Apex')[id].context.rank 
                   for id in g.components_at_scale(2, 4) if Class(id)=='A']
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

def get_trunk_index(g ):
    """ to be removed"""
    return Components(g.root, Scale=2)[0]

def get_branch_metamer_number_on_trunk(g):
    """ get branches on the trunk and returns number of metamer/internode
    in each of these branches

    to be removed"""
    length = [len([y for y in Components(x, Scale=4) if Class(y)=='I']) 
              for x in Sons(get_trunk_index(g), EdgeType='+')]
    return length

def plot(g):
    """to be removed"""
    import pylab
    pylab.figure(3)
    pylab.hist(get_branch_metamer_number_on_trunk(g))
    pylab.title('Metamer number histogram (all branches on the trunk)')
    pylab.show()

