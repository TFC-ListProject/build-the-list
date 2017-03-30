from __future__ import print_function
import argparse
import os

def extract_pdf_text(file_name):
    tmp_filename = file_name + '.tmp'
    os.system('pdf2txt.py {} > {}'.format(file_name, tmp_filename))
    lines = []
    with open(tmp_filename) as f:
        [lines.append(line.strip()) for line in f if line != '\n']
    os.remove(tmp_filename)
    return lines

def candidates(extracted_pdf):
    return [
        extracted_pdf[1],
        extracted_pdf[3],
        extracted_pdf[5],
        extracted_pdf[7],
        extracted_pdf[9],
        extracted_pdf[11].replace(' Socialist', ''),
        extracted_pdf[13],
        extracted_pdf[15],
        extracted_pdf[17],
    ]

def parties(extracted_pdf):
    return [
        extracted_pdf[2],
        extracted_pdf[4],
        extracted_pdf[6],
        extracted_pdf[8],
        extracted_pdf[10],
        extracted_pdf[11].replace('Alyson Kennedy ', '') + ' ' + extracted_pdf[12],
        extracted_pdf[14],
        extracted_pdf[16],
        extracted_pdf[18],
    ]

def votes_by_municipality(extracted_pdf):
    municipalities = {}
    for x in range(0, 24):
        municipalities[extracted_pdf[x]] = []

    row_count = 24
    column_count = 0
    for x in range(24, len(extracted_pdf)):
        if (x % row_count == 0):
            municipalities[extracted_pdf[column_count]].append(_stoi(extracted_pdf[x]))
        row_count += 1
        column_count += 1
        if column_count > 23:
            column_count = 0

    return municipalities

def _filtered(extracted_pdf):
    """
    Removes election lines at beginning and noise at the end.
    """
    return extracted_pdf[4:-2]

def _vote_filtered(extracted_pdf):
    """
    Removes up to municipalities list and assumes list has been pre-filtered.
    """
    return extracted_pdf[19:]

def _stoi(x):
    return int(x.replace(',', ''))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f',
                        '--file',
                        required=True,
                        help='path to PDF file')
    args = parser.parse_args()

    # 1. fetch pdf
    # 2. extract text from pdf
    text = _filtered(extract_pdf_text(args.file))
    # 3. build data structure
    candidates = candidates(text)
    parties = parties(text)
    votes_by_municipality = votes_by_municipality(_vote_filtered(text))
    # 4. insert into database

    print(text)
