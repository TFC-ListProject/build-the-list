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

import requests
import urllib
import csv
import os
import logging
import sys

def main():
    # list of state FIPS codes
    state_codes = ['01','02','04','05','06','08','09','10','11','12','13','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','44','45','46','47','48','49','50','51','53','54','55','56']

    # list of get variables
    # TODO: rework to handle variables over 50 var max
    get_vars = ['DP04_0002E','DP05_0001E','DP05_0002E','DP05_0003E','DP05_0082E','DP05_0083E','DP05_0084E','DP03_0063E','DP03_0062E','DP05_0028E','DP05_0029E','DP05_0030E','DP05_0031E','DP05_0032E','DP05_0033E','DP05_0034E','DP05_0039E','DP05_0047E','DP05_0052E','DP05_0053E','DP05_0054E','DP05_0055E','DP05_0056E','DP05_0057E','DP05_0058E','DP05_0059E','DP05_0060E','DP05_0061E','DP05_0062E','DP05_0063E','DP05_0064E','DP05_0065E','DP05_0066E','DP05_0071E','DP05_0072E','DP05_0073E','DP05_0074E','DP05_0075E','DP05_0076E','DP05_0077E','DP05_0078E','DP05_0079E','DP05_0080E']
    get_string = "NAME," + ",".join(get_vars)

    # data to call
    for_hierarchies = [['state+legislative+district+(upper+chamber):*','upper_chamber'],['state+legislative+district+(lower+chamber):*','lower_chamber']]

    url = 'http://api.census.gov/data/2015/acs5/profile'
    prep, s = make_session(url)

    try:
        acs_key = os.environ['ACS_API_KEY']
    except:
        logging.error('ACS_API_KEY must be set')
        sys.exit(1)

    # loop through levels and states
    for hierarchy in for_hierarchies:
        for state in state_codes:
            get_acs(acs_key, get_string, hierarchy, state, url, prep, s)

# set up session
def make_session(url):
    s = requests.Session()
    req = requests.Request(method='GET', url=url)
    prep = req.prepare()
    return prep, s

# function to get list of variables appended by state, new csv by hierarchy
def get_acs(acs_key, get_string, for_hierarchy, state_code, url, prep, s):
    in_var = 'state:' + state_code

    payload = {
        'get': get_string,
        'for': for_hierarchy[0],
        'in': in_var,
        'key': acs_key,
    }

    # translate url encoding back for plus sign
    qry = urllib.urlencode(payload).replace('%2B', '+')
    prep.url = url + '?' + qry

    # occasionally throws errors
    # TODO: handle problematic returns
    try:
        # get output
        r = s.send(prep)
        # grab output in json format
        req_return = r.json()
        # if not first state, drop the header
        if(state_code != '01'): req_return.pop(0)

        # write to csv
        # TODO: concatenation across 50+ variables
        out_file = for_hierarchy[1] + '.csv'
        with open(out_file, 'a') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerows(req_return)
    except: pass

if __name__ == '__main__':
    main()
