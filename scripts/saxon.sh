#!/bin/bash

java -cp XSLT.tasks.saxonJar:/home/paul/saxon/Saxon-HE-10.2.jar net.sf.saxon.Transform -s:/home/paul/Documents/information_technology/code/python/docx/xml_drafts/rireki_cv.xml -xsl:/home/paul/Documents/information_technology/code/python/docx/xslt_drafts/resume_cv_div_style.xslt -o:/home/paul/Documents/information_technology/code/python/docx/html_drafts/$1
