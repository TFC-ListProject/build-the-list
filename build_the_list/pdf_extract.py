from __future__ import print_function
import argparse
import re
import os

config = {
    'sample_hor_nj1.pdf': {
        'candidates': [
            'Donald W. Norcross',
            'Bob Patterson',
            'Michael Berman',
            'William F. Sihr IV',
            'Scot John Tomaszewski',
        ],
        'parties': [
            'Democratic',
            'Republican',
            'AmericanIndependents.org',
            'Libertarian Party',
            'We Deserve Better',
        ],
        'county_indices': [3, 7, 49],
        'total_row_indices': [6, 44, 64],
        'skip_row_indices': [0, 1, 2, 3, 45, 46, 47, 48, 65, 66],
    },
    'sample_hor_nj2.pdf': {
        'candidates': [
            'Frank A. LoBiondo',
            'David H. Cole',
            'Eric Beechwood',
            'Steven Fenichel',
            'Gabriel Brian Franco',
            'James Keenan',
            'John Ordille',
        ],
        'parties': [
            'Republican',
            'Democratic',
            "People's Independent Progressive",
            'Representing the 99%',
            'For Political Revolution',
            'Make Government Work',
            'Libertarian Party',
        ],
        'county_indices': [5, 31, 36, 46, 65, 88, 103, 122],
        'total_row_indices': [30, 35, 39, 64, 81, 102, 115, 140],
        'skip_row_indices': [0, 1, 2, 3, 4, 40, 41, 42, 43, 44, 45, 82, 83, 84, 85, 86, 87, 116, 117, 118, 119, 120, 121, 141, 142]
    }
}

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

def output(extracted_pdf):
    for i, x in enumerate(extracted_pdf):
        print("'" + x + "',")

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f',
                        '--file',
                        required=True,
                        help='path to PDF file')
    args = parser.parse_args()
    config = config[args.file.split('/')[1]]
    text = extract_pdf_text(args.file)

    print(candidates(config))
    print(parties(config))
    print(votes_by_municipality(text, config))
