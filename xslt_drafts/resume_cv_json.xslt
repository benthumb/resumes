<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	{ "resume" : { 
	"contact_info" : { 
    <xsl:for-each select="resume/contact_info">
        <xsl:text> "name" : "</xsl:text><xsl:value-of select="name"/><xsl:text>" ,</xsl:text>
        <xsl:text> "address" : "</xsl:text><xsl:value-of select="address"/><xsl:text>" ,</xsl:text>
        <xsl:text> "phone" : "</xsl:text><xsl:value-of select="phone"/><xsl:text>" ,</xsl:text>
        <xsl:text> "email" : "</xsl:text><xsl:value-of select="email"/><xsl:text>" ,</xsl:text>
        <xsl:text> "website" : "</xsl:text><xsl:value-of select="website"/><xsl:text>" </xsl:text>
    </xsl:for-each>
        },
	    "education" : {
            <xsl:for-each select="resume/education/school">
		    <xsl:text>"school</xsl:text><xsl:value-of select="position()" /><xsl:text>" : {</xsl:text> 
                       <xsl:text> "s_name" : "</xsl:text><xsl:value-of select="s_name"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "dates" : "</xsl:text><xsl:value-of select="dates"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "major" : "</xsl:text><xsl:value-of select="major"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "degree" : "</xsl:text><xsl:value-of select="degree"/><xsl:text>" </xsl:text>
               },
            </xsl:for-each>
        },
        "experience" : {
            <xsl:for-each select="resume/experience/company">
		    <xsl:text>"company</xsl:text><xsl:value-of select="position()" /><xsl:text>" : {</xsl:text> 
                       <xsl:text> "co_id" : "</xsl:text><xsl:value-of select="@co_id"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "c_name" : "</xsl:text><xsl:value-of select="c_name"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "c_bg" : "</xsl:text><xsl:value-of select="c_bg"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "location" : "</xsl:text><xsl:value-of select="location"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "dates" : "</xsl:text><xsl:value-of select="dates"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "job_title" : "</xsl:text><xsl:value-of select="job_title"/><xsl:text>" ,</xsl:text>
                       <xsl:text> "job_desc" : "</xsl:text><xsl:value-of select="job_desc"/><xsl:text>" ,</xsl:text>
			       "details" : {
                           <xsl:apply-templates select="details"/>
                       }
                },
            </xsl:for-each>
        }
    }
}
    </xsl:template>
    <xsl:template match="details">
            <xsl:for-each select="*">
                <xsl:if test="(./@type = 'bp')">
			<xsl:text>"detail_ln</xsl:text><xsl:value-of select="position()" /><xsl:text>" : "bp|</xsl:text><xsl:value-of select="."/><xsl:text>" ,</xsl:text> 
                </xsl:if>
                <xsl:if test="(./@type = 'pp')">
			<xsl:text>"detail_ln</xsl:text><xsl:value-of select="position()" /><xsl:text>" : "pp|</xsl:text><xsl:value-of select="."/><xsl:text>" ,</xsl:text> 
                </xsl:if>
                <xsl:if test="(./@type = 'kw')">
			<xsl:text>"detail_ln</xsl:text><xsl:value-of select="position()" /><xsl:text>" : "kw|</xsl:text><xsl:value-of select="."/><xsl:text>" ,</xsl:text> 
                </xsl:if>
            </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
