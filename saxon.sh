java -cp XSLT.tasks.saxonJar:/home/paul/saxon/Saxon-HE-10.2.jar net.sf.saxon.Transform 
	-xsl:/home/paul/dtd_gen/xslt_ex/source_data_extract.xsl 
	-s:/home/paul/Documents/information_technology/code/python/docx/target_xml/word/document.xml
	-o:/home/paul/Documents/information_technology/code/python/docx/result.xml
