import psycopg2
import psycopg2.extras
import re

def query(cursor, t):
  cursor.execute('SELECT * FROM ' + t)
  return cursor.fetchall()

def update_parties_in_db(con, cursor, parties):
  for party in parties:
    cursor.execute("""
      INSERT INTO parties (name)
      VALUES (%(party)s)
      ON CONFLICT DO NOTHING""",
      {'party': party}
    )
  con.commit()
  party_to_id = {}
  for row in query(cursor, 'parties'):
    party_to_id[row['name']] = row['id']
  return party_to_id

def update_candidates_in_db(con, cursor, candidate_names):
  cursor.executemany("""
    INSERT INTO candidates (first_name, last_name)
    VALUES (%(firstname)s, %(lastname)s)
    ON CONFLICT DO NOTHING""",
    candidate_names.values()
  )
  con.commit()
  candidate_name_to_id = {}
  for row in query(cursor, 'candidates'):
    candidate_name_to_id[row['first_name'] + ' ' + row['last_name']] = row['id']
  return candidate_name_to_id

def update_election_types_in_db(con, cursor, election_types):
  for election_type in election_types:
    cursor.execute("""
      INSERT INTO election_types (name)
      VALUES (%(election_type)s)""",
      {'election_type': election_type}
    )
  con.commit()
  election_type_to_id = {}
  for row in query(cursor, 'election_types'):
    election_type_to_id[row['name']] = row['id']
  return election_type_to_id

def update_districts_in_db(con, cursor, district_type_id, districts):
  for district in districts:
    cursor.execute("""
      INSERT INTO districts (district_type_id, name, state)
      VALUES (%(district_type_id)s, %(name)s, %(state)s)
      ON CONFLICT DO NOTHING""",
      {'district_type_id': district_type_id, 'name': str(district), 'state': 'VA'}
    )
  district_to_id = {}
  for row in query(cursor, 'districts'):
    district_to_id[int(row['name'])] = row['id']
  return district_to_id

def update_elections_in_db(con, cursor, election_names):
  cursor.executemany("""
    INSERT INTO elections (election_type_id, year, state)
    VALUES (%(election_type_id)s, %(year)s, %(state)s)""",
    election_names.values()
  )
  con.commit()
  return query(cursor, 'elections')

def get_election_type_and_year_to_id(elections, election_type_to_id):
  election_type_id_to_name = dict((v, k) for k, v in election_type_to_id.items())
  election_type_and_year_to_id = {}
  for row in elections:
    type_name = election_type_id_to_name[row['election_type_id']]
    election_type_and_year_to_id[str(row['year']) + ' ' + type_name] = row['id']
  return election_type_and_year_to_id

def update_election_results(con, cursor, candidates_elections, district_election_results):
  cursor.executemany("""
    INSERT INTO candidates_elections
    (candidate_id, election_id, party_id, dollars, incumbent)
    VALUES (%(candidate_id)s, %(election_id)s, %(party_id)s, %(dollars)s, %(incumbent)s)""",
    candidates_elections
  )
  cursor.executemany("""
    INSERT INTO district_election_results
    (candidate_id, election_id, district_id, votes, percentage, withdrew, won)
    VALUES (%(candidate_id)s, %(election_id)s, %(district_id)s, %(votes)s, %(percentage)s,
    %(withdrew)s, %(won)s)""",
    district_election_results
  )
  con.commit()

def main():
  con = psycopg2.connect(
    host='localhost',
    database='vpap_spider',
    user='scrapy',
    password='Scr@py!'
  )
  cursor = con.cursor(cursor_factory=psycopg2.extras.DictCursor)

  cursor.execute("INSERT INTO district_types (name) VALUES ('state house')")
  con.commit()
  cursor.execute("SELECT * FROM district_types WHERE name = 'state house'")
  district_type_id = cursor.fetchone()['id']

  candidate_names = {}
  election_types = set()
  parties = set()
  districts = set()
  dhc = query(cursor, 'district_house_candidates')
  for row in dhc:
    candidate_name = row['firstname'] + ' ' + row['lastname']
    candidate_names[candidate_name] = { k: row[k] for k in ['firstname', 'lastname'] }

    election_types.add('state house ' + row['electiontype'])

    parties.add(row['party'])

    districts.add(row['district'])

  candidate_name_to_id = update_candidates_in_db(con, cursor, candidate_names)
  election_type_to_id = update_election_types_in_db(con, cursor, election_types)
  party_to_id = update_parties_in_db(con, cursor, parties)
  district_to_id = update_districts_in_db(con, cursor, district_type_id, districts)

  election_names = {}
  for row in dhc:
    election_type_id = election_type_to_id['state house ' + row['electiontype']]
    election_name = str(row['year']) + ':' + str(election_type_id)
    election_names[election_name] = {
      'election_type_id': election_type_id,
      'year': row['year'],
      'state': 'VA'
    }

  elections = update_elections_in_db(con, cursor, election_names)
  election_type_and_year_to_id = get_election_type_and_year_to_id(elections, election_type_to_id)

  candidates_elections = []
  district_election_results = []
  for row in dhc:
    candidate_id = candidate_name_to_id[row['firstname'] + ' ' + row['lastname']]
    election_id = election_type_and_year_to_id[
      str(row['year']) + ' state house ' + row['electiontype']
    ]
    party_id = party_to_id[row['party']]
    district_id = district_to_id[row['district']]

    candidates_elections.append({
      'candidate_id': candidate_id,
      'election_id': election_id,
      'party_id': party_id,
      'dollars': row['dollars'],
      'incumbent': row['wasincumbent']
    })

    district_election_results.append({
      'candidate_id': candidate_id,
      'election_id': election_id,
      'district_id': district_id,
      'votes': row['numvotes'] or 0,
      'percentage': row['percentage'] or 0,
      'withdrew': row['withdrew'],
      'won': row['waswinner']
    })

  update_election_results(con, cursor, candidates_elections, district_election_results)

  # now process state-wide candidates

  p_name = re.compile('([^,]*) (.*)')
  p_election = re.compile('(\d{4}) (.*)')
  candidate_names = {}
  election_types = set()
  parties = set()
  swc = query(cursor, 'statewide_candidates')
  for row in swc:
    # don't bother collecting district names here, because the processing of
    # district_house_candidates already got them all

    m = p_name.match(row['candidatename'])
    candidate_names[row['candidatename']] = { 'firstname': m.group(1), 'lastname': m.group(2) }

    m = p_election.match(row['electionname'])
    election_types.add(m.group(2))

    parties.add(row['candidateparty'])

  candidate_name_to_id = update_candidates_in_db(con, cursor, candidate_names)
  election_type_to_id = update_election_types_in_db(con, cursor, election_types)
  party_to_id = update_parties_in_db(con, cursor, parties)

  election_names = {}
  for row in swc:
    m = p_election.match(row['electionname'])
    election_type_id = election_type_to_id[m.group(2)]
    election_name = m.group(1) + ':' + str(election_type_id)
    election_names[election_name] = {
      'election_type_id': election_type_id,
      'year': m.group(1),
      'state': 'VA'
    }

  elections = update_elections_in_db(con, cursor, election_names)
  election_type_and_year_to_id = get_election_type_and_year_to_id(elections, election_type_to_id)

  candidates_elections = []
  district_election_results = []
  for row in swc:
    candidate_id = candidate_name_to_id[row['candidatename']]
    election_id = election_type_and_year_to_id[row['electionname']]

    party_id = party_to_id[row['candidateparty']]
    district_id = district_to_id[row['district']]

    candidates_elections.append({
      'candidate_id': candidate_id,
      'election_id': election_id,
      'party_id': party_id,
      'dollars': None,
      'incumbent': None
    })

    district_election_results.append({
      'candidate_id': candidate_id,
      'election_id': election_id,
      'district_id': district_id,
      'votes': row['numvotes'] or 0,
      'percentage': row['percentage'] or 0,
      'withdrew': None,
      'won': None
    })

  update_election_results(con, cursor, candidates_elections, district_election_results)

if __name__ == "__main__": main()
