import argparse
import json
import sys

import db
from pdf_extract import extract_pdf_text
import election_repository as er
import election as e
import utils as utils

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

    rows = extract_pdf_text(args.file)
    config = utils.get_config(args.file.split('/')[1])

    if args.output:
        utils.preprocess(rows)
        sys.exit()

    election = e.from_pdf(rows, config)

    er.save(
        candidates=election['candidates'],
        db=db,
        parties=election['parties'],
        election=election['election'],
        rows=election['rows']
    )
