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
                        <p class="date">2020年11月29日現在</p>
                        <p class="name">氏名　ベンサム　ポール</p>
                        <h3>■職務要約</h3>
                        <p class="exp_overview_p">入社後約x年間は、スタッフとして来校者への入学の案内・継続契約の案内を主に任されておりました。そこでは、顧客との折衝力・信頼構築力を身につけ、ブロック内MVPを2度獲得するなど、目標を超える成果を残しました。</p>
                        <p class="exp_overview_p">その後現在に至るまでの約×年間は、拠点責任者として複数校の管理・運営に従事しております。そこでは、業績の管理、メンバーの育成を通し、マネジメント力を身につけることが出来ました。</p>
                        <h3>■職務経歴</h3>
                        <ul class="exp_lst_intro">
                            <li>個人営業に関する経験　通算7年</li>
                            <li>マネジメントに関する経験　通算5年6カ月</li>
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
                    <div class="resume_jpn_pr">
                        <h3>■自己ＰＲ</h3>
                        <p class="li_pr">【1】 顧客ニーズのヒアリング、掘り下げから各ニーズに合わせた提案を競合他社との比較をしながら、行うことができます。また、さまざまな世代の顧客に対し、購入意思決定までのストーリー展開を組み立てることが出来ます。</p>
                        <p class="li_pr">【2】 在籍生徒からの信頼を維持し、顧客満足を獲得するための柔軟な対応と提案、こちらの出来ること、出来ないことを伝え、納
                        得して頂く術を持っております。</p>
                        <p class="li_pr">【3】 トラブル等による顧客のクレームに対し、誠意を持って対応することで問題を解決する経験を多く積んでおります。</p>
                        <p class="li_pr">【4】 マネジメント経験から人を育てる喜びを学びました。身に付けたスキルをわかりやすく教え、できるまで練習にて落とし込
                        　　み、結果を出す経験を積んできました。今後のキャリア形成に大きく役立てることができると考えております。</p>
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