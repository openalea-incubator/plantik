from openalea.plantik.biotik.growth import GrowthFunction



def test_linear_growth_function():

    inf = 0.
    sup = 5.
    maturation = 10.
    gf = GrowthFunction(inf, sup, maturation)

    result = []
    age_span = range(int(maturation)+1)
    for age in age_span:
        result.append(gf.getValue(age))

    assert 5 == gf.getValue(maturation+1)
    #import pylab
    #pylab.clf()
    #pylab.plot(age_span,result)
    #pylab.show()


def test_sigmoid_growth_function():

    inf = 0.
    sup = 5.
    maturation = 10.
    gf = GrowthFunction(inf, sup, maturation, growth_function='sigmoid')

    result = []
    age_span = range(int(maturation)+1)
    for age in age_span:
        result.append(gf.getValue(age))

    #import pylab
    #pylab.clf()
    #pylab.plot(age_span,result)
    #pylab.show()
