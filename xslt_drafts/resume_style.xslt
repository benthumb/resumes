<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>職務経歴書</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th style="text-align:left">会社名</th>
                        <th style="text-align:left">勤務期間</th>
                    </tr>
                    <tr>
                        <td>
                        <xsl:apply-templates select="company/details" />
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="details" >
            <xsl:for-each select="*">
                <xsl:if test="(./@type = 'bp')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                   <ul><li><xsl:value-of select="." /></li></ul>
                </xsl:if>
                <xsl:if test="(./@type = 'pp')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <p><xsl:value-of select="." /></p>
                </xsl:if>
                <xsl:if test="(./@type = 'kw')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <p><xsl:value-of select="." /></p>
                </xsl:if>
            </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>