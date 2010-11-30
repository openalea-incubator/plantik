import pickle
import numpy
import random


def single_plots(data, prefix, markersize=12):
    """Create data plots from a simulation data set

    """
    import numpy
    import pylab
    pylab.rcParams['text.usetex'] = True
    filename = ""


    try:
        filename =  prefix+'_resources.png'
        print 'Saving %40s ' % filename,
        pylab.clf()
        pylab.plot(data.time, data.C, 'o-b', markersize=markersize)
        pylab.hold(True)
        pylab.plot(data.time, data.A, 'gv-', markersize=markersize)
        pylab.plot(data.time,  data.reserve, '*-r', markersize=markersize)
        pylab.plot(data.time,  data.RESERVE, '*-m', markersize=markersize)
        pylab.plot(data.time,  data.R, 'y.-', markersize=markersize)
        pylab.legend(['Maintenance','Allocated','Reserve', 'Total reserve', 'total Resource'], loc='best')
        pylab.xlabel('Time(days)')
        pylab.ylabel('Fraction of total resourcse')
        pylab.grid(True)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass

    try:
        filename =  prefix+'_leaf_interception.png'
        print 'Saving %40s ' % filename,
        lg = [a.lg for a in data.lstring if a.type=='Leaf']
        pylab.clf()
        pylab.hist(lg , 20)
        pylab.xlabel('leaf interception')
        pylab.ylabel('Fraction of total resourcse')
        pylab.grid(True)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass

    # allocated and demand of the apex versus time + threshold lines 
    try:
        filename =  prefix+'_allocated_apex_versus_order.png'
        print 'Saving %40s ' % filename,
        allocated = [a.allocated for a in data.lstring if a.type=='Apex']
        order = [a.order for a in data.lstring if a.type=='Apex']

        pylab.clf()
        #h, xe, ye = pylab.histogram2d(order, allocated)
        #pylab.imshow(h)
        pylab.plot(allocated, order, 'o', markersize=markersize)
        pylab.xlabel('Allocated resources in apices')
        pylab.ylabel('Apex''s order')
        pylab.grid(True)
        pylab.ylim(ymin=0.)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass


    try:
        filename =  prefix+'_allocated_apex.png'
        print 'Saving %40s ' % filename,
        pylab.clf()
        pylab.plot(data.apex['age'], data.apex['allocated'], 'o-', markersize=markersize, label='allocated')
        pylab.hold(True)
        pylab.plot(data.apex['age'], data.apex['demand'], 'x', label='demand')
        apices = [a for a in data.lstring if a.type=='Apex']
        apex = [a for a in apices if a.id==2]
        try:
            pylab.plot(apex[0].age_v, apex[0].demand_initial_v, label='initial demand' )
        except:
            pass
        try:
            pylab.plot(apex[0].age_v, apex[0].demand_initial_v, label='initial demand' )
            pylab.plot([0,max(data.time)], [data.options['growth_threshold'], data.options['growth_threshold']], label='growth threshold')
            pylab.plot(apex[0].age_v,apex[0].vigor_v, label='vigor')
        except:
            pylab.text(0,0,'failed')
            pass
        pylab.legend(loc='best')
        pylab.xlabel('Time(days)')
        pylab.ylabel('Allocated resources in the Apex')
        pylab.grid(True)
        pylab.ylim(ymin=0.)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass

    try:
        filename =  prefix+'_test.png'
        print 'Saving %40s ' % filename,
        pylab.clf()
        for o in range(0,10):
            try:
                d1 = [a.demand_v for a in data.lstring if a.type=='Apex' if a.order==o][0]
                pylab.plot(d1, 'o-', markersize=markersize)
            except:
                pass
            pylab.hold(True)
        pylab.xlabel('days')
        pylab.ylabel('demand')
        pylab.grid(True)
        pylab.ylim(ymin=0., ymax=1.)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass


    # order histogram of the apices
    try:
        filename =  prefix+'_hist_order.png'
        print 'Saving %40s ' % filename,
        
        apex = [a for a in data.lstring if a.type=='Apex']
        # use set to get unique values, list to sort it for safety
        _order = list(set(numpy.array([a.order for a in apex])))
        _order.sort()
        _data = [0]*(max(_order)+1)
        for a in apex:
            _data[a.order] += 1
        pylab.clf()
        y = numpy.array(_data)/float(sum(_data))
        pylab.plot(_order, y, 'o-', markersize=markersize, label='order PDF')
        pylab.plot(_order, numpy.cumsum(y), 'x-', markersize=markersize, label='order CDF')
        pylab.legend(loc='best')
        pylab.xlabel('Apex order')
        pylab.ylabel('Order PDF and CDF')
        title = "N=%s. " % sum(_data)
        for i,a in enumerate(_data):
            if i<6:
                title += "order%s=%s, " % (i,a)

        pylab.title(title)
        pylab.grid(True)
        pylab.ylim(ymin=0., ymax=1.)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass

    # internode length versus birthdate for order categories
    try:
        filename = prefix+ '_internode_length_versus_time.png'
        print 'Saving %40s ' % filename,
        # from the final lstring
        internode = [a for a in data.lstring if a.type=='Internode']
        _length = numpy.array([a.length for a in internode])
        _order = numpy.array([a.order for a in internode])
        _age = numpy.array([a.age for a in internode])
        _birth = numpy.array([a.birthdate for a in internode])
        pylab.clf()
        _l = []
        for o in set(_order):
            _l.append('Order '+str(o))
            index = (_order==o).nonzero()
            _y = _length[index]
            pylab.plot(_birth[index], _y, 'o')
            pylab.hold(True)
        pylab.ylim(ymin=0., ymax=0.030)
        pylab.legend(_l, loc='best')
        pylab.xlabel('Time(days)')
        pylab.ylabel('Internode length (m)')
        pylab.title('Internode length evolution for various order')
        pylab.grid(True)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass
   
    try:
        filename = prefix+ '_leaf_area_histogram.png'
        print 'Saving %40s ' % filename,
        leaves = [a for a in data.lstring if a.type=='Leaf']
        _area = numpy.array([a.size for a in leaves])
        _max_area = numpy.array([a.leaf_max_area for a in leaves])
        pylab.clf()
        pylab.hist(_area, label="current length")
        pylab.xlabel('Leaf area')
        pylab.ylabel('\#')
        pylab.title('Leaf areas')
        pylab.grid(True)
        pylab.hold(True)
        pylab.hist(_max_area, label="final max area", alpha=0.5)
        pylab.legend(loc="best")
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass


    try:
        filename = prefix+ '_internode_length_histogram.png'
        print 'Saving %40s ' % filename,
        internode = [a for a in data.lstring if a.type=='Internode']
        _length = numpy.array([a.length for a in internode])
        _max_length = numpy.array([a.internode_max_size for a in internode])
        _radius = numpy.array([a.radius for a in internode])
        pylab.clf()
        h, r, n = pylab.hist(_length, label="current length")
        print r
        print h
        print n
        pylab.xlabel('Internode length')
        pylab.ylabel('\#')
        pylab.title('Internode length histograms')
        pylab.grid(True)
        pylab.hold(True)
        pylab.hist(_max_length, range=[min(r), max(r)], label="final length", alpha=0.5)
        pylab.legend(loc="best")
        pylab.savefig(filename)
        print '...done'

        filename = prefix+ '_internode_radius_histogram.png'
        print 'Saving %40s ' % filename,
        pylab.clf()
        pylab.hist(_radius)
        pylab.xlabel('Internode radius')
        pylab.ylabel('\#')
        pylab.title('Internode radius histograms')
        pylab.grid(True)
        pylab.savefig(filename)
        print '...done'
    except ValueError,e:
        print e
        import warnings
        warnings.warn('plot %s failed' % filename)
        pass






if __name__=="__main__":
    import sys
    filename_data = sys.argv[1]
    data = pickle.load(open(filename_data))
    filename_prefix = data.options['filename_prefix']
    single_plots(data, filename_prefix)
