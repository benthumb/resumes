#  parse text and add content to res_cv.xml
from collections import namedtuple
from recordtype import recordtype
from enum import IntEnum
import random
import re
import sys
import codecs
import xml.etree.ElementTree as ET

xml_resume = ET.parse('../xml_drafts/rireki_cv.xml').getroot()

# ----------------------------------------------------------------------------- 
def sql_create_table_school():
    # xml_resume = ET.parse('../xml_drafts/rireki_cv.xml').getroot()
    create_tbl_open = "CREATE TABLE " + xml_resume[2][0].tag + "("
    columns = ""
    values = ""
    cnt = 0
    sql_stmt_lst = []
    while xml_resume[2]:
        if cnt == len(xml_resume[2]):
            break
        if xml_resume[2].text:
            print(">>> something..." + xml_resume[2].text)
            print(">>> something..." + xml_resume[2].tag)
        for child in xml_resume[2][cnt]:
            if child.tag is not None:
                columns += child.tag + '\t' + "CHAR(100)" + "," + '\n'
            if child.text is not None:
                values += "'" + child.text + "',"
            insert_values_open = 'INSERT INTO {} VALUES ({});'.format(xml_resume[2][0].tag, values)
            insert_values_open_fx = insert_values_open.replace(",);", ",'','');\n")
        cnt = cnt + 1

        sql_stmt_lst.append(insert_values_open_fx)
        values = ""

    sql_stmt_create_tbl = create_tbl_open + '\n' "ID INT PRIMARY KEY     NOT NULL," + '\n' + columns + ");"

    print(sql_stmt_create_tbl)
    print(insert_values_open_fx)
    for i in sql_stmt_lst:
        print(i, end=' ')

# ----------------------------------------------------------------------------- 
def sql_create_table_experience():
    attrlst = []
    namelst = []
    sql_stmt_lst = []
    columns = ""
    values = ""

    for child in xml_resume[3]:
        namelst.append(child.tag)
        attrlst.append(child.attrib)

    create_tbl_open = "CREATE TABLE " + namelst[0] + "("
    columns_primary_key = list(attrlst[0].keys())[0]

    cnt = 0
    cnt_inner = 0
    while xml_resume[3]:
        if cnt < len(attrlst):
            values += "'" + attrlst[cnt]['co_id'] + "',"
        if cnt == len(xml_resume[3]):
            break
        for child in xml_resume[3][cnt]:
            if child.tag is not None and cnt_inner < len(xml_resume[3][cnt]):
                columns += child.tag + '\t' + "CHAR(100)" + "," + '\n'
            if child.text is not None:
                child_text = child.text.rstrip()
                # values += "'" + child.text + "',"
                values += "'" + child_text + "',"
            insert_values_open = 'INSERT INTO {} VALUES ({});'.format(namelst[0], values)
            insert_values_open_fx = insert_values_open.replace(",);", ");\n")
            cnt_inner = cnt_inner + 1
        cnt = cnt + 1
        sql_stmt_lst.append(insert_values_open_fx)
        values = ""

    sql_stmt_create_tbl = create_tbl_open + '\n' + columns_primary_key + " INT PRIMARY KEY     NOT NULL," + '\n' + columns + ");"
    print(sql_stmt_create_tbl)
    # print(insert_values_open_fx)
    for i in sql_stmt_lst:
        print(i, end=' ')

# ----------------------------------------------------------------------------- 
def sql_create_table_exp_det():
    attrlst = []
    namelst = []
    sql_stmt_lst = []
    columns = ""
    values = ""

    for child in xml_resume[3]:
        namelst.append(child.tag)
        attrlst.append(child.attrib)

    create_tbl_open = "CREATE TABLE " + namelst[0] + "("
    columns_primary_key = list(attrlst[0].keys())[0]

    cnt = 0
    cnt_inner = 0
    co_id_curr = "" 
    det_ln_typ = ""
    while xml_resume[3]:
        if cnt < len(attrlst):
            # values += "'" + attrlst[cnt]['co_id'] + "',"
            co_id_curr = attrlst[cnt]['co_id']
        if cnt == len(xml_resume[3]):
            break
        for child in xml_resume[3][cnt][6]:
            if child.tag is not None and cnt_inner < len(xml_resume[3][cnt]):
                columns += child.tag + '\t' + "CHAR(100)" + "," + '\n'
            if child.text is not None:
                child_text = child.text.rstrip()
                # print(">>> current count: " + str(cnt))
                # print(">>> current inner count: " + str(cnt_inner))
                det_ln_typ = xml_resume[3][cnt][6][cnt_inner].attrib['type']
                values = "'" + co_id_curr + "'," + "'" + child_text + "'," + "'" + det_ln_typ + "'," + "'" + str(cnt_inner) + "',"
                # insert_values_open = 'INSERT INTO {} VALUES ({});'.format(namelst[0], values)
                insert_values_open = 'INSERT INTO {} VALUES ({});'.format("company_det", values)
            insert_values_open_fx = insert_values_open.replace(",);", ");\n")
            sql_stmt_lst.append(insert_values_open_fx)
            cnt_inner = cnt_inner + 1
        cnt = cnt + 1
        cnt_inner = 0 
        # sql_stmt_lst.append(insert_values_open_fx)
        values = ""

    sql_stmt_create_tbl = create_tbl_open + '\n' + columns_primary_key + " INT PRIMARY KEY     NOT NULL," + '\n' + columns + ");"
    # print(sql_stmt_create_tbl)
    # print(insert_values_open_fx)
    for i in sql_stmt_lst:
        print(i, end=' ')

# sql_create_table_school()
# sql_create_table_experience()
sql_create_table_exp_det()
