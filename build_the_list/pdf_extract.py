import os

def extract_pdf_text(file_name):
    tmp_filename = file_name + '.tmp'
    os.system('ps2ascii {} > {}'.format(file_name, tmp_filename))
    lines = []
    with open(tmp_filename) as f:
        for line in f:
            if line != '\n':
                lines.append(line.strip())
    os.remove(tmp_filename)
    return lines
