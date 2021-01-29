#  parse text and add content to res_cv.xml
from collections import namedtuple
from recordtype import recordtype
from enum import IntEnum
import random
import re
import sys
import codecs
import xml.etree.ElementTree as ET


class ContactInfo(IntEnum):
    NAME = 0
    ADDRESS = 1
    EMAIL = 2


class Education(IntEnum):
    DATES = 0
    SCHOOL_NAME = 1


class Experience(IntEnum):
    COMPANY_NAME = 1
    LOCALE = 2
    DATES = 3


class ExperienceDetails(IntEnum):
    DETAILS = 0
    LINE_NO = 1


# 会社名 lines after being split according to regex will be put in this record and added to list, i.e, co_lst
ExperienceDetail = namedtuple("ExperienceDetail", 'details line_no')

# Use _replace(details=...) to 'update' record when merging info from details list
ExperienceIndex = recordtype("ExperienceIndex", 'co_name locale dates synopsis details')

ExperienceDetails = namedtuple("ExperienceDetails", 'heading bullet_point meta line_no')
ExperienceDetailsCnsld = namedtuple("ExperienceDetailsCnsld", 'heading line_no details')

# Lists for above named tuples
detail_plus_unmatched = []
details_consol = []


# LIST COMPREHENSIONS FOR THE WIN...
def extract_headings(det_lst):
    head_lst = [hd_tpl for hd_tpl in det_lst if hd_tpl.heading]
    return head_lst


def detail_headings(head_lst):
    # print(">>>>>>>>>> DETAIL HEADINGS..." + '\n')
    # print(*head_lst, sep='\n')
    if head_lst:
        head, *tail = head_lst
        tail_cpy = tail.copy()
        n_head_lst = sorted(tail + tail_cpy, key=lambda tup: tup[3])
        n_head_lst.insert(0, head)
        it = iter(n_head_lst)
        ptn_n_head_lst = list(zip(it, it))
    #        print(*ptn_n_head_lst, sep='\n')
    else:
        return []
    return ptn_n_head_lst


def details_in_range(hd_lst, det_lst):
    n_lst = []
    det_str = ""
    det_str_last = ""
    for hdg in hd_lst:
        for det_lstm in det_lst:
            if hdg[0].line_no < det_lstm.line_no < hdg[1].line_no:
                if det_lstm.bullet_point:
                    det_str += det_lstm.bullet_point + '\n'
                elif det_lstm.meta:
                    det_str += det_lstm.meta + '\n'
            elif hdg == hd_lst[-1] and det_lstm.line_no > hdg[1].line_no:
                if det_lstm.bullet_point:
                    det_str_last += det_lstm.bullet_point + '\n'
                elif det_lstm.meta:
                    det_str_last += det_lstm.meta + '\n'
        exp_consld = ExperienceDetailsCnsld(hdg[0].heading, hdg[0].line_no, det_str)
        det_str = ""
        n_lst.append(exp_consld)
        if det_str_last:
            exp_consld_last = ExperienceDetailsCnsld(hdg[1].heading, hdg[1].line_no, det_str_last)
            det_str_last = ""
            n_lst.append(exp_consld_last)
    return n_lst


def add_experience_index(exp_idx_lst, co_idx_lst, regex_pattern):
    exp_details_placeholder = ""
    it = iter(exp_idx_lst)
    ptn_n_idx_lst = list(zip(it, it))
    for i_exp in ptn_n_idx_lst:
        synopsis = i_exp[1]
        co_del_info = re.split(regex_pattern, i_exp[0])
        co_rec = ExperienceIndex(co_del_info[Experience.COMPANY_NAME],
                                 co_del_info[Experience.LOCALE],
                                 co_del_info[Experience.DATES],
                                 synopsis,
                                 exp_details_placeholder)
        co_idx_lst.append(co_rec)


def add_experience_details(con_det_lst, idx_lst):
    rv_lst = list(reversed(con_det_lst))
    if len(rv_lst) == len(idx_lst):
        for i, item in enumerate(idx_lst):
            idx_lst[i].details = rv_lst[i].details
    else:
        print("The two lists are of different lengths...")


def xml_res_add_experience(xml_res, exp_lst):
    experience = ET.SubElement(xml_res, 'experience')
    for exp_i in exp_lst:
        random_id = ''.join([str(random.randint(0, 999)).zfill(3) for _ in range(2)])
        title_desc = exp_i.synopsis.split("、")
        company = ET.SubElement(experience, 'company')
        c_name = ET.SubElement(company, 'c_name')
        c_bg = ET.SubElement(company, 'c_bg')
        location = ET.SubElement(company, 'location')
        dates = ET.SubElement(company, 'dates')
        job_title = ET.SubElement(company, 'job_title')
        job_desc = ET.SubElement(company, 'job_desc')
        details = ET.SubElement(company, 'details')
        emp_co_industry_feat = ET.SubElement(company, 'emp_co_industry_feat')
        emp_co_industry_feat.text = '上場'
        emp_co_business = ET.SubElement(company, 'emp_co_business')
        emp_co_business.text = '情報システム開発'
        emp_co_no_emp = ET.SubElement(company, 'emp_co_no_emp')
        emp_co_no_emp.text = '1000名'
        emp_co_work_term = ET.SubElement(company, 'emp_co_work_term')
        emp_co_work_term.text = '10年'
        emp_co_salary = ET.SubElement(company, 'emp_co_salary')
        emp_co_salary.text = '1000万円'
        emp_co_salary_add = ET.SubElement(company, 'emp_co_salary_add')
        emp_co_salary_add.text = '残業手当'
        emp_co_housing_cost = ET.SubElement(company, 'emp_co_housing_cost')
        emp_co_housing_cost.text = '寮・社宅の自己負担　100万／月'

        company.set('co_id', random_id)
        c_bg.text = "DEFAULT PLACEHOLDER: COMPANY STATISTICS"
        c_name.text = exp_i.co_name
        location.text = exp_i.locale
        dates.text = exp_i.dates
        job_title.text = title_desc[1]
        job_desc.text = title_desc[0]
        #        details.text = exp_i.details
        details_str = exp_i.details.split('\n\n')
        print(">>>>>>>>>> getting structured details...")
        print(">>>>>>>>>> SD length..." + str(len(details_str)))
        print(*details_str, sep='\n')
        for ln in details_str:
            detail_ln = ET.SubElement(details, "detail_ln")
            print(">>>>>>>>>>>>> adding detail lines...")
            if ln != "" and ln != "\n" and ln != "\n\n":
                print(">>>>>>>>>>>>> passed blank line test...")
                if re.match(r'\*', ln):
                    detail_ln.text = ln[1:]
                    detail_ln.set('type', 'bp')
                elif re.match(r"キーワード", ln):
                    detail_ln.text = ln
                    detail_ln.set('type', 'kw')
                else:
                    detail_ln.text = ln
                    detail_ln.set('type', 'pp')


def xmlize():
    resume = ET.Element('resume')

    comment = ET.Comment('Text to XML Conversion: docx -> txt -> xml')
    resume.append(comment)

    # --------------------------------- contact info
    contact_info = ET.SubElement(resume, 'contact_info')

    # MAIN PANE 
    name = ET.SubElement(contact_info, 'name')
    name.set('uid', '0000000')
    name_furigana = ET.SubElement(contact_info, 'name_furigana')
    name_furigana.text = 'ベンサム　ポール'
    name_kanji = ET.SubElement(contact_info, 'name_kanji')
    name_kanji.text = 'ベンサム　ポール'
    gender = ET.SubElement(contact_info, 'gender')
    gender.text = '男'
    b_date = ET.SubElement(contact_info, 'b_date')
    b_date.text = '1966年9月12日'
    age = ET.SubElement(contact_info, 'age')
    age.text = '54'
    addr_furigana = ET.SubElement(contact_info, 'addr_furigana')
    addr_furigana.text = 'サイタマケンハスダシニシシンシュク2−11−6'
    zip_code = ET.SubElement(contact_info, 'zip_code')
    zip_code.text = '349-0141'
    addr_kanji = ET.SubElement(contact_info, 'addr_kanji')
    addr_kanji.text = '埼玉県蓮田市西新宿２−１１−６'
    alt_addr_hometown_ph = ET.SubElement(contact_info, 'alt_addr_hometown_ph')
    alt_addr_hometown_ph.text = '080-7588-8737'
    alt_addr_hometown_kanji = ET.SubElement(contact_info, 'alt_addr_hometown_kanji')
    alt_addr_hometown_kanji.text = 'alt_addr_hometown_kanji'

    # SIDEBAR PANE 
    home_ph = ET.SubElement(contact_info, 'home_ph')
    home_ph.text = '048-000-0000'
    fax = ET.SubElement(contact_info, 'fax')
    fax.text = 'FAX'
    ans_svs_bool = ET.SubElement(contact_info, 'ans_svs_bool')
    ans_svs_bool.text = '有'
    family_msg_svs_bool = ET.SubElement(contact_info, 'family_msg_svs_bool')
    family_msg_svs_bool.text = '可'
    employer_notify_bool = ET.SubElement(contact_info, 'employer_notify_bool')
    employer_notify_bool.text = '否'
    work_ph = ET.SubElement(contact_info, 'work_ph')
    mobile_ph = ET.SubElement(contact_info, 'mobile_ph')
    email = ET.SubElement(contact_info, 'email')
    website = ET.SubElement(contact_info, 'website')
    website.text = 'https://github.com/benthumb/'
    address = ET.SubElement(contact_info, 'address')
    # phone = ET.SubElement(contact_info, 'phone')

    # --------------------------------- transportation 
    # detail_ln.set('type', 'bp') - attribute ...
    close_sta_line = ET.SubElement(contact_info, 'close_sta_line')
    close_sta_line.text = '宇都宮線　蓮田駅'
    close_sta_line_dst = ET.SubElement(contact_info, 'close_sta_line_dst')
    close_sta_line_dst.text = '自転車・バス　10分'
    living_arr = ET.SubElement(contact_info, 'living_arr')
    living_arr.text = '家族と同居'
    work_area_pref = ET.SubElement(contact_info, 'work_area_pref')
    work_area_pref.text = '東京 (23区) 東京 (23区外) 埼玉県　条件次第外'

    # --------------------------------- certifications / licensure 
    rireki_certs_lang_lvl = ET.SubElement(resume, 'rireki_certs_lang_lv')
    cert_std_auto_lic_bool = ET.SubElement(rireki_certs_lang_lvl, 'cert_std_auto_lic_bool')
    cert_std_auto_lic_bool.text = '普通自動車免許  有・無'
    cert_name1 = ET.SubElement(rireki_certs_lang_lvl, 'cert_name1')
    cert_name1.text = 'CERT NAME 1'
    cert_name1_date = ET.SubElement(rireki_certs_lang_lvl, 'cert_name1_date')
    cert_name1_date.text = '2001/8'
    cert_name2 = ET.SubElement(rireki_certs_lang_lvl, 'cert_name2')
    cert_name2.text = 'CERT NAME 2'
    cert_name2_date = ET.SubElement(rireki_certs_lang_lvl, 'cert_name2_date')
    cert_name2_date.text = '2001/8'
    cert_name3 = ET.SubElement(rireki_certs_lang_lvl, 'cert_name3')
    cert_name3.text = 'CERT NAME 3'
    cert_name3_date = ET.SubElement(rireki_certs_lang_lvl, 'cert_name3_date')
    cert_name3_date.text = '2001/8'
    cert_name4 = ET.SubElement(rireki_certs_lang_lvl, 'cert_name4')
    cert_name4.text = 'CERT NAME 4'
    cert_name4_date = ET.SubElement(rireki_certs_lang_lvl, 'cert_name4_date')
    cert_name4_date.text = '2001/8'
    family_struct = ET.SubElement(rireki_certs_lang_lvl, 'family_struct')
    family_struct.text = '配偶者　　有　　扶養家族　　2'

    # --------------------------------- language half 
    lang_eng_level = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_level')
    lang_eng_level.text = '初等・中等・上等'
    lang_eng_toeic = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_toeic')
    lang_eng_toeic.text = 'TOEIC'
    lang_eng_toefl_pbt = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_toefl_pbt')
    lang_eng_toefl_pbt.text = 'TOEFL(PBT)'
    lang_eng_toefl_ibt = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_toefl_ibt')
    lang_eng_toefl_ibt.text = 'TOEFL(IBT)'
    lang_eng_biz_exp = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_biz_exp')
    lang_eng_biz_exp.text = 'ビジネス経験　　20年'
    lang_eng_read_comp = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_read_comp')
    lang_eng_read_comp.text = '有・無'
    lang_eng_phone = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_phone')
    lang_eng_phone.text = '有・無'
    lang_eng_sales_neg = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_sales_neg')
    lang_eng_sales_neg.text = '有・無'
    lang_eng_email = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_email')
    lang_eng_email.text = '有・無'
    lang_eng_meeting = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_meeting')
    lang_eng_meeting.text = '有・無'
    lang_eng_lived_abroad = ET.SubElement(rireki_certs_lang_lvl, 'lang_eng_lived_abroad')
    lang_eng_lived_abroad.text = '有・無'
    lang_other_lang1 = ET.SubElement(rireki_certs_lang_lvl, 'lang_other_lang1')
    lang_other_lang1.text = '中国語'
    lang_other_lang1_level = ET.SubElement(rireki_certs_lang_lvl, 'lang_other_lang1_level')
    lang_other_lang1_level.text = '初等・中等・上等'
    lang_other_lang2 = ET.SubElement(rireki_certs_lang_lvl, 'lang_other_lang2')
    lang_other_lang2.text = '中国語'
    lang_other_lang2_level = ET.SubElement(rireki_certs_lang_lvl, 'lang_other_lang2_level')
    lang_other_lang2_level.text = '初等・中等・上等'
    # --------------------------------- education
    education = ET.SubElement(resume, 'education')

    source_file = codecs.open("../txt_docs_drafts/text_rez.txt", mode="r", encoding="utf-8")

    # Initialize regex for experience (company names etc.)
    delimiters = "：", "、", "（米) ", "（日本) ", "（米・日本) ", "(米) "
    regex_pattern = '|'.join(map(re.escape, delimiters))
    co_idx_lst = []
    exp_idx_lst = []
    current_line = 0

    # Match address/contact info...
    for line in source_file:
        current_line += 1
        if re.search(r'@', line):
            addr_lst = line.split('/')
            name.text = addr_lst[ContactInfo.NAME]
            address.text = addr_lst[ContactInfo.ADDRESS]
            email.text = addr_lst[ContactInfo.EMAIL]
        # Match education...
        elif re.search(r"\d+.*：", line):
            school = ET.SubElement(education, 'school')
            s_name = ET.SubElement(school, 's_name')
            dates = ET.SubElement(school, 'dates')
            major = ET.SubElement(school, 'major')
            degree = ET.SubElement(school, 'degree')
            edu_notes = ET.SubElement(school, 'edu_notes')
            edu_hobbies = ET.SubElement(school, 'edu_hobbies')
            edu_lst = line.split('：')
            dates.text = edu_lst[Education.DATES]
            s_name.text = edu_lst[Education.SCHOOL_NAME]
            edu_notes.text = 'オンライン在学中'
            edu_hobbies.text = '音楽'
        # Match experience
        elif n_val := re.match(r"会社名|-- ", line):
            exp_idx_lst.append(line)
        elif re.match(r"[*]", line):
            exp_det_rec_bp = ExperienceDetails("", line, "", current_line)
            detail_plus_unmatched.append(exp_det_rec_bp)
        elif re.search(r'\d+.*[一二三四五六七八九十]|\d+.*現在', line):
            exp_det_rec_hd = ExperienceDetails(line, "", "", current_line)
            detail_plus_unmatched.append(exp_det_rec_hd)
        else:
            exp_det_rec_meta = ExperienceDetails("", "", line, current_line)
            detail_plus_unmatched.append(exp_det_rec_meta)

    add_experience_index(exp_idx_lst, co_idx_lst, regex_pattern)
    dhd_lst = extract_headings(detail_plus_unmatched)
    rgs = detail_headings(dhd_lst)
    cons_lst = details_in_range(rgs, detail_plus_unmatched)
    add_experience_details(cons_lst, co_idx_lst)

    if resume:
        xml_res_add_experience(resume, co_idx_lst)
        myresume = ET.tostring(resume)
        myfile = open("../xml_drafts/rireki_cv_20201208.xml", "wb")
        myfile.write(myresume)
        sys.stdout.write(str(resume))
        print(resume)


xmlize()
