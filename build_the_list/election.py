import re

def from_pdf(rows, config):
    return {
        'candidates': get_candidates(config),
        'election': get_election(config),
        'parties': get_parties(config),
        'rows': get_rows(rows, config),
    }

def get_candidates(config):
    return config['candidates']

def get_election(config):
    return {
        'state': config['state'],
        'type': config['type'],
        'year': config['year'],
    }

def get_parties(config):
    return config['parties']

def get_rows(rows, config):
    county_indices = config['county_indices']
    skip_row_indices = config['skip_row_indices']
    current_county = config['county']
    results = []

    for i, row in enumerate(rows):
        # print(i, row) # uncomment to inspect row
        if i in skip_row_indices:
            pass
        elif i in county_indices:
            current_county = row
        elif skip_row(row):
            pass
        else:
            parsed_row = extract_row(row)
            parsed_row['district'] = config['district']['name']
            parsed_row['district_type'] = config['district']['type']
            parsed_row['county'] = current_county

            results.append(flatten_row(parsed_row))

    return results

def extract_row(row):
    total_row_re = r'(?<=\d)([a-zA-Z]+\stotal.+$)'
    name_with_votes_re = r'(\D+)(\d.+$)'

    if re.search(total_row_re, row, re.IGNORECASE):
        row = re.sub(total_row_re, '', row, flags=re.IGNORECASE)

    match = re.search(
        name_with_votes_re,
        row,
        re.IGNORECASE
    )

    municipality = match.group(1).strip()
    votes = map(int, match.group(2).replace(',', '').split(' '))

    return {
        'municipality': municipality,
        'votes': votes,
    }

def flatten_row(row):
    return [
        row['district'],
        row['district_type'],
        row['county'],
        row['municipality'],
    ] + row['votes']

def skip_row(row):
    return re.search(r'^\D+total', row, re.IGNORECASE) is not None
