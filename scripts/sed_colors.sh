#!/bin/sh

sed -i -e 's/@MUFG/@<span class="MUFG">MUFG<\/span>/g' -e 's/@SMBC/@<span class="SMBC">SMBC<\/span>/g' -e 's/@Mizuho/@<span class="Mizuho">Mizuho<\/span>/g' -e 's/MGTECHNOLOGIES AND INVESTMENT/MG TECHNOLOGIES AND INVESTMENT/g' -e 's/Dec 2021/Dec 2022/g' -e 's/University of Maryland Global Campus/<span class="school">University of Maryland Global Campus<\/span>/g' ../html_drafts/test5.html 
