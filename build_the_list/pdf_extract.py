from __future__ import print_function
import argparse
import json
import os
import re

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

def votes_by_municipality(rows, config):
    county_indices = config['county_indices']
    total_row_indices = config['total_row_indices']
    skip_row_indices = config['skip_row_indices']
    results = {}
    current_county = None

    for i, row in enumerate(rows):
        if i in county_indices:
            current_county = row.strip()
            results[row] = {}
        elif i in skip_row_indices:
            pass
        else:
            if i in total_row_indices:
                total_row_with_blank_muni_match = r'(?<=\d)([a-zA-Z]+\sTotals.+$)'
                if re.search(total_row_with_blank_muni_match, row):
                    total_row = re.sub(total_row_with_blank_muni_match, '', row)
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
            pass

    return results

def _stoi(x):
    return int(x.replace(',', ''))

def get_config(file_name):
    with open(file_name) as f:
        return json.load(f)

def debug(extracted_pdf):
    for i, x in enumerate(extracted_pdf):
        print("'" + x + "',")

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f',
                        '--file',
                        required=True,
                        help='path to PDF file')
    args = parser.parse_args()
    config = get_config('config/pdf_meta.json')[args.file.split('/')[1]]
    text = extract_pdf_text(args.file)

    print(candidates(config))
    print(parties(config))
    print(votes_by_municipality(text, config))
