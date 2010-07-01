from openalea.plantik.tools.plot import CheckVariables


def test_check_variables():

    variables = ['test', 'test2']
    res = CheckVariables(variables, 'test')
    assert res == ['test']

    res = CheckVariables(variables)
    assert res == ['test', 'test2']

    res = CheckVariables(variables, ['test', 'test2'])
    assert res == ['test', 'test2']

    # wrong variable name
    try:
        res = CheckVariables(variables, ['test', 'dummy'])
    except:
        assert True

    # wrong variable type
    try:
        res = CheckVariables(variables, 1111)
    except:
        assert True
