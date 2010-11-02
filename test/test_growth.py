from openalea.plantik.biotik.growth import GrowthFunction

def test_attributes():
    gf = GrowthFunction()
    try:
        gf.K = 2
        assert False
    except:
        assert True
    try:
        gf.maturation = 2
        assert False
    except:
        assert True
    try:
        gf.A = 2
        assert False
    except:
        assert True
    try:
        gf.growth_rate = 'linear'
        assert False
    except:
        assert True
    try:
        gf.growth_rate = 0.5
        assert False
    except:
        assert True


def test_linear_growth_function():

    # simple case, first generate the function (linear case)
    inf = 0.
    sup = 5.
    maturation = 10.
    gf = GrowthFunction(inf, sup, maturation, growth_function='linear')

    result = []
    age_span = range(int(maturation)+1)
    for age in age_span:
        result.append(gf.growthValue(age))

    assert 5 == gf.growthValue(maturation+1)

    #case of list input

    res = gf.growthValue([1,2,3,4,5,6,7,8,9,10])


def test_logistic_growth_function():

    # simple case, first generate the function (linear case)
    inf = 0.
    sup = 5.
    maturation = 10.
    gf = GrowthFunction(inf, sup, maturation, growth_function='logistic')

    result = []
    age_span = range(int(maturation)+1)
    for age in age_span:
        result.append(gf.growthValue(age))


def test_str():
    gf = GrowthFunction()
    print gf

def test_sigmoid_growth_function():

    # simple case, first generate the function (linear case)
    inf = 0.
    sup = 5.
    maturation = 10.
    gf = GrowthFunction(inf, sup, maturation, growth_function='sigmoid')

    result = []
    age_span = range(int(maturation)+1)
    for age in age_span:
        result.append(gf.growthValue(age))


    assert gf.growthValue(maturation*100) == sup


