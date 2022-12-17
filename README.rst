pl-ocr_tool
================================

.. image:: https://img.shields.io/docker/v/fnndsc/pl-ocr_tool?sort=semver
    :target: https://hub.docker.com/r/fnndsc/pl-ocr_tool

.. image:: https://img.shields.io/github/license/fnndsc/pl-ocr_tool
    :target: https://github.com/FNNDSC/pl-ocr_tool/blob/master/LICENSE

.. image:: https://github.com/FNNDSC/pl-ocr_tool/workflows/ci/badge.svg
    :target: https://github.com/FNNDSC/pl-ocr_tool/actions


.. contents:: Table of Contents


Abstract
--------

An application that can take images as input and identify and extract written text from them, supporting 9 Languages(Chinese, English, French, German, Japanese, Korean, Spanish, Russian, Portuguese).
Idea users of this tool includes doctors, healthcare professionals or anyone familiar with the ChRIS project.


Description
-----------


``ocr_tool`` is a *ChRIS ds-type* application that takes in images as  files
and produces text.


Usage
-----

.. code::

    docker run --rm fnndsc/pl-ocr_tool ocr_tool
        [-h|--help]
        [--json] [--man] [--meta]
        [--savejson <DIR>]
        [-v|--verbosity <level>]
        [--version]
        <inputDir> <outputDir>


Arguments
~~~~~~~~~

.. code::

    [-h] [--help]
    If specified, show help message and exit.
    
    [--json]
    If specified, show json representation of app and exit.
    
    [--man]
    If specified, print (this) man page and exit.

    [--meta]
    If specified, print plugin meta data and exit.
    
    [--savejson <DIR>] 
    If specified, save json representation file to DIR and exit. 
    
    [-v <level>] [--verbosity <level>]
    Verbosity level for app. Not used currently.
    
    [--version]
    If specified, print version number and exit. 

    [--langdetect]
    If specified, print lang on image and exit.


Getting inline help is:

.. code:: bash

    docker run --rm fnndsc/pl-ocr_tool ocr_tool --man

Support languages and abbreviations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For now, we chose 9 commonly used languages added in the plugin, there are 80 languages can be added in to the plugin in total, please look into the page below and modify the code if needed.

You can add specific cases in dockerfile, then the image would auto-updated the Languages package when docker build the image

https://github.com/PaddlePaddle/PaddleOCR/edit/release/2.6/doc/doc_en/multi_languages_en.md


Run
~~~

You need to specify input and output directories using the `-v` flag to `docker run`.

You need to create a folder named "in" and a folder named "out" before testing the plugin locally to avoid access issue.

.. code:: bash

    docker run --rm -u $(id -u)                             \
        -v $(pwd)/in:/incoming -v $(pwd)/out:/outgoing      \
        fnndsc/pl-ocr_tool ocr_tool                        \
        /incoming /outgoing

Please change the "fnndsc" in the command to fit your image name, and add --lang <languages>

Example:

.. code:: bash

    docker run --rm -u $(id -u)                             \
        -v $(pwd)/in:/incoming -v $(pwd)/out:/outgoing      \
        walterzhao511/pl-ocr_tool ocr_tool                        \
        /incoming /outgoing --lang en

Development
-----------

Build the Docker container:

.. code:: bash

    docker build -t local/pl-ocr_tool .
    
Example:

.. code:: bash

    docker build -t walterzhao511/pl-ocr_tool .

Run unit tests:

.. code:: bash

    docker run --rm local/pl-ocr_tool nosetests
    
Example:

.. code:: bash

    docker run -rm walterzhao511/pl-ocr_tool nosetests  


Examples
--------

Put some examples here!


.. image:: https://raw.githubusercontent.com/FNNDSC/cookiecutter-chrisapp/master/doc/assets/badge/light.png
    :target: https://chrisstore.co
