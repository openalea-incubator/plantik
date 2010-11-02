VisuAlea
########
.. contents::

.. module:: vplants.plantik.dataflows.config
VisuAlea nodes associated to plantik (tools/config)
======================================================

Read a standard config file (:mod:`ConfigParser`)
-------------------------------------------------



.. dataflow:: vplants.plantik.test ConfigParserRead
    :width: 50%

    In VisuAlea, you can read a config file (:mod:`ConfigParser` format) with the node **ConfigParser**., from which 
    it is possible to extract the section name with **ConfigParserSections** or options from a specific section name 
    (here 'general'). ReadConfigParser returns an instance of ConfigParser.


Save a standard config file (:mod:`ConfigParser`)
-------------------------------------------------
.. dataflow:: vplants.plantik.test ConfigParserSave

    From a valid ConfigParser instance, you can save it with **SaveConfigParser** node.

Transform a ConfigParser instance into a ConfigParams
------------------------------------------------------

In Plantik, we wrap the ConfigParser instance into a more user friendly interface provided by the :class:`ConfigParams` clas, 
that read a config file, and transform.

The node ConfigParams allows you to perform this transformation as well. But usually, you will simply use the :class:`ReadConfigFile`
that read the config file and transform it into a configParams instance in one node. 


.. dataflow:: vplants.plantik.test ConfigParams

    From a valid ConfigParser instance, you can save it with **SaveConfigParser** node.


Build up a ConfigParser file from names and dictionaries
--------------------------------------------------------

.. dataflow:: vplants.plantik.test ConfigParserGenerator

    From a valid ConfigParser instance, you can save it with **SaveConfigParser** node.



.. module:: vplants.plantik.dataflows.growth

VisuAlea nodes associated to plantik (biotik/growth)
======================================================

Select a GrowthFunction and plot it
----------------------------------------------------------

.. dataflow:: vplants.plantik.test GrowthFunction
    :width: 50%

    In VisuAlea, you can test the :class:`~openalea.plantik.biotik.growth.GrowthFunction` functions by
    selecting the method (linear, sigmoid, logistic) and their arguments, so as to compare then.
