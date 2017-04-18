import json

def get_config(pdf_name):
    return _open_config('config/pdf_meta.json')[pdf_name]

def _open_config(file_name):
    with open(file_name, 'r') as f:
        return json.load(f)

def debug(extracted_pdf):
    for row in extracted_pdf:
        print("'" + row + "',")

def preprocess(extracted_pdf):
    for i, row in enumerate(extracted_pdf):
        print(str(i), ': ' + row)
