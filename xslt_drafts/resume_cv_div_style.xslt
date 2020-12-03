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
                        <p class="exp_overview_p">日英堪能のITプロとして、キャリアの次のステージへ進めていく覚悟ができています。情報提供のシステム・プラットフォームの効率化やスケールアップの過程で、一流企業が直面する課題に対応するためにチームを率いていくという、より総合的な役割にシフトしていくことは、私の興味と強みを活かせる仕事だと思います。
			</p>
			<p class="exp_overview_p">
現在までの経験・経歴がどういう内容であるかというと、2014年6月より2018年下旬にかけて4年間弱、日本の三大銀行のそれぞれの米拠点らにPM兼BAとして携わっていました。採用形態はいつも「契約社員」として活動し、そして「プロジェクト」という範囲で参加させてもらいました。殆ど例外なく入らせてもらったきっかけはソフト開発循環の結合テストの時期にたどり付き、人材ニーズが一番ピークとなっている期間であるから、タイミング的に私みたいな英日堪能兼情報システムの幅広い知識のあるタイプの人材が特に役に立てるかと思います。
			</p>
			<p class="exp_overview_p">
結合テストは理想条件を想定するうえ、エンドツーエンドにて導入したソリューションの動作を総括的にチェックすることです。その中の私の実績は主にトリアージ会議などの対処のコーディネーターとしての責任立場を以て、ソリューションが定められた条件を満たす確認をすることと、あらゆるトラブルが発生した場合には、同トラブルを円滑に解消・解決するためのリーダシップを発揮することでした。
			</p>
                        <h3>■職務経歴</h3>
                        <ul class="exp_lst_intro">
                            <li>個人営業に関する経験　通算20年</li>
                            <li>マネジメントに関する経験　通算3年6カ月</li>
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
