import build_the_list.db as db
import conftest
import pytest
import records

DB = records.Database('postgres://localhost:5432/buildthelist_test?user=techforcampaigns')

def setup_function(module):
    for table in [
        'candidates',
        'counties',
        'election_types',
        'elections',
        'municipalities',
        'municipality_election_results',
        'parties'
    ]:
        DB.query('TRUNCATE {} RESTART IDENTITY CASCADE'.format(table))
