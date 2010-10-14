# -*- coding: utf-8 -*-
__revision__ = "$Id$"

import sys
import os

from setuptools import setup, find_packages
from openalea.deploy.metainfo import read_metainfo

# Reads the metainfo file
metadata = read_metainfo('metainfo.ini', verbose=True)
for key,value in metadata.iteritems():
    exec("%s = '%s'" % (key, value))


pkg_root_dir = 'src'
pkgs = [ pkg for pkg in find_packages(pkg_root_dir)]
top_pkgs = [pkg for pkg in pkgs if  len(pkg.split('.')) < 2]
packages = pkgs
package_dir = dict( [('',pkg_root_dir)] + [(namespace + "." + pkg, pkg_root_dir + "/" + pkg) for pkg in top_pkgs] )

# Define global variables 
has_scons = False
if has_scons:
    build_prefix = "build-scons"
    scons_scripts=['SConstruct']
    lib_dirs = {'lib' : build_prefix+'/lib' }
    inc_dirs = { 'include' : build_prefix+'/include' }
    bin_dirs = { 'bin' : build_prefix+'/bin' }
else:
    build_prefix = None
    scons_scripts=None
    lib_dirs = None
    inc_dirs = None
    bin_dirs = None





setup(
    name=name,
    version=version,
    description=description,
    long_description=long_description,
    author=authors,
    author_email=authors_email,
    url=url,
    license=license,
    keywords = '',	

    # package installation
    packages= ['openalea', 'openalea.plantik', 'vplants.plantik'],
    package_dir= {'vplants.plantik': 'src/plantik', '':'src'},
    # Namespace packages creation by deploy
    namespace_packages = ['openalea', 'vplants'],
    create_namespaces = False,
    zip_safe= False,

    # Dependencies
    setup_requires = ['openalea.deploy'],
    install_requires = ['vplants.plantgl', 'openalea.mtg'],
    #'openalea.sequence_analysis'],
    dependency_links = ['http://openalea.gforge.inria.fr/pi'],
    include_package_data = True,
    share_dirs = {'share':'share'},


    )


