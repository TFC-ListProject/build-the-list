#!/bin/bash

# Run this first if you haven't downloaded all of the PDFs already:
# (cd resources/tmp && for f in `cat ../urls`; do wget $f; done)

./go db -d &&\
./go db -c &&\
./go migrate &&\
for f in `find resources/tmp -type f`; do echo $f; ./go extract_pdf -f $f || break; done &&\
python build_the_list/aggregate_nj_municipality_data.py &&\
python scrape/vpap/normalize_vpap.py
