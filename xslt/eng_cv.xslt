<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="../css_drafts/grid_cv_eng.css"/>
      </head>
      <body>
        <div class="container0">
          <xsl:for-each select="resume/contact_info">
            <div class="resume_eng_tp">
              <div class="name">
                <xsl:value-of select="name"/>
              </div>
              <div class="address_1">
                <xsl:value-of select="address_1"/>
              </div>
              <div class="address_2">
                <xsl:value-of select="address_2"/>
              </div>
              <div class="address_3">
                <xsl:value-of select="address_3"/>
              </div>
              <div class="email">
                <xsl:value-of select="email"/>
              </div>
              <!--<div class="sns_links">linkedin_email / github </div>-->
            </div>
          </xsl:for-each>
        </div>
        <hr/>
        <div class="container1">
          <xsl:for-each select="resume">
            <div class="resume_eng_motive">
              <div class="prof_motive_title">Motives</div>
              <div class="prof_motive">
                <xsl:value-of select="professional_interests"/>
              </div>
            </div>
          </xsl:for-each>
        </div>
        <div class="container2">
          <xsl:for-each select="resume/experience/company">
            <xsl:if test="position() = 1">
              <div class="resume_eng_exp">
                <div class="prof_exp_title">Highlights: Recent Projects</div>
                <div class="prof_exp_co_name">
                  <xsl:value-of select="c_name"/>
                </div>
                <div class="prof_exp_position">
                  <xsl:value-of select="job_title"/>
                </div>
                <div class="prof_exp_co_location">
                  <xsl:value-of select="location"/>
                </div>
                <div class="prof_exp_dates">
                  <xsl:value-of select="dates"/>
                </div>
                <div class="prof_exp_paragraph_desc">
                  <xsl:value-of select="job_desc"/>
                </div>
                <div class="prof_exp_paragraph_det">
                  <xsl:apply-templates select="details"/>
                </div>
                <div class="prof_exp_paragraph_note">
                  <xsl:value-of select="note"/>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
        <div class="container3">
          <xsl:for-each select="resume/experience/company">
            <xsl:if test="position() &gt; 1 and position() &lt; 7">
              <div class="resume_eng_exp_cont">
                <div class="prof_exp_title"/>
                <div class="prof_exp_co_name">
                  <xsl:value-of select="c_name"/>
                </div>
                <div class="prof_exp_position"><xsl:value-of select="job_title"/> - <xsl:value-of select="location"/></div>
                <div class="prof_exp_co_location"/>
                <div class="prof_exp_hr_agency_location">
                  <xsl:value-of select="hr_agency_loc"/>
                </div>
                <div class="prof_exp_dates">
                  <xsl:value-of select="dates"/>
                </div>
                <div class="prof_exp_paragraph_desc">
                  <xsl:value-of select="job_desc"/>
                </div>
                <div class="prof_exp_paragraph_det">
                  <xsl:apply-templates select="details"/>
                </div>
                <div class="prof_exp_paragraph_note">
                  <xsl:value-of select="note"/>
                </div>
              </div>
            </xsl:if>
          </xsl:for-each>
        </div>
        <div class="container4">
          <div class="education">
            <div class="education_title">Education</div>
            <xsl:for-each select="resume">
              <xsl:apply-templates select="education"/>
            </xsl:for-each>
          </div>
        </div>
        <div class="container5">
          <div class="short_experience">
            <div class="prof_exp_short_title">Additional Experience</div>
            <div class="prof_exp_short_title_sub">Enumerated List: Projects in Chronological Order (2000 – 2012)</div>
            <ol class="short_exp_lst">
              <xsl:for-each select="resume/experience/company">
                <xsl:if test="position() &gt; 6">
                  <li><!--<div class="prof_exp_short"><xsl:apply-templates select="add_exp_short"/></div>--><span class="c_name_color_style"><xsl:value-of select="c_name"/></span>, 
					<xsl:value-of select="location"/>: 
					<xsl:value-of select="job_desc"/>•
					<xsl:value-of select="job_title"/>•
					<xsl:value-of select="dates"/>
	</li>
                </xsl:if>
              </xsl:for-each>
            </ol>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="details">
    <ul class="b-point">
      <xsl:for-each select="*">
        <xsl:if test="(./@type = 'bp')">
          <li>
            <xsl:value-of select="."/>
          </li>
        </xsl:if>
        <ul class="sbp-point">
          <xsl:if test="(./@type = 'sbp')">
            <li>
              <xsl:value-of select="."/>
            </li>
          </xsl:if>
        </ul>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="add_exp_short">
    <ul class="short_exp_lst">
      <xsl:for-each select="*">
        <li>
          <xsl:value-of select="."/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="education">
    <ul class="edu_lst">
      <xsl:for-each select="*">
        <xsl:if test="position() &gt; 1">
          <li>
            <xsl:value-of select="."/>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
