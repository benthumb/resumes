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
                        <p class="date">2021年11月29日現在</p>
                        <p class="name">氏名　ベンサム　ポール</p>
                        <h3>■職務要約</h3>
                        <p class="exp_overview_p">
日本企業は、仲間の先進諸国と比較して「DX」及びディジタル化がろくに進んでいなく遅れを取っていることは最近よくニュースで取り上げられた懸念課題となっています。ハードウェアの最先端技術を生産する日本は世界トップクラスの位置づけを誇る一方、他方では、ソフトウェア及び情報システム化は比較的にイノベーションを発揮させない、貧弱なレベルであり続けるとの印象があるのは余儀のないことだと思います。
                        </p>
                        <p class="exp_overview_p">
現在でもつづく大量の紙媒体の情報生産を配慮すると、情報をディジタル化したうえで、同情報配信の賢いシステム化は日本なら当然ながらできることです。多少でも問題の視点を変えて、要するにDXよりIX（情報化）の方に重点をおくこと、大局観が取り戻す事とともに本当に意味のある目標設定が可能となるのです。不適切の情報の扱い及びデータの不整理の所為でストラクチャードクエリーなどによる、組織横断の情報検索・知識取得などを不可能にされる情報システムの誤った仕組は改善すべき多くの日本企業の現状です。信じがたいことにこちらの個人体験から語る限り、エクセルをデータベースとして乱用する大手法人はまだ存在しています。
                        </p>
                        <p class="exp_overview_p">
とはいえ会社で働く人間たちと会社の経営を担当する人たちには「情報」はどういうものかを十分理解しないと同現状の改善を期待することはやはり無理です。情報漏れを防ぐための教育を行うことを拘る会社は少なくはない一方では、その他方、DXした情報は現代社会の知識構築にはどういう役割を果たしているか、明らかに十分把握していないようです。WYSIWYGのエディターの拡散と電子スプレッドシートをデータベースとしての人の捉えがちのお陰で、適切な情報管理が分からない人が多いです。
                        </p>
                        <p class="exp_overview_p">
適切な情報管理のことになると、去年スタートしたプロジェクトを例えると、第一に情報の形式と内容をできる限り切り離して扱った枠組みを作ることです。この履歴書・職務経歴書の作成にあたって、20年間余りの経験内容をその必要に応じて柔軟にフォーマットを変換できるよう、ドキュメント形式変換エンジンのシステム設計・実装を取り組んでいる最中です。概念を詳しく説明した資料・追記の当ドキュメントの最後のページへご参照ください。
                        </p>
                        <p class="exp_overview_p">
ついに日英堪能のITプロとして、次のステージのキャリアへ進んでいく覚悟ができています。情報提供のシステム・プラットフォームの効率化やスケールアップの過程で、一流企業が直面する課題に対応するためにチームを率いていくという、より総合的な役割にシフトしていくことは、私の興味と強みを活かせる仕事だと思います。
                        </p>

                        <h3>■職務経歴</h3>
                        <ul class="exp_lst_intro">
                            <li>個人営業に関する経験　通算21年</li>
                            <li>マネジメントに関する経験　通算4年</li>
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
