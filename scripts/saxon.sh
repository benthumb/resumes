#!/bin/bash

java -cp XSLT.tasks.saxonJar:/home/paul/saxon/Saxon-HE-10.2.jar net.sf.saxon.Transform -s:/home/paul/Documents/information_technology/code/python/docx/xml_drafts/$1 -xsl:/home/paul/Documents/information_technology/code/python/docx/xslt_drafts/$2 -o:/home/paul/Documents/information_technology/code/python/docx/html_drafts/$3
