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

An application that can take images as input and identify and extract written text from them, supporting 80 Languages.
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

## 5 Support languages and abbreviations

| Language  | Abbreviation | | Language  | Abbreviation |
| ---  | --- | --- | ---  | --- |
|Chinese & English|ch| |Arabic|ar|
|English|en| |Hindi|hi|
|French|fr| |Uyghur|ug|
|German|german| |Persian|fa|
|Japan|japan| |Urdu|ur|
|Korean|korean| | Serbian(latin) |rs_latin|
|Chinese Traditional |chinese_cht| |Occitan |oc|
| Italian |it| |Marathi|mr|
|Spanish |es| |Nepali|ne|
| Portuguese|pt| |Serbian(cyrillic)|rs_cyrillic|
|Russia|ru||Bulgarian |bg|
|Ukranian|uk| |Estonian |et|
|Belarusian|be| |Irish |ga|
|Telugu |te| |Croatian |hr|
|Saudi Arabia|sa| |Hungarian |hu|
|Tamil |ta| |Indonesian|id|
|Afrikaans |af| |Icelandic|is|
|Azerbaijani  |az||Kurdish|ku|
|Bosnian|bs| |Lithuanian |lt|
|Czech|cs| |Latvian |lv|
|Welsh |cy| |Maori|mi|
|Danish|da| |Malay|ms|
|Maltese |mt| |Adyghe |ady|
|Dutch |nl| |Kabardian |kbd|
|Norwegian |no| |Avar |ava|
|Polish |pl| |Dargwa |dar|
|Romanian |ro| |Ingush |inh|
|Slovak |sk| |Lak |lbe|
|Slovenian |sl| |Lezghian |lez|
|Albanian |sq| |Tabassaran |tab|
|Swedish |sv| |Bihari |bh|
|Swahili |sw| |Maithili |mai|
|Tagalog |tl| |Angika |ang|
|Turkish |tr| |Bhojpuri |bho|
|Uzbek |uz| |Magahi |mah|
|Vietnamese |vi| |Nagpur |sck|
|Mongolian |mn| |Newari |new|
|Abaza |abq| |Goan Konkani|gom|



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
