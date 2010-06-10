from openalea.plantik.tools.config import read_config_file
import os

def create_wrong_config_file():
    import ConfigParser
    config = ConfigParser.RawConfigParser()
    config.add_section('Section1')
    config.set('Section1', 'int', '15')
    config.add_section('Section2')
    config.set('Section2', 'int', '15')
    with open('example.cfg', 'wb') as configfile:
        config.write(configfile)


def create_config_file():
    import ConfigParser
    config = ConfigParser.RawConfigParser()
    config.add_section('Section1')
    config.set('Section1', 'int', '15')
    config.set('Section1', 'bool', 'true')
    config.set('Section1', 'float', '3.1415')
    config.set('Section1', 'baz', 'fun')
    config.set('Section1', 'bar', 'Python')
    config.set('Section1', 'foo', '%(bar)s is %(baz)s!')
    config.add_section('Section2')
    config.set('Section2', 'test', '1')
    config.set('Section2', 'booltest', 'False')
    config.set('Section2', 'booltest2', 'No')

    # Writing our configuration file to 'example.cfg'
    with open('example.cfg', 'wb') as configfile:
        config.write(configfile)


def test_config():
    # create a sample of configuration file
    create_config_file()

    # read only one section
    res2 = read_config_file('example.cfg', ['Section1'])
    # read with a mistake in prototype
    try:
        res2 = read_config_file('example.cfg', 'Section1')
    except:
        assert True

    # reads all sections implicitly
    res = read_config_file('example.cfg')
    # reads all sections explicitly
    res2 = read_config_file('example.cfg', ['Section1', 'Section2'])
    # check agreement
    assert res == res2

    assert res['test']  == 1
    assert res['booltest']  == False
    assert res['booltest2']  == False
    os.remove('example.cfg')

def test_wrong_config():

    create_wrong_config_file()

    try:
        res = read_config_file('example.cfg')
    except:
        assert True
    os.remove('example.cfg')

