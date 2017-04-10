import psycopg2
import psycopg2.extras

def query(cursor, t):
  cursor.execute('SELECT * FROM ' + t)
  return cursor.fetchall()

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

    election_types.add(row['electiontype'])

    parties.add(row['party'])

    districts.add(row['district'])

  cursor.executemany("""
    INSERT INTO candidates (first_name, last_name)
    VALUES (%(firstname)s, %(lastname)s)""",
    candidate_names.values()
  )

  for election_type in election_types:
    cursor.execute("""
      INSERT INTO election_types (name)
      VALUES (%(election_type)s)""",
      {'election_type': 'state house ' + election_type}
    )

  for party in parties:
    cursor.execute("""
      INSERT INTO parties (name)
      VALUES (%(party)s)""",
      {'party': party}
    )

  for district in districts:
    cursor.execute("""
      INSERT INTO districts (district_type_id, name, state)
      VALUES (%(district_type_id)s, %(name)s, %(state)s)""",
      {'district_type_id': district_type_id, 'name': str(district), 'state': 'VA'}
  )

  con.commit()

  candidate_name_to_id = {}
  for row in query(cursor, 'candidates'):
    candidate_name_to_id[row['first_name'] + ' ' + row['last_name']] = row['id']

  election_type_to_id = {}
  for row in query(cursor, 'election_types'):
    election_type_to_id[row['name']] = row['id']

  party_to_id = {}
  for row in query(cursor, 'parties'):
    party_to_id[row['name']] = row['id']

  district_to_id = {}
  for row in query(cursor, 'districts'):
    district_to_id[int(row['name'])] = row['id']

  election_names = {}
  for row in dhc:
    election_type_id = election_type_to_id['state house ' + row['electiontype']]
    election_name = str(row['year']) + ':' + str(election_type_id)
    election_names[election_name] = {
      'election_type_id': election_type_id,
      'year': row['year'],
      'state': 'VA'
    }

  cursor.executemany("""
    INSERT INTO elections (election_type_id, year, state)
    VALUES (%(election_type_id)s, %(year)s, %(state)s)""",
    election_names.values()
  )
  con.commit()

  election_type_id_to_name = dict((v, k) for k, v in election_type_to_id.items())
  election_type_and_year_to_id = {}
  for row in query(cursor, 'elections'):
    type_name = election_type_id_to_name[row['election_type_id']]
    election_type_and_year_to_id[str(row['year']) + type_name] = row['id']

  candidates_elections = []
  district_election_results = []
  for row in dhc:
    candidate_id = candidate_name_to_id[row['firstname'] + ' ' + row['lastname']]
    election_id = election_type_and_year_to_id[
      str(row['year']) + 'state house ' + row['electiontype']
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
      'won': row['waswinner'] or False
    })

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

if __name__ == "__main__": main()
