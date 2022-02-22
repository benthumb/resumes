<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet" href="../css_drafts/cv_grid.css"/>
            </head>
            <body>
                <div class="container0">
                    <xsl:for-each select="resume/contact_info">
                        <div class="resume_jpn_tp">
                            <div class="name_furigana">
				    <xsl:text>氏名（フリガナ）　</xsl:text><xsl:value-of select="name_furigana"/>
                            </div>
                            <div class="name_kanji">
                                <xsl:value-of select="name_kanji"/>
                            </div>
                            <div class="gender">
                                <xsl:value-of select="gender"/>
                            </div>
                            <div class="era">
                                <xsl:value-of select="era"/>
                            </div>
                            <div class="b_date">
                                <xsl:value-of select="b_date"/>
                            </div>
                            <div class="age">
				    <xsl:text>（S41)　満</xsl:text><xsl:value-of select="age"/><xsl:text>  歳</xsl:text>
                            </div>
                            <div class="addr_furigana">
                                <xsl:value-of select="addr_furigana"/>
                            </div>
                            <div class="zip_code">
                                <xsl:text>〒</xsl:text><xsl:value-of select="zip_code"/>
                            </div>
                            <div class="addr_kanji">
                                <xsl:value-of select="addr_kanji"/>
                            </div>
                            <div class="alt_addr_hometown_ph">
                                <xsl:text>その他の連絡先　（妻）| TEL </xsl:text><xsl:value-of select="alt_addr_hometown_ph"/>
                            </div>
                            <div class="alt_addr_hometown_kanji">
                                <xsl:value-of select="alt_addr_hometown_kanji"/>
                            </div>
                            <div class="home_ph">
                                <xsl:text>自宅（</xsl:text><xsl:value-of select="home_ph"/><xsl:text>）</xsl:text>
                            </div>
                            <div class="fax">
                                <xsl:text>F A X（</xsl:text><xsl:value-of select="fax"/><xsl:text>）</xsl:text>
                            </div>
                            <div class="ans_svs_bool">
                                <xsl:text>留守電: </xsl:text><xsl:value-of select="ans_svs_bool"/>
                            </div>
                            <div class="family_msg_svs_bool">
                                <xsl:text>家族への伝言: </xsl:text><xsl:value-of select="family_msg_svs_bool"/>
                            </div>
                            <div class="employer_notify_bool">
                                <xsl:text>個人名での勤務先連絡: </xsl:text><xsl:value-of select="employer_notify_bool"/>
                            </div>
                            <div class="work_ph">
                                <xsl:text>勤務先（</xsl:text><xsl:value-of select="work_ph"/><xsl:text>）</xsl:text>
                            </div>
                            <div class="mobile_ph">
                                <xsl:text>携帯（</xsl:text><xsl:value-of select="mobile_ph"/><xsl:text>）</xsl:text>
                            </div>
                            <div class="email_hd">
                                <xsl:text>e-mail　アドレス</xsl:text>
                            </div>
                            <div class="email">
                                <xsl:value-of select="email"/>
                            </div>
			    <div class="headshot"><img src="id_picture_2.png" width="109" height="145"/></div>
                        </div>
                    </xsl:for-each>
                </div>
                <br></br>
                <div class="container1">
                    <xsl:for-each select="resume/contact_info">
                        <div class="resume_transport">
                            <div class="close_sta_line_h">最寄りの交通機関</div>
                            <div class="close_sta_line">
                                <xsl:value-of select="close_sta_line"/>
                            </div>
                            <div class="close_sta_line_dst">
                                <xsl:value-of select="close_sta_line_dst"/>
                            </div>
                            <div class="living_arr_h">住まい</div>
                            <div class="living_arr">
                                <xsl:value-of select="living_arr"/>
                            </div>
                            <div class="work_area_pref_h">希望 勤務地</div>
                            <div class="work_area_pref_h_exp">希望勤務地6つまで記載可。（転勤の可否も記載）</div>
                            <div class="work_area_pref">
                                <xsl:value-of select="work_area_pref"/>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <br></br>
                <div class="container2">
                    <div class="resume_education">
                            <div class="edu_hd">学歴</div>
                            <div class="edu_entry_date_hd">入学年月</div>
                            <div class="edu_grad_date_hd">卒業年月</div>
                        <xsl:for-each select="resume/education/school">
                            <xsl:if test="position() = 5">
                                <div class="edu_sch_name">
                                    <xsl:value-of select="s_name"/>
                                </div>
                                <div class="edu_entry_date">
                                    <xsl:value-of select="dates"/>
                                </div>
                                <div class="edu_grad_date">
                                    <xsl:text>2021年12月</xsl:text>
                                    <!--<xsl:value-of select="dates"/>-->
                                </div>
                            </xsl:if>
                            <xsl:if test="position() = 4">
                                <div class="edu_sch_name1">
                                    <xsl:value-of select="s_name"/>
                                </div>
                                <div class="edu_entry_date1">
                                    <xsl:value-of select="dates"/>
                                </div>
                                <div class="edu_grad_date1">
                                    <xsl:text>該当なし</xsl:text>
                                    <!--<xsl:value-of select="dates"/>-->
                                </div>
                            </xsl:if>
                            <xsl:if test="position() = 3">
                                <div class="edu_sch_name2">
                                    <xsl:value-of select="s_name"/>
                                </div>
                                <div class="edu_entry_date2">
                                    <xsl:value-of select="dates"/>
                                </div>
                                <div class="edu_grad_date2">
                                    <xsl:text>該当なし</xsl:text>
                                    <!--<xsl:value-of select="dates"/>-->
                                </div>
                            </xsl:if>
                        </xsl:for-each>
			<div class="edu_sch_name_hd">学校名・学部・学科名など（最終学歴から記入）</div>
			<div class="edu_notes_hd">備考（卒業や修士・博士論文などを記載）</div>
			<div class="edu_notes">
				<xsl:value-of select="resume/education/edu_notes"/>
			</div>
			<div class="edu_hobbies_hd">趣味・スポーツ</div>
			<div class="edu_hobbies">
				<xsl:value-of select="resume/education/edu_hobbies"/>
			</div>
                    </div>
                </div>
                <br></br>
                <div class="container3">
                    <xsl:for-each select="resume/rireki_certs_lang_lv">
                        <div class="resume_certs_language">
                            <!-- COLUMNS 1 - 3 START -->
                            <div class="cert_hd">資格</div>
                            <div class="cert_std_auto_lic_bool">
                                <xsl:value-of select="cert_std_auto_lic_bool"/>
                            </div>
                            <div class="cert_name_sub_hd">資格名</div>
                            <div class="cert_date_hd">取得年月</div>
                            <div class="cert_name1">
                                <xsl:value-of select="cert_name1"/>
                            </div>
                            <div class="cert_name1_date">
                                <xsl:value-of select="cert_name1_date"/>
                            </div>
                            <div class="cert_name2">
                                <xsl:value-of select="cert_name2"/>
                            </div>
                            <div class="cert_name2_date">
                                <xsl:value-of select="cert_name2_date"/>
                            </div>
                            <div class="cert_name3">
                                <xsl:value-of select="cert_name3"/>
                            </div>
                            <div class="cert_name3_date">
                                <xsl:value-of select="cert_name3_date"/>
                            </div>
                            <div class="cert_name4">
                                <xsl:value-of select="cert_name4"/>
                            </div>
                            <div class="cert_name4_date">
                                <xsl:value-of select="cert_name4_date"/>
                            </div>
                            <div class="family_struct_hd">家族構成</div>
                            <div class="family_struct">
                                <xsl:value-of select="family_struct"/>
                            </div>
                            <!-- COLUMNS 1 - 3 END -->
                            <!-- COLUMNS 4 - 11 START -->
                            <div class="lang_hd">語学</div>
                            <div class="lang_eng_sub_hd">英語</div>
                            <div class="lang_eng_level_hd">レベル</div>
                            <div class="lang_eng_level">
                                <xsl:value-of select="lang_eng_level"/>
                            </div>
                            <div class="lang_eng_toeic">
                                <xsl:value-of select="lang_eng_toeic"/>
                            </div>
                            <div class="lang_eng_toefl_pbt">
                                <xsl:value-of select="lang_eng_toefl_pbt"/>
                            </div>
                            <div class="lang_eng_toefl_ibt">
                                <xsl:value-of select="lang_eng_toefl_ibt"/>
                            </div>
                            <div class="lang_eng_biz_exp">
                                <xsl:value-of select="lang_eng_biz_exp"/>
                            </div>
                            <div class="lang_eng_read_comp_hd">文章・マニュアル解読</div>
                            <div class="lang_eng_read_comp">
                                <xsl:value-of select="lang_eng_read_comp"/>
                            </div>
                            <div class="lang_eng_phone_hd">電話での会話</div>
                            <div class="lang_eng_phone">
                                <xsl:value-of select="lang_eng_phone"/>
                            </div>
                            <div class="lang_eng_sales_neg_hd">英語での商談・交渉</div>
                            <div class="lang_eng_sales_neg">
                                <xsl:value-of select="lang_eng_sales_neg"/>
                            </div>
                            <div class="lang_eng_email_hd">e-mailでのやり取り</div>
                            <div class="lang_eng_email">
                                <xsl:value-of select="lang_eng_email"/>
                            </div>
                            <div class="lang_eng_meeting_hd">英語での会議</div>
                            <div class="lang_eng_meeting">
                                <xsl:value-of select="lang_eng_meeting"/>
                            </div>
                            <div class="lang_eng_lived_abroad_hd">海外在住</div>
                            <div class="lang_eng_lived_abroad">
                                <xsl:value-of select="lang_eng_lived_abroad"/>
                            </div>
                            <div class="lang_other_sub_hd">その他語学</div>
                            <div class="lang_other_lang1">
                                <xsl:value-of select="lang_other_lang1"/>
                            </div>
                            <div class="lang_other_lang1_level_hd">レベル</div>
                            <div class="lang_other_lang1_level">
                                <xsl:value-of select="lang_other_lang1_level"/>
                            </div>
                            <div class="lang_other_lang2">
                                <xsl:value-of select="lang_other_lang2"/>
                            </div>
                            <div class="lang_other_lang2_level_hd">レベル</div>
                            <div class="lang_other_lang2_level">
                                <xsl:value-of select="lang_other_lang2_level"/>
                            </div>
                            <!-- COLUMNS 4 - 11 END -->
                        </div>
                    </xsl:for-each>
                </div>
                <br></br>
                <div class="container4">
                    <div class="resume_employment">
                        <xsl:for-each select="resume/experience/company">
                            <xsl:if test="position() &lt; 4">
                                <xsl:if test="position() = 1">
                                    <!-- COLUMNS 1 - 4 START -->
                                    <div class="emp_co_name_hd">会社名</div>
                                    <div class="emp_co_name">
                                        <xsl:value-of select="c_name"/>
                                    </div>
                                    <div class="emp_co_industry_feat_hd">企業特性</div>
                                    <div class="emp_co_industry_feat">
                                        <xsl:value-of select="emp_co_industry_feat"/>
                                    </div>
                                    <div class="emp_co_business_hd">事業内容</div>
                                    <div class="emp_co_business">
                                        <xsl:value-of select="emp_co_business"/>
                                    </div>
                                    <div class="emp_co_no_emp_hd">従業員数</div>
                                    <div class="emp_co_no_emp">
                                        <xsl:value-of select="emp_co_no_emp"/>
                                    </div>
                                    <div class="emp_co_work_term_hd">勤務期間</div>
                                    <div class="emp_co_work_term">
                                        <xsl:value-of select="dates"/>
                                    </div>
                                    <div class="emp_co_main_duties_hd">主な職務・役職</div>
                                    <!-- DETAILS -->
                                    <div class="emp_co_main_duties">
                                        <xsl:apply-templates select="details"/>
                                    </div>
                                    <!-- DETAILS -->
                                    <div class="emp_co_work_loc_hd">勤務地の最寄り駅</div>
                                    <div class="emp_co_work_loc">
                                        <xsl:value-of select="emp_co_work_loc"/>
                                    </div>
                                    <div class="emp_co_salary">
					    <xsl:text>給与：</xsl:text><xsl:value-of select="emp_co_salary"/>

                                    </div>
                                    <div class="emp_co_salary_add">
                                        <xsl:value-of select="emp_co_salary_add"/>
                                    </div>
                                    <div class="emp_co_housing_cost">
                                        <xsl:value-of select="emp_co_housing_cost"/>
                                    </div>
                                </xsl:if>
                                <!-- COLUMNS 1 - 4 END -->
                                <!-- COLUMNS 5 & 6 START -->
                                <xsl:if test="position() = 2">
                                    <div class="emp_co_name1">
                                        <xsl:value-of select="c_name"/>
                                    </div>
                                    <div class="emp_co_industry_feat_hd1">企業特性</div>
                                    <div class="emp_co_industry_feat1">
                                        <xsl:value-of select="emp_co_industry_feat"/>
                                    </div>
                                    <div class="emp_co_business1">
                                        <xsl:value-of select="emp_co_business"/>
                                    </div>
                                    <div class="emp_co_no_emp_hd1">従業員数</div>
                                    <div class="emp_co_no_emp1">
                                        <xsl:value-of select="emp_co_no_emp"/>
                                    </div>
                                    <div class="emp_co_work_term1">
                                        <xsl:value-of select="dates"/>
                                    </div>
                                    <div class="emp_co_main_duties1">
                                        <xsl:apply-templates select="details"/>
                                    </div>
                                    <div class="emp_co_salary1">
                                        <xsl:text>給与：</xsl:text><xsl:value-of select="emp_co_salary"/><xsl:text>・顧客：</xsl:text><xsl:value-of select="c_location"/>
                                    </div>
                                    <div class="emp_co_notes_add_exp">
                                        <xsl:value-of select="emp_co_notes_add_exp"/>
                                    </div>
                                </xsl:if>
                                <!-- COLUMNS 5 & 6 END -->
                                <!-- COLUMNS 7 & 8 START -->
                                <xsl:if test="position() = 3">
                                    <div class="emp_co_name2">
                                        <xsl:value-of select="c_name"/>
                                    </div>
                                    <div class="emp_co_industry_feat_hd2">企業特性</div>
                                    <div class="emp_co_industry_feat2"><xsl:value-of select="emp_co_industry_feat"/>
                                    </div>
                                    <div class="emp_co_business2"><xsl:value-of select="emp_co_business"/>
                                    </div>
                                    <div class="emp_co_no_emp_hd2">従業員数</div>
                                    <div class="emp_co_no_emp2"><xsl:value-of select="emp_co_no_emp"/>
                                    </div>
                                    <div class="emp_co_work_term2"><xsl:value-of select="dates"/>
                                    </div>
                                    <div class="emp_co_main_duties2">
                                        <xsl:apply-templates select="details"/>
                                    </div>
				    <div class="emp_co_salary2">
					    <xsl:text>給与：</xsl:text><xsl:value-of select="emp_co_salary"/><xsl:text>・顧客：</xsl:text><xsl:value-of select="c_location"/>
                                    </div>
                                    <!-- COLUMNS 7 & 8 END -->
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </div>
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
