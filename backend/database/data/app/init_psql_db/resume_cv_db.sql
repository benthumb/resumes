--select 'create database resume' where not exists (select from pg_database where datname = 'resume');

create database resume;

\c resume

create table if not exists front_matter(
ID integer PRIMARY KEY NOT NULL,
exp_desc text,
exp_desc_date varchar,
job_ref_title varchar,
job_short_nm varchar,
job_duties_desc text,
emp_agency varchar,
agent_nm varchar
);

create table if not exists xml_cv(
ID integer PRIMARY KEY NOT NULL,
xml_cv_ctnt xml,
ver_date varchar
);

create table if not exists contact_info(
ID integer PRIMARY KEY NOT NULL,
name	varchar,
name_furigana	varchar,
name_kanji	varchar,
gender	varchar,
b_date	varchar,
era	varchar,
age	varchar,
addr_furigana	varchar,
zip_code	varchar,
addr_kanji	varchar,
alt_addr_hometown_ph	varchar,
alt_addr_hometown_kanji	varchar,
home_ph	varchar,
fax	varchar,
ans_svs_bool	varchar,
family_msg_svs_bool	varchar,
employer_notify_bool	varchar,
work_ph	varchar,
mobile_ph	varchar,
email	varchar,
website	varchar,
address	varchar,
close_sta_line	varchar,
close_sta_line_dst	varchar,
living_arr	varchar,
work_area_pref	varchar
);

INSERT INTO contact_info VALUES (50000,'Paul Bentham','ベンサム　ポール','ベンサム　ポール','男','1966年9月12日','西暦','54','サイタマケンハスダシニシシンシュク2−11−6','349-0141','埼玉県蓮田市西新宿２−１１−６','090-1258-7760','住所：同上','048-769-6780','該当なし','🈶','🉑','🔥','該当なし','080-7588-8738','pablo@benthumb.org','https://github.com/benthumb/','〒349-0141 埼玉県蓮田市西新宿 2-11-6','宇都宮線　蓮田駅','自転車・バス　10分','家族と同居','東京 (23区) 東京 (23区外) 埼玉県　条件次第');

create table if not exists rireki_certs_lang_lv(
ID integer PRIMARY KEY NOT NULL,
cert_std_auto_lic_bool	varchar,
cert_name1	varchar,
cert_name1_date	varchar,
cert_name2	varchar,
cert_name2_date	varchar,
cert_name3	varchar,
cert_name3_date	varchar,
cert_name4	varchar,
cert_name4_date	varchar,
family_struct	varchar,
lang_eng_level	varchar,
lang_eng_toeic	varchar,
lang_eng_toefl_pbt	varchar,
lang_eng_toefl_ibt	varchar,
lang_eng_biz_company	varchar,
lang_eng_read_comp	varchar,
lang_eng_phone	varchar,
lang_eng_sales_neg	varchar,
lang_eng_email	varchar,
lang_eng_meeting	varchar,
lang_eng_lived_abroad	varchar,
lang_other_lang1	varchar,
lang_other_lang1_level	varchar,
lang_other_lang2	varchar,
lang_other_lang2_level	varchar
);

INSERT INTO rireki_certs_lang_lv VALUES ('10000','普通自動車免許 ：無','日本語能力試験：N1','2010','--','--','--','--','--','--','配偶者　　🈶　　扶養家族　　2','初等・中等・㊤等','TOEIC: 該当なし','TOEFL(PBT): 該当なし','TOEFL(IBT): 該当なし','ビジネス経験: 20年','🈶・無','🈶・無','🈶・無','🈶・無','🈶・無','🈶・無','日本語','初等・中等・㊤等','--','初等・中等・上等');

create table if not exists school(
ID serial primary key,
s_name	varchar,
dates	varchar,
major	varchar,
degree	varchar
);

INSERT INTO school (s_name, dates, major, degree) VALUES ('ハーバード・サマー・スクールの日本語講座・初級レベル','1986年7月-8月','','');
INSERT INTO school (s_name, dates, major, degree) VALUES ('コロンビア大学の日本語講座・中級、上級レベル達成','1987年9月-1989年6月','','');
INSERT INTO school (s_name, dates, major, degree) VALUES ('ロング・アイランド大学・Friends World College東アジアセンター・京都','1990年1月-1991年6月','','');
INSERT INTO school (s_name, dates, major, degree) VALUES ('コロンビア大学・School of General Studies・英作文','1996年1月-1998年6月','','');
INSERT INTO school (s_name, dates, major, degree) VALUES ('メリ-ランド大学・Global Campus・コンピュータ・サイエンス','2010年7月-現在','','');

CREATE TABLE company(
co_id integer PRIMARY KEY NOT NULL,
c_name	varchar,
c_location	varchar,
emp_url	varchar,
dates	varchar,
job_title	varchar,
job_desc	varchar,
emp_co_industry_feat	varchar,
emp_co_business	varchar,
emp_co_no_emp	varchar,
emp_co_work_term	varchar,
emp_co_salary	varchar,
emp_co_salary_add	varchar,
emp_co_housing_cost	varchar,
emp_co_work_loc	varchar
);

INSERT INTO company VALUES ('909670','[FL]Burnwood Enterprises, Inc.','ニューヨーク州','該当なし','2018年12月-現在','遺言執行者及びPM担当。','-- 不動産会社に向けて遺品整理','該当なし','該当なし','該当なし','該当なし','該当なし','残業などの手当:該当なし','寮・社宅などの自己負担:該当なし','該当なし');
INSERT INTO company VALUES ('995626','[契約] NSD International, Inc.','[MUFG]ジャージーシティー','nsd.co.jp','2018年8月-2018年11月（四ヶ月）','BA担当。','-- AML（マネーロンダリング対策）システムの内部審査','上場','システム分析・設計の受託、プログラム開発及び受託、コンピュータ室運営管理、ソフトウエアプロダクト:売上高 65,063百万円（連結） [2020年3月期]','3,467名','四ヶ月','130万円/月','残業などの手当:該当なし','寮・社宅などの自己負担:該当なし','該当なし');
INSERT INTO company VALUES ('327920','[契約] NSD International, Inc.','[SMBC]ニューヨーク市','nsd.co.jp','2018年2月-2018年7月（六ヶ月）','PM担当。','-- カナダ支店のグローバル決済システム更改;フェドワイヤー取引の直接加盟への移行','上場','システム分析・設計の受託、プログラム開発及び受託、コンピュータ室運営管理、ソフトウエアプロダクト:売上高 65,063百万円（連結） [2020年3月期]','3,467名','六ヶ月','100万円/月','残業などの手当:該当なし','寮・社宅などの自己負担:該当なし','該当なし');
INSERT INTO company VALUES ('969238','[契約] NSD International, Inc.','[Mizuho]ジャージーシティー','nsd.co.jp','2017年3月-2017年10月（八ヶ月）','PM担当。','-- 持株会社のFR-Y9Cおよび2052aレポートシステムの次期リリース開発','上場','システム分析・設計の受託、プログラム開発及び受託、コンピュータ室運営管理、ソフトウエアプロダクト:売上高 65,063百万円（連結） [2020年3月期]','3,467名','八ヶ月','110万円/月','残業などの手当:該当なし','寮・社宅などの自己負担:該当なし','該当なし');
INSERT INTO company VALUES ('643993','[契約] NSD International, Inc.','[MUFG]ジャージーシティー','nsd.co.jp','2016年5月-2016年9月（五ヶ月）','PM担当。','-- メインフレーム・デコミッション・プロジェクト','上場','システム分析・設計の受託、プログラム開発及び受託、コンピュータ室運営管理、ソフトウエアプロダクト:売上高 65,063百万円（連結） [2020年3月期]','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('375198','[契約] NSD International, Inc.','[MUFG]ジャージーシティー','nsd.co.jp','2014年6月-2015年10月（一年四ヶ月）','PM担当。','-- 記帳システム更改プロジェクト','上場','システム分析・設計の受託、プログラム開発及び受託、コンピュータ室運営管理、ソフトウエアプロダクト:売上高 65,063百万円（連結） [2020年3月期]','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('397560','[FL] firewallconsultants.com','シアトル市','firewallconsultants.com','2013年1月-2013年3月（三ヶ月）','SE担当。','-- 情報システムセキュリティーのポータルサイト開発','上場','ITセキュリティ','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('808221','[契約] PSP(Pacific Software Publishing)','シアトル市','pspinc.com','2012年7月-2012年11月（四ヶ月）','SE担当。','-- 過渡期のシステム運用','上場','ソフトウェア設計・開発会社として、企業のコスト削減及び収益の拡大を支援します。コンセプトから最終製品まで。','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('678534','[FL] ITTO(International Tropical Timber Organization)','東京','itto.int','2010年1月-2011年1月（一年）','SE担当。','-- 写真ライフラリーのシステム更新及びデータ移行プロジェクト','上場','国際熱帯木材機関（ ITTO ）は熱帯林資源の保全と持続可能な経営、利用、そして持続的かつ合法的に管理された熱帯木材資源の貿易拡大と多角化を促進している政府間組織です。','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('863710','[契約] UDトラックス株式会社','上尾・大宮埼玉','udtrucks.com','2008年12月-2009年8月（九ヶ月）','SE担当。','-- テレマティックス・システムの移行及び更新プロジェクト','上場','大型トラックの開発・生産・輸出・販売、中・小型トラックの販売、自動車用部品の製造・販売、トラック・バスの整備・補修部品などの販売、ボルボ・ブランド製品の輸入・販売','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('728208','[契約] 国際テクノロジーセンター','東京','ktcc.co.jp','2007年6月-2008年8月（一年二ヶ月）','新人のPGスタッフの育成指導','-- 法人顧客のワークフローシステム保守・改修・機能追加','上場','ITコンサルティング、アプリケーション開発、インフラ構築、運用保守、エンジニアリングサービス、建設コンサルタント・DX推進化事業','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('563336','[FL] Bit Machines','該当なし','該当なし','2007年1月-2007年5月（五ヶ月）','脆弱性立証例開発','-- Javaサーブレットフレームワーク 「NetPath」とFLEXとのテクノロジー組み合わせの可能性を検討しつつ','上場','情報システム開発','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('928464','[契約] Nikon Systems, Inc.','横浜(日本)','www.nsi.nikon.com','2006年4月-2006年12月（九ヶ月）','要件アナリスト担当。','-- S7cワイヤレスカメラと同カメラの周辺「COOLPIX CONNECT」電子メール経由写真共有サービス開発','上場','ソフトウェア、ハードウェア、及びシステムの受託開発、パッケージ・ソフトウェアの開発、販売、システムの導入、保守及び運用・管理の受託、各種解析および解析シミュレーターの開発、テクニカルドキュメントの制作及び翻訳、情報システム開発: 資本金：5,000万円（株式会社ニコン100%出資）、売上高：9,955百万円（2019年度実績:）従業員数：473名（2020年4月1日現在）','473名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('702084','[契約] Recruit Media Communications','東京(日本)','rco.recruit.co.jp','2006年2月-2006年3月（一ヶ月半）','ウェブ上のコンテンツ管理システム開発','-- 進学情報のウェブサイトにおける','上場','リクルートグループにおいて、クライアントの集客ソリューションから、Webマーケティング、メディアの制作・流通・宣伝、カスタマーサポートまでを担当します: 資本金：一億円、従業員数：1007名（社員：762名　専門社員：159名　契約社員：69名　アルバイト：17名） ／2020年4月','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('923521','[FL] MG Technologies and Investment Ltd.','横浜(日本)','該当なし','2005年10月-2005年12月（二ヶ月）','SE/ウェブマスター担当。','-- 英語学校のウェブサイト・学習管理システム（Learning Management System/LMS)','上場','情報システム開発','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('036420','[契約] Forth Space Inc.・Sony PCL','東京(日本)','該当なし','2005年5月-2005年10月（五ヶ月）','SE担当。','-- SCORM*対応の学習管理システム開発','上場','情報システム開発','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('561436','[FL] Foundation World, Inc.','ニューヨーク市','foundationworld.com',': 2004年4月-2005年2月（十ヶ月）','SE/ウェブマスター担当。','-- CGアティストのPRウェブサイトの保守と更新およびコンテンツ・マネジメント','上場','ニューヨークと東京を中心に活動するクリエイティブプロダクションです。ワールドワイドなクライアント及びクリエイターと築いてきたネットワークと経験をもとに、広告や雑誌の撮影コーディネート、カルチャー／アート／ファッションをテーマにしたイベントの企画／運営、世界で活躍するクリエイティブなアーティストとクライアント間のコラボレーションプロジェクトも行っております。特に撮影コーディネイトではトップフォトグラファー、スーパーモデル、スタイリスト等のキャスティング及び、ニューヨークと東京を中心としたワールドワイドなロケーションハンティングも行い、これまでにファッション、コスメティックから自動車まで幅広いクライアントの皆様にご利用いただいています。','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('325071','[FL] NYC Lisp Users Group','ニューヨーク市','該当なし',': 2003年7月-2003年11月（五ヶ月）','PG・研究・企画担当。','-- ロボカップ・コンペのシミュレーションリーグ部門の入選チーム開発','上場','教育・非営利団体','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('471207','[FL] Arnold Information Technology','ニューヨーク市','該当なし',': 2003年5月-2003年6月（一ヶ月）','取材・執筆担当。','-- テクノロジーセクター市場専門の投資家に向けたリサーチレポート','上場','情報システム開発','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('221084','[契約] Lexelnet','ニューヨーク市','該当なし',': 2001年10月-2003年4月（一年半）','SE担当。','-- 翻訳サービスのオンライン市場の構築対応のウェブアプリケーションフレームワーク開発','上場','情報システム開発','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');
INSERT INTO company VALUES ('273556','[契約] Goldman Sachs','ニューヨーク市','goldmansachs.com',': 2000年8月-2001年8月（一年）','SE担当。','-- グローバル・リスク・マネジメントのシステム統合化プロジェクト','上場','ザ・ゴールドマン・サックス・グループ・インクは投資銀行業務、証券業務および投資運用業務を中心に企業、金融機関、政府機関、個人など多岐にわたるお客様を対象に幅広い金融サービスを提供している世界有数の金融機関です。1869年に創業、ニューヨークを本拠地として世界の主要な金融市場に拠点を擁しています。','1000名','10年','1000万円','残業手当','寮・社宅の自己負担　100万／月','該当なし');

create table if not exists company_det (
	co_id integer REFERENCES company(co_id),
	detail_ln varchar,
	type_ln varchar(2),
	ord_ln integer 
);

INSERT INTO company_det VALUES ('909670','不動産会社に向けて遺品整理、遺言執行者及びPM担当','bp','0');
INSERT INTO company_det VALUES ('909670','2013年から2019年にかけて、日本の銀行での活動とほぼ同時期を網羅した、賃貸物件(亡母の一部占めた資産) を所有する不動産会社(バーンウッド・エンタープライズ社) の清算プロジェクトの管理を担当しました。','bp','1');
INSERT INTO company_det VALUES ('909670','また、不動産資産の売却調整に加え、負債を棚卸し、返済計画を実施し、一般に事業の金融面の整理も行いました。','bp','2');
INSERT INTO company_det VALUES ('909670','同会社の営業中の時期に、私は家主とプロパティマネージャーとして携わり、新しい暖房システムやその他のインフラのアップグレードの購入と設置から修理のサービス申請への対応まで、その運営の日々の事務を処理しました。','bp','3');
INSERT INTO company_det VALUES ('909670','キーワード:諸利害関係者間の交渉、進捗状況の追跡・報告、プロジェクト・マネジメント、不動産管理、資産計画','kw','4');
INSERT INTO company_det VALUES ('995626','実績:','pp','0');
INSERT INTO company_det VALUES ('995626','AML（マネーロンダリング対策）システムの内部審査、BA担当。','pp','1');
INSERT INTO company_det VALUES ('995626','当行のグローバル・ペイ・プラス（GPP）との国際送金・決済代行システムとその関連のシステムらに対して、連銀の判断による制裁区分に入っている国々のペイメントの扱いがないことの徹底を審査したプロジェクト。','pp','2');
INSERT INTO company_det VALUES ('995626','審査の諸テストの実施、コーディネート、そしてその結果によってあとの調査も担当した。','bp','3');
INSERT INTO company_det VALUES ('995626','キーワード:諸利害関係者間の交渉、進捗状況の追跡・報告、GPP、審査、ペイメントシステム、決済、SWIFT電文、ログファイルの解析','kw','4');
INSERT INTO company_det VALUES ('327920','実績:','pp','0');
INSERT INTO company_det VALUES ('327920','下記のプロジェクトらに対してテスト実施の管理、進捗状況追跡、移行リハサールのコーディネート','pp','1');
INSERT INTO company_det VALUES ('327920','カナダ支店のグローバル決済システムのアップグレード (VGPSからJavaベースのJGPSへ)','bp','2');
INSERT INTO company_det VALUES ('327920','フェドワイヤー取引の直接加盟へのニューヨーク支店の加入・移行','bp','3');
INSERT INTO company_det VALUES ('327920','キーワード:諸利害関係者間の交渉、進捗状況の追跡・報告、品質保証、ペイメントシステム、決済、SWIFT電文、ログファイルの解析','kw','4');
INSERT INTO company_det VALUES ('969238','実績:','pp','0');
INSERT INTO company_det VALUES ('969238','持株会社のFR-Y9Cおよび2052aレポートシステムの次期リリース開発に対して、プロジェクト・マネジャーの役割範囲で','pp','1');
INSERT INTO company_det VALUES ('969238','受け入れテストのコーディネートと合わせて、','bp','2');
INSERT INTO company_det VALUES ('969238','進捗状況報告書とその他の否定形のプロジェクト進捗管理及びメトリクス・レポート作成','bp','3');
INSERT INTO company_det VALUES ('969238','システム開発上の問題解決・バグ修正などの作業のコーディネート','bp','4');
INSERT INTO company_det VALUES ('969238','キーワード:諸利害関係者との間の交渉、進捗状況の追跡・報告、品質保証','kw','5');
INSERT INTO company_det VALUES ('643993','実績:','pp','0');
INSERT INTO company_det VALUES ('643993','メインフレーム・デコミッション・プロジェクト：','pp','1');
INSERT INTO company_det VALUES ('643993','記帳システム更改プログラム及びOVSシステムの導入に伴い、旧メインフレーム・システムらを退役することが一つの目標。同目標に対して、下記の三つのプロジェクトらを担当した：','pp','2');
INSERT INTO company_det VALUES ('643993','データ保持サーバーへの旧システム・データベースの移行','pp','3');
INSERT INTO company_det VALUES ('643993','仮想テープライブラリという復旧インフラを西海岸及びユニオン銀行への引っ越しのコーディネート','pp','4');
INSERT INTO company_det VALUES ('643993','災害復旧のメインフレームのアップグレード','pp','5');
INSERT INTO company_det VALUES ('643993','キーワード:システム在地変更、災害復旧、データ保持、旧システムの退役','kw','6');
INSERT INTO company_det VALUES ('375198','実績:','pp','0');
INSERT INTO company_det VALUES ('375198','記帳システム更改：','pp','1');
INSERT INTO company_det VALUES ('375198','MUFGにおける「記帳システム更改」及びCore Banking Replacement（CBR）という5年計画の例のプログラムへの参加期間は実施最中の2014年よりプログラム完成にかけて1年半でした。プログラム傘下のプロジェクトらは14つの「商品トラック」として整理され、そうした中PMとの担当で以下の事務或いはプロジェクトに携わった。','pp','2');
INSERT INTO company_det VALUES ('375198','プログラム財務状況の監視: 予算或いは見積もりの見直しなどに対してのプロジェクト及び商品トラックの費用管理・追跡','bp','3');
INSERT INTO company_det VALUES ('375198','対顧客影響調査・システム検証: SWIFT電文のメッセージ形式変更に関するドキュメンテーション作成と検証テストのコーディネート','bp','4');
INSERT INTO company_det VALUES ('375198','CDL（中央ディレクトリー層：社員・顧客登録システム）基幹システムへとのインタフェースの受け入れ等各テスト工程のコーディネート','bp','5');
INSERT INTO company_det VALUES ('375198','キーワード:プロジェクトマネジメント、予算管理、対顧影響調査・システム検証、品質保証、ペイメントシステム、決済、SWIFT電文','kw','6');
INSERT INTO company_det VALUES ('397560','実績:','pp','0');
INSERT INTO company_det VALUES ('397560','コンテンツ作成：侵入テストなどに当たって情報自動収集のスクリプトの実装','bp','1');
INSERT INTO company_det VALUES ('397560','キーワード:システム設計・開発、Python(Beautiful Soupライブラリ）、テスト設計・実践','kw','2');
INSERT INTO company_det VALUES ('808221','実績:','pp','0');
INSERT INTO company_det VALUES ('808221','NOC（集中監視施設）にてシステム運用及び監視業務','pp','1');
INSERT INTO company_det VALUES ('808221','DNSレコード設定・管理、','bp','2');
INSERT INTO company_det VALUES ('808221','セキュリティー違反発生した場合への対応・調査・報告書作成、','bp','3');
INSERT INTO company_det VALUES ('808221','日本顧客のお問い合わせ窓口：英日翻訳・通訳、','bp','4');
INSERT INTO company_det VALUES ('808221','Perlのシェル・スクリプトによる手作業の自動化、','bp','5');
INSERT INTO company_det VALUES ('808221','SSLサーバー証明書管理、','bp','6');
INSERT INTO company_det VALUES ('808221','担当者離職の際、後継者向けの仕事内容のマニュアル化、','bp','7');
INSERT INTO company_det VALUES ('808221','新規採用者の研修の実施、','bp','8');
INSERT INTO company_det VALUES ('808221','システム仕様書作成','bp','9');
INSERT INTO company_det VALUES ('808221','キーワード:サーバー構築・運用、Linux、Perlなどのスクリプト言語によるシステム自動化、仕様書・ユーザーマニュアルなどのドキュメンテーション書類作成、プロジェクトマネジメント、プラットフォーム・システム更新及びデータ移行','kw','10');
INSERT INTO company_det VALUES ('678534','実績:','pp','0');
INSERT INTO company_det VALUES ('678534','MSアクセスからPicasaに画像アーカイブ及びライブラリーの移行を自動化。','pp','1');
INSERT INTO company_det VALUES ('678534','移行パスの設計・実装、','bp','2');
INSERT INTO company_det VALUES ('678534','ExifToolのコマンドラインツールを ユー に実装した、','bp','3');
INSERT INTO company_det VALUES ('678534','関係データを統合したXMLスキマの設計、','bp','4');
INSERT INTO company_det VALUES ('678534','ExifToolを利用した一括処理のルーチンの実装、','bp','5');
INSERT INTO company_det VALUES ('678534','プロファイラを使用して、性能を測る上、メモリの利用制限の課題分析を実施した','bp','6');
INSERT INTO company_det VALUES ('678534','キーワード:ExifTool, Perl, XML, XMLスキマ設計、プラットフォーム・システム更新及びデータ移行、プロジェクトマネジメント、受け入れテスト設計・実践','kw','7');
INSERT INTO company_det VALUES ('863710','実績:','pp','0');
INSERT INTO company_det VALUES ('863710','Javaベースのメッセージ・クライアントの開発に当たって','pp','1');
INSERT INTO company_det VALUES ('863710','単体・結合テストの実装に伴い、作業:・進捗状況報告書の作成、* ソリューション機能拡張の実装、バグ追跡・解消、','bp','2');
INSERT INTO company_det VALUES ('863710','Antビルド・ツールを利用し、動作環境自動配置スクリプトの実装','bp','3');
INSERT INTO company_det VALUES ('863710','海外ベンダーのソリューションをシステムに組むため、コーディネート支援','bp','4');
INSERT INTO company_det VALUES ('863710','ウェブ系のダッシュボードの開発に対して、','pp','5');
INSERT INTO company_det VALUES ('863710','表示画面の開発用のライブラリのフィーチャー棚卸・利用の説明、','bp','6');
INSERT INTO company_det VALUES ('863710','検索条件絞込みメニューなどの表示画面及びフロント・エンドの実装','bp','7');
INSERT INTO company_det VALUES ('863710','キーワード:JBoss, Spring, Struts/JSP, Ant, Eclipse, Java Messaging Service, Ibatis, JavaScript, プラットフォーム・システム更新及びデータ移行、プロジェクトマネジメント、テスト設計・実践','kw','8');
INSERT INTO company_det VALUES ('728208','実績:','pp','0');
INSERT INTO company_det VALUES ('728208','Java ベースのワーク・フロー・システムの保守、バグ追跡・修正、','bp','1');
INSERT INTO company_det VALUES ('728208','法人顧客に対して、ソフト開発効率化の上、版管理導入、','bp','2');
INSERT INTO company_det VALUES ('728208','新卒社員のため、オブジェクト指向的なプログラミングなどの教育指導、','bp','3');
INSERT INTO company_det VALUES ('728208','SaaS 形式の製品プロトタイプの実装、','bp','4');
INSERT INTO company_det VALUES ('728208','社内情報共有推進の上、「OpenPNE」 という SNS を導入した','bp','5');
INSERT INTO company_det VALUES ('728208','キーワード:Oracle, Postgres, MySQL, SQL, JDBC, ActionScript, JavaScript, Java/Servlets/JSP, XML, Tomcat, Apache, Linux,','kw','6');
INSERT INTO company_det VALUES ('728208','Subversion/CVS, Eclipse(all-in-one), Ant, Struts, FLEX, object-relational マッピングツール','pp','7');
INSERT INTO company_det VALUES ('563336','実績:','pp','0');
INSERT INTO company_det VALUES ('563336','上記のテクノロジーを基にした用語集の管理システムの実装','bp','1');
INSERT INTO company_det VALUES ('563336','キーワード:Postgres, SQL, JDBC, ActionScript, Java/Servlets, XML, Tomcat, Apache, Linux, Eclipse(all-in-one), NetPath, FLEX/Cairngorm','kw','2');
INSERT INTO company_det VALUES ('928464','実績:','pp','0');
INSERT INTO company_det VALUES ('928464','要件定義・ユースケースなどの仕様書の作成、','bp','1');
INSERT INTO company_det VALUES ('928464','ネットワーク診断ツールを利用し、接続障害発生時に原因究明、','bp','2');
INSERT INTO company_det VALUES ('928464','ウェブアプリの多国語化に対して、担当会社との反省会を実施した','bp','3');
INSERT INTO company_det VALUES ('928464','受け入れテストの設計・実践、','bp','4');
INSERT INTO company_det VALUES ('928464','カスタマーサービスFAQ作成に対して、様式変更簡易のXMLスキーマの設計・記述、','bp','5');
INSERT INTO company_det VALUES ('928464','情報共有の効率化上、テキスト形式の構造化データの採用推進、','bp','6');
INSERT INTO company_det VALUES ('928464','海外開発チームとのコミュニケーション円滑化、','bp','7');
INSERT INTO company_det VALUES ('928464','サービス関連の文言・宣伝の英訳の言い回しなどに対して改善上の指摘事項を提供した','bp','8');
INSERT INTO company_det VALUES ('928464','キーワード:Ethereal, XML, XSL, XSLT, MS Office Developer Tools, <oXygen> XML Editor and XSLT Debugger, プロジェクトマネジメント、受け入れテスト設計・実践','kw','9');
INSERT INTO company_det VALUES ('702084','実績:','pp','0');
INSERT INTO company_det VALUES ('702084','「キカク」という宣伝記事掲載用の入力フォームの実装、','bp','1');
INSERT INTO company_det VALUES ('702084','フロント・エンドのDHTMLの組み立て、','bp','2');
INSERT INTO company_det VALUES ('702084','エラー発生対応のプラグインの実装、','bp','3');
INSERT INTO company_det VALUES ('702084','入力禁止文字の仕様変更に当たって、フォーム・バックエンドの実装、','bp','4');
INSERT INTO company_det VALUES ('702084','キカクの入力フォームの機能追加や拡張の実装、','bp','5');
INSERT INTO company_det VALUES ('702084','開発工程に遵守し、仕様・設計書等の作成','bp','6');
INSERT INTO company_det VALUES ('702084','キーワード:Oracle, Perl, DHTML, SQL, Apache, Linux, OS X, 社内独自開発用のツール群、プラットフォーム・システム更新及びデータ移行、プロジェクトマネジメント、テスト設計・実践','kw','7');
INSERT INTO company_det VALUES ('923521','実績:','pp','0');
INSERT INTO company_det VALUES ('923521','「Moodle」というLMSを基にした英会話学校ウェブサイトの開発及びリニューワル','pp','1');
INSERT INTO company_det VALUES ('923521','キーワード:MySQL, PHP, HTML, SQL, Apache, Linux, VI, プラットフォーム・システム更新及びデータ移行、プロジェクトマネジメント、受け入れテスト設計・実践','kw','2');
INSERT INTO company_det VALUES ('036420','実績:','pp','0');
INSERT INTO company_det VALUES ('036420','大手薬品メーカーのJavaベースとしたウェブ系の学習管理システム','pp','1');
INSERT INTO company_det VALUES ('036420','JavaScriptによるフロント･エンド及びユーザ画面の実装、','bp','2');
INSERT INTO company_det VALUES ('036420','クライアント側のデータ扱い及び格納に対して仕様設計・実装、','bp','3');
INSERT INTO company_det VALUES ('036420','その他の開発上の課題発生した場合の問題解決・バグ追跡・修正','bp','4');
INSERT INTO company_det VALUES ('036420','キーワード:Oracle, SQL, JDBC, DHTML, JavaScript, Java/Servlets/JSP, Tomcat, Apache, IIS, Microsoft VSS, Eclipse w/ plug-ins, CruiseControl, Ant, プラットフォーム・システム更新及びデータ移行、プロジェクトマネジメント','kw','5');
INSERT INTO company_det VALUES ('036420','（＊）SCORMとは、Shareable Content Object Reference Modelの略語','pp','6');
INSERT INTO company_det VALUES ('561436','実績:','pp','0');
INSERT INTO company_det VALUES ('561436','ファッション撮影企画のディジタル・アセット管理','pp','1');
INSERT INTO company_det VALUES ('561436','デスクトップ・アプリケーションに対してユーザー・サポート、','bp','2');
INSERT INTO company_det VALUES ('561436','国境を越えた国際プロジェクトのため、日英仲介役、','bp','3');
INSERT INTO company_det VALUES ('561436','日本人商業アティストのマーケティング・サイトに対し、保守・更新、','bp','4');
INSERT INTO company_det VALUES ('561436','E-commerceサイト開発企画に当たって、戦略・ベンダー調査、','bp','5');
INSERT INTO company_det VALUES ('561436','広告宣伝電子メール配信システムの運用','bp','6');
INSERT INTO company_det VALUES ('561436','キーワード:MySQL, SQL, Perl, PHP, Apache, Linux, OS X, 英日翻訳、プロジェクトマネジメント','kw','7');
INSERT INTO company_det VALUES ('325071','実績:','pp','0');
INSERT INTO company_det VALUES ('325071','入選チームを実装するため、模倣できる前コンペのコードベースの調査、','bp','1');
INSERT INTO company_det VALUES ('325071','C++で実装したクライアントをLISPで書き直し、','bp','2');
INSERT INTO company_det VALUES ('325071','ウィンドウズの入選チームをLINUXへというプラットフォーム移行','bp','3');
INSERT INTO company_det VALUES ('325071','キーワード:C/C++, LISP, Win2K, Linux, OSX, Emacs, VIM, Allegro, Cell, プラットフォーム・システム更新及びデータ移行、プロジェクトマネジメント','kw','4');
INSERT INTO company_det VALUES ('471207','実績:','pp','0');
INSERT INTO company_det VALUES ('471207','ソニーのPS3に当たって、最先端研究開発とビジネス戦略を評価をするため、電子ゲーム業界のエキスパートたちにインタビュー・取材。','pp','1');
INSERT INTO company_det VALUES ('471207','キーワード:英日翻訳、レポート作成、インタビューによる取材・研究、プロジェクトマネジメント','kw','2');
INSERT INTO company_det VALUES ('221084','実績:','pp','0');
INSERT INTO company_det VALUES ('221084','XMLにて定義したウェブ・アプリケーション開発フレームワーク（FW）の実装、','bp','1');
INSERT INTO company_det VALUES ('221084','FWの使用目標の「達成度」を評価するため、品質・機能などのテストの設計・実行','bp','2');
INSERT INTO company_det VALUES ('221084','概念証明のアプリケーションの開発','bp','3');
INSERT INTO company_det VALUES ('221084','FW使い勝手評価するため、Java系の諸動作環境で配置・テスト','bp','4');
INSERT INTO company_det VALUES ('221084','Castorという「XMLデータバインディング」系のライブラリを利用して、XML構文解析器の実装。','bp','5');
INSERT INTO company_det VALUES ('221084','キーワード:DB2, SQL, JDBC, Java/Servlets/JSP, C/C++, XML, XSL, XSLT, Tomcat, Apache, WebSphere, Win2K, Linux, Cygwin, CVS, WebSphere(IDE), Ant, Eclipse, Emacs, STL, Visual Studio, Qt(TrollTech)、システム更新及びデータ移行、プロジェクトマネジメント、受け入れテスト設計・実践','kw','6');
INSERT INTO company_det VALUES ('273556','実績:','pp','0');
INSERT INTO company_det VALUES ('273556','グローバル・リスク・マネジメントの信用取引口座及び「マージン・アカウント」のリアル・タイム監視業務の効率化に対して、エクセルベースの診断ツール群を開発した。既存のテクノロジー資産を活用して、VBA、SQL・ODBCとその他を含め、','pp','1');
INSERT INTO company_det VALUES ('273556','「Bridge] 」というリアル・タイム市況データベース、','bp','2');
INSERT INTO company_det VALUES ('273556','従来のメーンフレーム・データベース、','bp','3');
INSERT INTO company_det VALUES ('273556','エクセル電子スプレッドシート','bp','4');
INSERT INTO company_det VALUES ('273556','という三個のシステムを統合した。','pp','5');
INSERT INTO company_det VALUES ('273556','リアル・タイム市況データベースから証券価格を取得するため、選択権付取引の株式銘柄の略称を可読形式にした構文解析器も実装した。','bp','6');
INSERT INTO company_det VALUES ('273556','キーワード:VBA, Windows NT, SQL, Excel, ODBC, Access, システム更新及びデータ移行、プロジェクトマネジメント、受け入れテスト設計・実践','kw','7');

\d
