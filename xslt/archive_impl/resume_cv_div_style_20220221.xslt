<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../css_drafts/grid_style.css"/>
            </head>
            <body>
                <div class="container0">
                    <div class="resume_jpn_intro">
                        <h1 class="title">職務経歴書</h1>
                        <p class="date">2022年2月21日現在</p>
                        <p class="name">氏名　ベンサム　ポール</p>
                        <h3>■職務要約</h3>
                    <xsl:for-each select="resume">
			<xsl:value-of select="front_matter"/>
		    </xsl:for-each>
                        <h3>■職務経歴</h3>
                        <ul class="exp_lst_intro">
                            <li>個人営業に関する経験　通算22年</li>
                            <li>マネジメントに関する経験　通算6年</li>
                        </ul>
                        <h3>■職務内容の詳細</h3>
                    </div>
                </div>
                <div class="container">
                    <xsl:for-each select="resume/experience/company">
                        <div class="resume_jpn_tp">
                            <div class="exp_heading">
                                <xsl:value-of select="dates"/>
                                <xsl:value-of select="c_name"/>
                            </div>
                            <div class="business_type">
				    <xsl:text>［顧客］事務所・所在地：</xsl:text><xsl:value-of select="c_location"/>
				<br></br>
                                 <xsl:text>事業内容：</xsl:text><xsl:value-of select="emp_co_business"/>
				 <br></br>
				 <xsl:text>URL：</xsl:text><xsl:value-of select="emp_url"/>
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
                                    <xsl:value-of select="job_desc"/>
                                </div>
                                <div class="emp_details">
                                    <xsl:apply-templates select="details"/>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <div class="container01">
			<!--<div class="resume_jpn_pr">
                        <h3>■自己紹介:付加のドキュメント「jikoshokai_rireki.pdf」をご参照ください。</h3>
			</div>-->
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="details">
        <ul>
            <xsl:for-each select="*">
                <xsl:if test="(./@type = 'bp')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <li class="b-point">
                        <xsl:value-of select="."/>
                    </li>
                </xsl:if>
                <xsl:if test="(./@type = 'pp')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <li class="p-graph">
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </li>
                </xsl:if>
                <xsl:if test="(./@type = 'kw')">
                    <!-- <li><xsl:value-of select="./@type" /></li> -->
                    <li class="p-graph">
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </li>
                </xsl:if>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
