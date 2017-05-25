# SAMPLE CALL
#
# http://api.census.gov/data/2015/acs5/profile
# ?get=DP04_0001E,NAME
# &for=state+legislative+district+(upper+chamber):*
# &in=state:01
# &key=ACS_API_KEY

# MORE INFORMATION HERE
#
# https://docs.google.com/spreadsheets/d/177Enys9L3UfaPNaGbXLE8zJHc-tLzO206Zum9NbQPXI/edit?usp=sharing

import configparser
import logging
import os
import sys

import requests
import state_config
import pandas as pd


def main(year):
    # list of state FIPS codes
    state_codes = {k: v['numeric_code'] for k, v in state_config.state_fips_codes.items()
                   if v['status'] == 'State'}

    # parse config
    config = configparser.ConfigParser()
    config.read('acs_config.ini')
    field_filename = config['full']['field_file']
    field_df = pd.read_csv(field_filename, sep='\t', index_col=0)
    max_api_fields = int(config['full']['max_api_fields_per_get'])
    url = config[year]['url']
    row_key = config['full']['row_key']
    get_vars = [f for f in config[year]['fields'].split('\n') if f]

    # data to call
    # TODO: move to config?
    for_hierarchies = [
        ['state+legislative+district+(upper+chamber):*', 'upper_chamber'],
        ['state+legislative+district+(lower+chamber):*', 'lower_chamber']
    ]

    try:
        acs_key = os.environ['ACS_API_KEY']
    except KeyError:
        logging.error('ACS_API_KEY must be set')
        sys.exit(1)

    # loop through levels and states
    for hierarchy in for_hierarchies:
        all_results = pd.DataFrame()
        for state, state_code in state_codes.items():
            logging.info('running:%s', state)
            state_result = get_acs(acs_key, row_key, get_vars, hierarchy,
                                   state_code, url, max_api_fields)
            all_results = pd.concat([all_results, state_result])

        # write to csv
        all_results = translate_columns(all_results, field_df)
        all_results.to_csv(hierarchy[1] + '_' + year + '.csv', index=False)


def translate_columns(target_df, field_df):
    # note that data_label field has been manually added to the dataset
    # for some, but not all columns
    columns = target_df.columns
    new_columns = []
    for col in columns:
        if col in field_df.index:
            new_columns.append(field_df.loc[col, 'data_label'])
        else:
            new_columns.append(col)
    target_df.columns = new_columns
    return target_df


# function to get list of variables appended by state
def get_acs(acs_key, row_key, get_vars, for_hierarchy, state_code, url, max_fields):

    get_splits = [get_vars[x:x+max_fields] for x in range(0, len(get_vars), max_fields)]
    results = pd.DataFrame()

    for field_list in get_splits:
        gets = [row_key] + field_list

        payload = {
            'get': ",".join(gets),
            'for': for_hierarchy[0],
            'in': 'state:' + state_code,
            'key': acs_key,
        }
        payload_str = "&".join("%s=%s" % (k, v) for k, v in payload.items())

        # occasionally throws errors
        # TODO: handle problematic returns
        try:
            # grab output in json format
            logging.info('requesting %d fields', len(field_list))
            resp = requests.get(url, params=payload_str)
            req_return = resp.json()
            req_df = pd.DataFrame(req_return[1:], columns=req_return[0])
            if results.empty:
                results = req_df
            else:
                cols_to_use = req_df.columns.difference(results.columns).union([row_key])
                results = results.merge(req_df[cols_to_use], on=row_key)
        except:
            logging.error('ACS request failed')

    return results

if __name__ == '__main__':
    logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)
    if len(sys.argv) == 1:
        YEAR = '2015'
    else: 
        YEAR = sys.argv[1]
    main(YEAR)
