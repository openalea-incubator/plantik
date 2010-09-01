from openalea.plantik.tools.plot import checkVariables


def test_check_variables():

    variables = ['test', 'test2']
    res = checkVariables(variables, 'test')
    assert res == ['test']

    res = checkVariables(variables)
    assert res == ['test', 'test2']

    res = checkVariables(variables, ['test', 'test2'])
    assert res == ['test', 'test2']

    # wrong variable name
    try:
        res = checkVariables(variables, ['test', 'dummy'])
    except:
        assert True

    # wrong variable type
    try:
        res = checkVariables(variables, 1111)
    except:
        assert True
