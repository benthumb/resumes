"""parse text and add content to res_cv.xml"""
import re
import sys
import codecs
import xml.etree.ElementTree as ET
from enum import IntEnum
import random
from collections import namedtuple
from recordtype import recordtype
from dataclasses import dataclass


#REGEX EXPRESSIONS:
#\d\{1,2\}\. [A-Z]*, --> 2. ITTO,
#\d\{1,2\}\.\s\w\=.*, --> Pacific, Found, NYC Lisp, Lexelnet, Goldman
 
#HEADER_TITLE
HeaderTitle = namedtuple("HeaderTitle", 'title line_no')

#WORK_CONTENT
WorkContent = namedtuple("WorkContent", 'content content_meta')

#WORK_TERM_DATES
WorkTermDates = namedtuple("WorkTermDates", 'wk_dates content_meta')

#ABBREVIATED_EXPERIENCE
AbbrevExperience = namedtuple("AbbrevExperience", 'experience line_no')

#NAME OF POSITION
PositionName = namedtuple("PositionName", 'position_nm content_meta')

#PROJECT SUMMARY
ProjectSummary = namedtuple("ProjectSummary", 'project_summary content_meta')

#NOTE
Note = namedtuple("Note", 'note content_meta')

#COMPANY LOCATION
HRAgencyLocation = namedtuple("HRAgencyLocation", 'hr_agency_loc content_meta')

#COMPANY LOCATION
CompanyLocation = namedtuple("CompanyLocation", 'company_loc content_meta')

def xmlize():
    resume = ET.Element('resume')

    comment = ET.Comment('Text to XML Conversion: docx -> txt -> xml')
    resume.append(comment)

    contact_info = ET.SubElement(resume, 'contact_info')
    name = ET.SubElement(contact_info, 'name')
    address_1 = ET.SubElement(contact_info, 'address_1')
    address_2 = ET.SubElement(contact_info, 'address_2')
    address_3 = ET.SubElement(contact_info, 'address_3')
    email = ET.SubElement(contact_info, 'email')
    linkedin_email = ET.SubElement(contact_info, 'linkedin_email')
    professional_interests = ET.SubElement(resume, 'professional_interests')

    # -------------------- experience START -----------------------------
    experience = ET.SubElement(resume, 'experience')
    add_exp_short = ET.SubElement(resume, 'add_exp_short')
    education = ET.SubElement(resume, 'education')
   # -------------------- experience END -----------------------------

    education = ET.SubElement(resume, 'education')
    skills = ET.SubElement(resume, 'skills')

    """Transforms text resume into xml"""
    source_file = codecs.open("/home/paul/Documents/Projects/docx/txt_docs_drafts/resume.txt",
            mode="r", encoding="utf-8")

    prof_int_str = ""
    current_line = 0
    abbrev_exp_lst = []
    exp_lst = []
    contact_info_lst = []
    edu_lst = []
    cnt = 0

    my_name = ""
    Section_State = ""
    ADDRESS = "Address"
    PROFESSIONAL_INTERESTS = "Professional Interests"
    PROFESSIONAL_EXPERIENCE = "Professional Experience"
    EDUCATION = "Education"
    SKILLS = "Skills"
    WORK_TERM_DATES = "Dates"
    ABBREVIATED_EXPERIENCE = "Abbrv. Experience"

    for line in source_file:
        if re.search(r'Paul', line):
            Section_State = ADDRESS
            name.text = line
        elif re.match(r'^Education', line):
            Section_State = EDUCATION
            print("*** EDUCATION: " + line)
            edu_lst.append(line)
        elif re.match(r'^Professional Interests', line):
            Section_State = PROFESSIONAL_INTERESTS
            address_1.text = contact_info_lst[0]
            address_2.text = contact_info_lst[1]
            address_3.text = contact_info_lst[2]
            email.text = contact_info_lst[3]
            linkedin_email.text = contact_info_lst[4]
        elif re.match(r'^Professional Experience', line):
            Section_State = PROFESSIONAL_EXPERIENCE
            professional_interests.text = prof_int_str
        elif re.match(r'^Skills', line):
            Section_State = SKILLS
        elif re.match(r'^[A-Z]{3,}', line) and Section_State is PROFESSIONAL_EXPERIENCE:
            print("Work Experience Heading: " + line)
            exp_lst.append(HeaderTitle(line, current_line))
        elif re.match(r'^\u2022', line):
            print("bullet point content: " + line)
            exp_lst.append(WorkContent(line, "bp"))
        elif re.match(r'^\u2013', line):   #if re.search(r'^['•'|'–']', line):
            print("sub-bp content: " + line)
            exp_lst.append(WorkContent(line, "sbp"))
        elif re.match(r'^\u00b7', line):   #if re.search(r'^['•'|'–']', line):
            print("bullet point content: " + line)
            exp_lst.append(WorkContent(line, "bp"))
        elif re.match(r'^o', line):   #if re.search(r'^['•'|'–']', line):
            print("sub-bp content: " + line)
            exp_lst.append(WorkContent(line, "sbp"))
        elif re.match(r'^Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec',
                line) or re.match(r'^2{4}', line):
            print("work term content: " + line)
            exp_lst.append(WorkTermDates(line, "date"))
        elif re.match(r'^\d{1,2}\.', line):
            abbrev_exp_lst.append(line)
            print("**** abbrev_exp_lst item: " + line)
        elif (re.search(r':', line) and re.search(r'@', line)):
            print("Position: " + line)
            loc = line.split(":")
            exp_lst.append(CompanyLocation(loc[1], "location"))
            exp_lst.append(PositionName(loc[0], "position"))
        elif re.match(r'^\*{1,2}',line):
            print("Project Summary: " + line)
            exp_lst.append(ProjectSummary(line, "summary"))
        elif  re.match(r'^\(\*\*\)', line) or re.match(r'^\(\*\)', line):
            exp_lst.append(line)
            exp_lst.append(Note(line, "note"))
        elif re.match(r'^[A-Z][a-z]* \S*, [A-Z]*', line) and (Section_State != SKILLS):
            print("Picked up address...: " + line)
            exp_lst.append(HRAgencyLocation(line, "location"))
        elif Section_State == EDUCATION and line != '\n':
            print("*** EDUCATION: " + line)
            edu_lst.append(line)
        else:
            if Section_State == ADDRESS and line != '\n':
                print("*** Current line: " + line)
                contact_info_lst.append(line)
            else:
                prof_int_str += line
        current_line += 1

    if resume:
        for itm in exp_lst:
            #print("Contents of exp_lst: " + str(itm))
            if isinstance(itm, WorkContent):
                print(">>>>> Work Content: " + itm.content)
                print(">>>>> Work Content (Format): " + itm.content_meta)
                detail_ln = ET.SubElement(details, 'detail_ln')
                cnt_ln = itm.content[1:]
                detail_ln.text = cnt_ln
                detail_ln.set('type', itm.content_meta)
            elif isinstance(itm, HeaderTitle):
                print(">>>>> Header Title: " + itm.title)
                company = ET.SubElement(experience, 'company')
                details =  ET.SubElement(company, 'details')
                c_name = ET.SubElement(company, 'c_name')
                #c_name_title = (itm.title).title().strip();
                c_name_title = (itm.title).strip()
                #c_name.text = itm.title
                c_name.text = c_name_title
            elif isinstance(itm, PositionName):
                print(">>>>> Position Name: " + itm.position_nm)
                job_title = ET.SubElement(company, 'job_title')
                job_title.text = itm.position_nm
            elif isinstance(itm, ProjectSummary):
                print(">>>>> Project Summary: " + itm.project_summary)
                job_desc = ET.SubElement(company, 'job_desc')
                details =  ET.SubElement(company, 'details')
                job_desc.text = itm.project_summary
            elif isinstance(itm, WorkTermDates):
                print(">>>>> Work Term Dates: " + itm.wk_dates)
                dates = ET.SubElement(company, 'dates')
                dates.text = itm.wk_dates
            elif isinstance(itm, Note):
                print(">>>>> Note: " + itm.note)
                note = ET.SubElement(company, 'note')
                note.text = itm.note
            elif isinstance(itm, HRAgencyLocation):
                print(">>>>> HR Agency Location: " + itm.hr_agency_loc)
                hr_agency_loc = ET.SubElement(company, 'hr_agency_loc')
                hr_agency_loc.text = itm.hr_agency_loc
            elif isinstance(itm, CompanyLocation):
                print(">>>>> Company Location: " + itm.company_loc)
                location = ET.SubElement(company, 'location')
                location.text = itm.company_loc

        for ab_ex_item in abbrev_exp_lst:
            short_exp_ln = ET.SubElement(add_exp_short, 'short_exp_ln')
            short_exp_ln.text = ab_ex_item
    
        for edu_itm in edu_lst:
            school_ln = ET.SubElement(education, 'school_ln')
            school_ln.text = edu_itm

        myresume = ET.tostring(resume)
        myfile = open("../xml_drafts/english_cv_20210917.xml", "wb")
        myfile.write(myresume)
        sys.stdout.write(str(resume))
        print(resume)

xmlize()
