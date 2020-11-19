#  parse text and add content to res_cv.xml
from collections import namedtuple
from recordtype import recordtype
from enum import IntEnum
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
        title_desc = exp_i.synopsis.split("、")
        company = ET.SubElement(experience, 'company')
        c_name = ET.SubElement(company, 'c_name')
        location = ET.SubElement(company, 'location')
        dates = ET.SubElement(company, 'dates')
        job_title = ET.SubElement(company, 'job_title')
        job_desc = ET.SubElement(company, 'job_desc')
        details = ET.SubElement(company, 'details')
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
                    detail_ln.text = ln
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

    # contact info
    contact_info = ET.SubElement(resume, 'contact_info')
    name = ET.SubElement(contact_info, 'name')
    address = ET.SubElement(contact_info, 'address')
    phone = ET.SubElement(contact_info, 'phone')
    email = ET.SubElement(contact_info, 'email')
    website = ET.SubElement(contact_info, 'website')

    # eduction
    education = ET.SubElement(resume, 'education')

    source_file = codecs.open("text_rez.txt", mode="r", encoding="utf-8")

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
            edu_lst = line.split('：')
            dates.text = edu_lst[Education.DATES]
            s_name.text = edu_lst[Education.SCHOOL_NAME]
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
        myfile = open("res_cv_out_20201110.xml", "wb")
        myfile.write(myresume)
        sys.stdout.write(str(resume))
        print(resume)


xmlize()
