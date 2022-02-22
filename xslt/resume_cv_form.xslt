<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../css_drafts/grid_style.css"/>
                <script src="../scripts/res_cv.js"></script>
                <meta http-equiv="Pragma" content="no-cache" />
                <meta http-equiv="Expires" content="-1" />
            </head>
            <body>
                <form>
                    <xsl:for-each select="resume/contact_info">
                        <label for="name"><h3 class="update_form">First and Last Name:</h3></label>
                        <input type="text" id="name" name="name" size="50" value="{name}"/>
                        <label for="address"><h3 class="update_form">Address:</h3></label>
                        <input type="text" id="address" name="address" size="50" value="{address}"/>
                        <label for="address"><h3 class="update_form">Email Address:</h3></label>
                        <input type="text" id="address" name="address" size="50" value="{email}"/>
                        <br/>
                        <input class="button" type="submit" onclick="push()" value="Update" />
                        <input class="button" type="submit" value="Done" />
                    </xsl:for-each>
                </form>
                    <hr class="new5"/>
                    <xsl:for-each select="resume/education/school">
                        <form>
                            <label for="school"><h3 class="update_form">School:</h3></label>
                            <input type="text" id="school" name="school" size="50" value="{s_name}"/>
                            <label for="att_dates"><h3 class="update_form">Attendance Dates:</h3></label>
                            <input type="text" id="att_dates" name="att_dates" size="50" value="{dates}"/>
                            <br/>
                            <input class="button" type="submit" onclick="push()" value="Update" />
                            <input class="button" type="submit" value="Done" />
                        </form>
                    </xsl:for-each>
                <hr class="new5"/>
                    <xsl:for-each select="resume/experience/company">
                        <form>
                            <xsl:variable name="cmp_cnt" select="position()" />
                            <label for="company"><h3 class="update_form">Company Name:</h3></label>
                            <input type="text" id="company" name="company[{$cmp_cnt}][name]" size="50" value="{c_name}"/>
                            <label for="statistics"><h3 class="update_form">Statistics:</h3></label>
                            <input type="text" id="statistics" name="company[{$cmp_cnt}][statistics]" size="50" value="{c_bg}"/>
                            <label for="location"><h3 class="update_form">Location:</h3></label>
                            <input type="text" id="location" name="company[{$cmp_cnt}][location]" size="50" value="{location}"/>
                            <label for="dates"><h3 class="update_form">Dates:</h3></label>
                            <input type="text" id="dates" name="company[{$cmp_cnt}][dates]" size="50" value="{dates}"/>
                            <label for="job_title"><h3 class="update_form">Job Title:</h3></label>
                            <input type="text" id="job_title" name="company[{$cmp_cnt}][job_title]" size="50" value="{job_title}"/>
                            <label for="job_desc"><h3 class="update_form">Job Description:</h3></label>
                            <input type="text" id="job_desc" name="company[{$cmp_cnt}][job_desc]" size="100" value="{job_desc}"/>
                            <input type="hidden" id="company_id" name="company[{$cmp_cnt}][company_id]" size="50" value="{@co_id}"/>
                            <label for="job_desc"><h3 class="update_form">Details:</h3></label>
                            <xsl:apply-templates select="details">
                                <xsl:with-param name="cmp_cnt" select="$cmp_cnt"/>
                            </xsl:apply-templates>
                        </form>
                        <hr class="new3"/>
                    </xsl:for-each>
           </body>
        </html>
    </xsl:template>
    <xsl:template match="details">
        <xsl:param name="cmp_cnt"/>
        <xsl:for-each select="*">
            <xsl:if test="(./@type = 'bp')">
                <input type="details" id="details" name="company[{$cmp_cnt}][job_desc][bp]" size="150" value="{.}" />
            </xsl:if>
            <xsl:if test="(./@type = 'pp')">
                <input type="details" id="details" name="company[{$cmp_cnt}][job_desc][pp]" size="150" value="{.}" />
            </xsl:if>
            <xsl:if test="(./@type = 'kw')">
                <input type="details" id="details" name="company[{$cmp_cnt}]][job_desc][kw]" size="150" value="{.}" />
            </xsl:if>
        </xsl:for-each>
        <input class="button" type="submit" onclick="push()" value="Update" />
        <input class="button" type="submit" value="Done" />
    </xsl:template>
</xsl:stylesheet>