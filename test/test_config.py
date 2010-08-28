from openalea.plantik.tools.config import ReadConfigFile, save_config_file
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
    fp = open('example.cfg', 'w')
    config.write(fp)
    fp.close()
    return config

def test_save_config():
    this = create_config_file()
    save_config_file('test.ini', this)
    res1 = ReadConfigFile('test.ini')
    res2 = ReadConfigFile('example.cfg')

    assert res1.Section1.int == res2.Section1.int == 15
    assert res1.Section2.test == res2.Section2.test == 1

    os.remove('test.ini')


class test_ReadConfigFile():

    def __init__(self):
        # create a sample of configuration file
        create_config_file()

        try:
            res = ReadConfigFile('dummy')
            assert False
        except:
            assert True

        self.all_sections = ReadConfigFile('example.cfg')
        self.one_section = ReadConfigFile('example.cfg', ['Section1'])
        
        # read with a mistake in prototype
        try:
            ReadConfigFile('example.cfg', 'Section1')
            assert False
        except:
            assert True

    def test_read_sections(self):
        assert self.one_section.Section1.bar == 'Python'
        # check agreement
        assert self.all_sections.Section2.booltest  == False
        assert self.one_section.Section1.int == self.all_sections.Section1.int

    def tearDown(self):
        os.remove('example.cfg')

    def test_read_sections(self):
        # should raise a warning because this method has no effect(used by init only).
        self.all_sections._read_sections(['Section1'])

def test_wrong_config_filename():
    create_wrong_config_file()
    try:
        res = ReadConfigFile('example.cfg')
        assert False
    except:
        assert True
    os.remove('example.cfg')


