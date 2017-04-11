from build_the_list.repositories.candidate import Candidate
from build_the_list.repositories.county import County
from build_the_list.repositories.election import Election
from build_the_list.repositories.municipality import Municipality
from build_the_list.repositories.party import Party
import build_the_list.db as db
import conftest
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

# putting all DB tests in here for now since multiple connections tends to freeze the tests
def test_election_save_with_valid_data():
    data = {
        'type': 'Presidential',
        'year': 2016,
        'state': 'NJ',
    }
    Election(DB).save(data)
    election_type_result = DB.query("SELECT * FROM election_types LIMIT 1").as_dict()[0]
    election_type_expected = {
        'id': election_type_result['id'],
        'name': 'presidential'
    }

    election_result = DB.query("SELECT * FROM elections LIMIT 1").as_dict()[0]
    election_expected = {
        'id': election_result['id'],
        'election_type_id': election_type_result['id'],
        'year': 2016,
        'state': 'nj',
    }

    assert election_type_result == election_type_expected
    assert election_result == election_expected

def test_election_add_candidate_with_valid_data():
    election = Election(DB)
    election_id = election.save({
        'type': 'presidential',
        'year': 2016,
        'state': 'nj',
    })
    candidate_id = Candidate(DB).save('first last')
    party_id = Party(DB).save({ 'name': 'democratic' })
    election.add_candidate({
        'candidate_id': candidate_id,
        'election_id': election_id,
        'party_id': party_id
    })

    result = DB.query("SELECT * FROM candidates_elections LIMIT 1").as_dict()[0]
    expected = {
        'candidate_id': candidate_id,
        'election_id': election_id,
        'party_id': party_id,
    }

def test_candidate_save_with_valid_data():
    candidate_id = Candidate(DB).save('first middle last')
    result = DB.query("SELECT * FROM candidates LIMIT 1").as_dict()[0]
    expected = {
        'id': candidate_id,
        'first_name': 'first',
        'last_name': 'middle last',
    }

    assert result == expected

def test_party_save_with_valid_data():
    data = {
        'name': 'Democratic',
    }
    party_id = Party(DB).save(data)
    result = DB.query("SELECT * FROM parties LIMIT 1").as_dict()[0]
    expected = {
        'id': party_id,
        'name': 'democratic',
    }

    assert result == expected

def test_county_save_with_valid_data():
    data = {
        'name': 'San Francisco County',
    }
    county_id = County(DB).save(data)
    result = DB.query("SELECT * FROM counties LIMIT 1").as_dict()[0]
    expected = {
        'id': county_id,
        'name': 'san francisco county',
    }

    assert result == expected

def test_county_add_election_result_with_valid_data():
    county = County(DB)
    county_id = county.save({
        'name': 'san francisco county',
    })
    candidate_id = Candidate(DB).save('first last')
    election_id = Election(DB).save({
        'type': 'Presidential',
        'year': 2016,
        'state': 'NJ',
    })
    data = {
        'candidate_id': candidate_id,
        'county_id': county_id,
        'election_id': election_id,
        'votes': 100,
    }
    county.add_election_result(data)
    result = DB.query("SELECT * FROM county_election_results LIMIT 1").as_dict()[0]
    expected = data

    assert result == expected

def test_municipality_save_with_valid_data():
    county_id = County(DB).save({
        'name': 'san francisco county',
    })
    municipality_id = Municipality(DB).save({
        'county_id': county_id,
        'name': 'San Francisco',
    })
    result = DB.query("SELECT * FROM municipalities LIMIT 1").as_dict()[0]
    expected = {
        'id': municipality_id,
        'county_id': county_id,
        'name': 'san francisco',
    }

    assert result == expected

def test_municipality_add_election_result_with_valid_data():
    candidate_id = Candidate(DB).save('first last')
    election_id = Election(DB).save({
        'type': 'Presidential',
        'year': 2016,
        'state': 'NJ',
    })
    county_id = County(DB).save({
        'name': 'san francisco county',
    })
    municipality = Municipality(DB)
    municipality_id = municipality.save({
        'county_id': county_id,
        'name': 'San Francisco',
    })
    data = {
        'candidate_id': candidate_id,
        'election_id': election_id,
        'municipality_id': municipality_id,
        'votes': 100,
    }
    municipality.add_election_result(data)
    result = DB.query("SELECT * FROM municipality_election_results LIMIT 1").as_dict()[0]
    expected = data

    assert result == expected
