from __future__ import print_function
import argparse
import db
import json
import os
import re
import sys

def extract_pdf_text(file_name):
    tmp_filename = file_name + '.tmp'
    os.system('ps2ascii {} > {}'.format(file_name, tmp_filename))
    lines = []
    with open(tmp_filename) as f:
        [lines.append(line.strip()) for line in f if line != '\n']
    os.remove(tmp_filename)
    return lines

def candidates(config):
    return config['candidates']

def parties(config):
    return config['parties']

def votes_by_municipality_with_counties(rows, config):
    county_indices = config['county_indices']
    total_row_indices = config['total_row_indices']
    skip_row_indices = config['skip_row_indices']
    results = {}
    current_county = None

    for i, row in enumerate(rows):
        if i in skip_row_indices:
            pass
        elif i in county_indices:
            current_county = row.strip()
            results[row] = {}
        elif i in total_row_indices:
            total_row_with_blank_muni_match = r'(?<=\d)([a-zA-Z]+\stotal.+$)'
            if re.search(total_row_with_blank_muni_match, row, re.IGNORECASE):
                total_row = re.sub(total_row_with_blank_muni_match, '', row, flags=re.IGNORECASE)
                votes = re.search(r'(\d+.+)$', total_row).group(0)
                muni_name = total_row.replace(votes, '').strip()
                vote_counts = map(lambda x: _stoi(x), votes.split(' '))
                results[current_county][muni_name] = vote_counts
        else:
            votes_match = re.search(r'(\d+.+)$', row)
            if votes_match:
                votes = votes_match.group(0)
                muni_name = row.replace(votes, '').strip()
                vote_counts = map(lambda x: _stoi(x), votes.split(' '))
                results[current_county][muni_name] = vote_counts

    return results

def votes_by_municipality_without_counties(rows, config):
    total_row_indices = config['total_row_indices']
    skip_row_indices = config['skip_row_indices']
    results = {}

    for i, row in enumerate(rows):
        if i in skip_row_indices:
            pass
        elif i in total_row_indices:
            total_row_with_blank_muni_match = r'(?<=\d)([a-zA-Z]+\stotal.+$)'
            if re.search(total_row_with_blank_muni_match, row, re.IGNORECASE):
                total_row = re.sub(total_row_with_blank_muni_match, '', row, flags=re.IGNORECASE)
                votes = re.search(r'(\d+.+)$', total_row).group(0)
                muni_name = total_row.replace(votes, '').strip()
                vote_counts = map(lambda x: _stoi(x), votes.split(' '))
                results[muni_name] = vote_counts
        else:
            votes_match = re.search(r'(\d+.+)$', row)
            if votes_match:
                votes = votes_match.group(0)
                muni_name = row.replace(votes, '').strip()
                vote_counts = map(lambda x: _stoi(x), votes.split(' '))
                results[muni_name] = vote_counts
    return results

def votes_by_foo(rows, config):
    reduce

def votes_by_municipality(extract_pdf, config):
    return {
        True: votes_by_municipality_with_counties,
        False: votes_by_municipality_without_counties
    }[config['has_counties']](extract_pdf, config)

def _stoi(x):
    return int(x.replace(',', ''))

def get_config(pdf_name):
    return open_config('config/pdf_meta.json')[pdf_name]

def open_config(file_name):
    with open(file_name, 'r') as f:
        return json.load(f)

def debug(extracted_pdf):
    for i, row in enumerate(extracted_pdf):
        print("'" + row + "',")

def preprocess(extracted_pdf):
    for i, row in enumerate(extracted_pdf):
        print(str(i), ': ' + row)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f',
                        '--file',
                        required=True,
                        help='path to PDF file')
    parser.add_argument('-o',
                        '--output',
                        action='store_true',
                        help='output PDF for preprocessing')
    args = parser.parse_args()
    text = extract_pdf_text(args.file)
    if args.output:
        preprocess(text)
        sys.exit()

    config = get_config(args.file.split('/')[1])

    candidates = candidates(config)
    parties = parties(config)
    votes = votes_by_municipality(text, config)
    # print(votes)

    db.save(
        candidates,
        parties,
        votes
    )

    # print(candidates(config))
    # print(parties(config))
    # print(votes_by_municipality(text, config))
