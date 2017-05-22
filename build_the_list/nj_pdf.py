import argparse
import sys

import db
import election as e
import election_repository as er
import pdf_extract as pe
import utils

def generate():
    '''
    Creates data structure from extracted NJ PDFs
    '''
    pdfs = utils.file_to_json('config/pdf_meta.json')

    def build_election_result(acc, pdf):
        config = utils.get_config(pdf)
        rows = pe.extract_pdf_text('resources/tmp/{}'.format(pdf))
        election = e.from_pdf(rows, config)
        acc[pdf] = election
        return acc

    return reduce(build_election_result, pdfs.keys(), {})

def save(config_file, election_results):
    '''
    Saves generated data to a file for later processing. This merges existing manually extracted
    data with generated data.
    '''
    nj_pdf_data = utils.file_to_json(config_file)
    nj_pdf_data.update(election_results)
    utils.json_to_file(config_file, nj_pdf_data)

def manual_load():
    nj_pdf_data_manual = utils.file_to_json('config/nj_pdf_data_manual.json')
    manual_pdfs = [
        '2015-GenAssembly-gen-elect-results-1st-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-2nd-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-3rd-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-4th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-5th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-6th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-7th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-8th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-9th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-10th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-11th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-12th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-13th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-14th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-15th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-16th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-17th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-18th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-19th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-20th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-21st-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-22nd-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-23rd-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-24th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-25th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-26th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-27th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-28th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-29th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-30th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-31st-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-32nd-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-33rd-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-34th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-35th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-36th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-37th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-38th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-39th-ld-municipality.pdf',
        '2015-GenAssembly-gen-elect-results-40th-ld-municipality.pdf',
    ]

    def build_election_result(acc, pdf):
        config = utils.get_config(pdf)
        rows = nj_pdf_data_manual[pdf]
        election = e.from_pdf([], config)
        election['rows'] = rows
        acc[pdf] = election
        return acc

    return reduce(build_election_result, manual_pdfs, {})

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-g',
                        '--generate',
                        action='store_true',
                        help='Generate nj_pdf_data.json file')
    parser.add_argument('-s',
                        '--save',
                        action='store_true',
                        help='Save nj_pdf_data.json data to database')
    args = parser.parse_args()

    if args.generate:
        generated = generate()
        manually_loaded = manual_load()
        generated.update(manually_loaded)
        save('config/nj_pdf_data.json', generated)
    elif args.save:
        elections = utils.file_to_json('config/nj_pdf_data.json')
        for _, election in elections.iteritems():
            er.save(
                candidates=election['candidates'],
                db=db,
                parties=election['parties'],
                election=election['election'],
                rows=election['rows']
            )
    sys.exit()
