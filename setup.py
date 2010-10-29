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

# List of top level wralea packages (directories with __wralea__.py) 
#wralea_entry_points = ['%s = %s'%(pkg,namespace + '.' + pkg) for pkg in top_pkgs]

# dependencies to other eggs
setup_requires = ['openalea.deploy']
if("win32" in sys.platform):
    install_requires = ['openalea.mtg']
else:
    install_requires = ['openalea.mtg']

#install_requires = [binary_deps('vplants.plantgl')]
if 'linux' not in sys.platform:
    install_requires.append('PyOpenGL')
    install_requires.append('pyqglviewer')

# web sites where to find eggs
dependency_links = ['http://openalea.gforge.inria.fr/pi']

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
    packages= packages,
    package_dir= package_dir,

    # Namespace packages creation by deploy
    #namespace_packages = [namespace],
    create_namespaces = True,
    zip_safe= False,

    # Dependencies
    setup_requires = setup_requires,
    install_requires = install_requires,
    dependency_links = dependency_links,


    lib_dirs = lib_dirs,
    inc_dirs = inc_dirs,
    bin_dirs = bin_dirs,
   
    include_package_data = True,
    # (you can provide an exclusion dictionary named exclude_package_data to remove parasites).
    # alternatively to global inclusion, list the file to include   
    #package_data = {'' : ['*.pyd', '*.so'],},
    #share_dirs = {'share':'share'},
    # postinstall_scripts = ['',],

    # Declare scripts and wralea as entry_points (extensions) of your package 
    entry_points = {
            "wralea": [ "plantik = vplants.plantik_wralea",
                        "plantik.config = vplants.plantik_config_wralea",
                        "plantik.test = vplants.plantik_test_wralea",
            ]
            },


    )


