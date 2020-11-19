<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../css_drafts/grid_style.css"/>
            </head>
            <body>
                <div class="container">
                    <xsl:for-each select="resume/experience/company">
                        <div class="resume_jpn_tp">
                            <div class="exp_heading">
                                <xsl:value-of select="dates"/>
                                <xsl:value-of select="c_name"/>
                            </div>
                            <div class="business_type">
                                <xsl:value-of select="location"/>
                            </div>
                            <div class="employment_type">
                                <xsl:value-of select="substring(c_name,1,4)"/>
                                社員として勤務
                            </div>
                            <div class="resume_jpn_btm">
                                <div class="emp_duration_hd">期間</div>
                                <div class="emp_duration">
                                    <xsl:value-of select="dates"/>
                                </div>
                                <div class="emp_details_hd">職務内容</div>
                                <div class="emp_synopsis">
                                    <xsl:value-of select="job_title"/>
                                </div>
                                <div class="emp_details">
                                    <xsl:apply-templates select="details"/>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="details">
        <ul style="list-style-type:none">
            <xsl:for-each select="*">
                <xsl:if test="(./@type = 'bp')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <li>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:if>
                <xsl:if test="(./@type = 'pp')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <li>
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </li>
                </xsl:if>
                <xsl:if test="(./@type = 'kw')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <li>
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </li>
                </xsl:if>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
