<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="../cv_resume.css" />
			</head>
			<body>
				<h1>職 務 経 歴 書</h1>
				<table class="preamble">
					<tr>
						<p class="name-date">
							2020年11月9日現在
						</p>
					</tr>
					<tr>
						<p class="name-date">
							氏名 ベンサム・ポール　
						</p>
					</tr>
					<tr>
						<p class="overview">
							■職務要約
							入社後約x年間は、スタッフとして来校者への入学の案内・継続契約の案内を主に任されておりました。そこでは、顧客との折衝力・信頼構築力を身につけることが出来ました。
							その後現在に至るまでの約×年間は、拠点責任者として複数校の管理・運営に従事しております。そこでは、業績の管理、メンバーの育成を通し、マネジメント力を身につけることが出来ました。
						</p>
					</tr>
				</table>

				<h2>
					■職務経歴
				</h2>
				<xsl:for-each select="resume/experience/company">
					<table border="1">
						<thead>
							<!-- Row A <xsl:value-of select="c_name"/> -->
							<tr class="head">
								<th colspan="3">
									<xsl:value-of select="dates" />
									<xsl:value-of select="c_name" />
								</th>
							</tr>
						</thead>
						<tbody>
							<!-- Row B -->
							<tr class="jigyou-emp-status">
								<td colspan="2">
									事業内容：
									<xsl:value-of select="location" />
								</td>
								<td style="width:100px">
									<xsl:value-of select="substring(c_name,1,4)" />
									社員として勤務
								</td>
							</tr>
							<!-- Row C -->
							<tr class="sub-head">
								<td style="width:110px; text-align:center">期間</td>
								<td style="text-align:center" colspan="2">職務内容</td>
							</tr>
							<!-- Row D -->
							<tr class="date-position">
								<td rowspan="2">
									<xsl:value-of select="dates" />
								</td>
								<td colspan="2">
									<xsl:value-of select="job_title" />
								</td>
							</tr>
							<!-- Row E -->
							<tr class="jisseki">
								<td colspan="2">
									<xsl:apply-templates select="details" />
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:for-each>
				<p class="pr">
					■自己ＰＲ
					【1】
					顧客ニーズのヒアリング、掘り下げから各ニーズに合わせた提案を競合他社との比較をしながら、行うことができます。また、さまざまな世代の顧客に対し、購入意思決定までのストーリー展開を組み立てることが出来ます。
					【2】 在籍生徒からの信頼を維持し、顧客満足を獲得するための柔軟な対応と提案、こちらの出来ること、出来ないことを伝え、納
					得して頂く術を持っております。
					【3】
					トラブル等による顧客のクレームに対し、誠意を持って対応することで問題を解決する経験を多く積んでおります。
					【4】
					マネジメント経験から人を育てる喜びを学びました。身に付けたスキルをわかりやすく教え、できるまで練習にて落とし込
					　　み、結果を出す経験を積んできました。今後のキャリア形成に大きく役立てることができると考えております。
				</p>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="details">
		<ul style="list-style-type:none">
			<xsl:for-each select="*">
				<xsl:if test="(./@type = 'bp')">
					<!-- <li><xsl:value-of select="./@type" /></li> -->
					<li>
						<xsl:value-of select="." />
					</li>
				</xsl:if>
				<xsl:if test="(./@type = 'pp')">
					<!-- <li><xsl:value-of select="./@type" /></li> -->
					<li>
						<p>
							<xsl:value-of select="." />
						</p>
					</li>
				</xsl:if>
				<xsl:if test="(./@type = 'kw')">
					<!-- <li><xsl:value-of select="./@type" /></li> -->
					<li>
						<p>
							<xsl:value-of select="." />
						</p>
					</li>
				</xsl:if>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:stylesheet>