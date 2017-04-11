import records
from repositories.candidate import Candidate
from repositories.county import County
from repositories.election import Election
from repositories.municipality import Municipality
from repositories.party import Party

def db():
    return records.Database('postgres://localhost:5432/buildthelist_development?user=techforcampaigns')

def save(candidates, parties, votes):
    DB = db()
    DB.query('TRUNCATE candidates RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE counties RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE county_election_results RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE district_types RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE districts RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE district_election_results RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE elections RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE municipalities RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE municipality_election_results RESTART IDENTITY CASCADE')
    DB.query('TRUNCATE parties RESTART IDENTITY CASCADE')

    t = DB.transaction()
    print('BEGIN TRANSACTION')

    election = Election(DB)
    election_id = election.save({
        'type': 'Presidential',
        'year': 2016,
        'state': 'NJ',
    })

    for i, c in enumerate(candidates):
        candidate_id = Candidate(DB).save(c)
        party_id = Party(DB).save({
            'name': parties[i]
        })
        election.add_candidate({
            'candidate_id': candidate_id,
            'election_id': election_id,
            'party_id': party_id
        })

        county = County(DB)
        county_id = county.save({ 'name': 'atlantic county' })
        county.add_election_result({
            'candidate_id': candidate_id,
            'county_id': county_id,
            'election_id': election_id,
            'votes': reduce(lambda acc, row: acc + reduce(lambda x, y: x + y, row), votes.values(), 0)
        })

        # district = District(DB)
        # district.save({
            # 'type': '',
            # 'name': '',
            # 'state': 'nj',
        # })
        # District.add_county({
            # 'county_id': county_id,
            # 'district_id': district_id,
        # })
        # District.add_election_result({
            # 'candidate_id': candidate_id,
            # 'district_id': district_id,
            # 'election_id': election_id,
            # 'votes': reduce(lambda acc, row: acc + reduce(lambda x, y: x + y, row), votes.values(), 0)
        # })

        for key, value in votes.iteritems():
            municipality = Municipality(DB)
            municipality_id = municipality.save({
                'county_id': county_id,
                'name': key,
            })
            municipality.add_election_result({
                'candidate_id': candidate_id,
                'election_id': election_id,
                'municipality_id': municipality_id,
                'votes': value[i],
            })

    print('END TRANSACTION')
    t.commit()
