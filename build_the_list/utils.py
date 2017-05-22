import json

def get_config(pdf_name):
    return file_to_json('config/pdf_meta.json')[pdf_name]

def file_to_json(file_name):
    with open(file_name, 'r') as f:
        return json.load(f)

def json_to_file(file_name, data):
    with open(file_name, 'w') as f:
        return json.dump(data, f)

def debug(extracted_pdf):
    for row in extracted_pdf:
        print("'" + row + "',")

def preprocess(extracted_pdf):
    for i, row in enumerate(extracted_pdf):
        print(str(i), ': ' + row)
