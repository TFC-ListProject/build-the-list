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

def candidates2(extracted_pdf):
    filtered = _filtered2(extracted_pdf)
    return [
        filtered[1],
        filtered[3],
        filtered[5],
        filtered[7],
        filtered[9],
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

def parties2(extracted_pdf):
    filtered = _filtered2(extracted_pdf)
    return [
        filtered[2],
        filtered[4],
        filtered[6],
        filtered[8],
        filtered[10],
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

def votes_by_municipality2(extracted_pdf):
    f = _filtered2(extracted_pdf)[11:]

    county_indicies     = [0, 5, 266]
    municipality_counts = [2, 37, 15]
    vote_idx_start      = [44, 47, 284]
    column_step         = [41, 41, 17]
    candidate_count     = 5

    results = {}
    for index, county_index in enumerate(county_indicies):
        municipalities_in_county = []
        for j in range(county_index + 1, county_index + 1 + municipality_counts[index]):
            municipalities_in_county.append(f[j])

        def vote_counts_by_municipality_for_county(acc, memo):
            """
            1. Get first vote count column's index for a single row.
            2. Get the rest of the indices for that row based on the step value.
            3. For each index, get its value and convert it to an integer.
            """
            first_column_idx = vote_idx_start[index] + len(acc)
            indices = [first_column_idx] + [column_step[index] * j + first_column_idx for j in range(1, candidate_count)]
            vote_counts = [_stoi(f[i]) for i in indices]
            acc[memo] = vote_counts
            return acc

        results[f[county_index]] = reduce(vote_counts_by_municipality_for_county, municipalities_in_county, {})

    return results

def _filtered(extracted_pdf):
    """
    Removes election lines at beginning and noise at the end.
    """
    return extracted_pdf[4:-2]

def _filtered2(extracted_pdf):
    """
    Removes election lines at beginning and noise at the end.
    """
    return extracted_pdf[3:-4]

def _vote_filtered(extracted_pdf):
    """
    Removes up to municipalities list and assumes list has been pre-filtered.
    """
    return extracted_pdf[19:]

def _vote_filtered2(extracted_pdf):
    """
    Removes up to municipalities list and assumes list has been pre-filtered.
    """
    return extracted_pdf[11:]

def _stoi(x):
    return int(x.replace(',', ''))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f',
                        '--file',
                        required=True,
                        help='path to PDF file')
    args = parser.parse_args()

    text = extract_pdf_text(args.file)
    candidates = candidates2(text)
    parties = parties2(text)
    votes_by_municipality = votes_by_municipality2(text)

    # text = _filtered(extract_pdf_text(args.file))
    # candidates = candidates(text)
    # parties = parties(text)
    # votes_by_municipality = votes_by_municipality(_vote_filtered(text))

    # print(text)
    # print(candidates)
    # print(parties)
    # print(votes_by_municipality)
