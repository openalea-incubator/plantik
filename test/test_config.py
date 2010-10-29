from openalea.plantik.tools.config import *
import os
from nose import with_setup


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
    config = createConfigParserExample()
    # Writing our configuration file to 'example.cfg'
    fp = open('example.cfg', 'w')
    config.write(fp)
    fp.close()
    return config

def test_saveConfigParser():
    this = create_config_file()
    saveConfigParser('test.ini', this)
    res1 = ConfigParams('test.ini')
    res2 = ConfigParams('example.cfg')

    assert res1.Section1.int == res2.Section1.int == 15
    assert res1.Section2.test == res2.Section2.test == 1

    os.remove('test.ini')


def test_ConfigParams():
    config = create_config_file()
    config_params = ConfigParams(config)
    import tempfile
    filename = tempfile.mkstemp()[1]
    config_params.save(filename)
    import os
    os.remove(filename)

    #try to use it with an argument that is a not a filename neither a configparser instance
    try:
        config_params = ConfigParams(1)
        assert False
    except:
        assert True


def test_config2dict():
    config = create_config_file()
    config_params = ConfigParams(config)

