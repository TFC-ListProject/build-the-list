import psycopg2
import psycopg2.extras
import re

def query(cursor, t, condition = 'true'):
  cursor.execute('SELECT * FROM ' + t + ' where ' + condition)
  return cursor.fetchall()

def normalize_party(party):
  mapping = {
    "Va.": "virginia",
    "Green": "green party",
    "L": "libertarian party",
    "R": "republican",
    "D": "democratic",
    "Ind. Green": "independent green",
    "I": "independent",
    "Const.": "constitution party"
  }
  return mapping[party]

def normalize_election_type(election_type):
  mapping = {
    "US President - Regular General": "us president",
    "Attorney General - Regular General": "state attorney general",
    "US Senator - Regular General": "us senate",
    "Lt. Governor - Regular General": "state lieutenant governor",
    "Governor - Regular General": "state governor"
  }
  return mapping[election_type]

def normalize_name(first_name, last_name):
  return {
    'firstname': first_name.lower().strip(),
    'lastname': last_name.lower().strip()
  }

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
      VALUES (%(election_type)s)
      ON CONFLICT DO NOTHING""",
      {'election_type': election_type}
    )
  con.commit()
  election_type_to_id = {}
  for row in query(cursor, 'election_types'):
    election_type_to_id[row['name']] = row['id']
  return election_type_to_id

def update_districts_in_db(con, cursor, district_type_id, red_years_districts):
  for red_year in red_years_districts:
    for district_number in red_years_districts[red_year]:
      cursor.execute("""
        INSERT INTO districts (district_type_id, redistricting_year, district_number, state)
        VALUES (%(district_type_id)s, %(redistricting_year)s, %(district_number)s, %(state)s)
        ON CONFLICT DO NOTHING""",
        {
          'district_type_id': district_type_id,
          'redistricting_year': red_year,
          'district_number': district_number,
          'state': 'va'
        }
      )
  district_and_year_to_id = {}
  for row in query(cursor, 'districts', "state = 'va'"):
    key = str(row['district_number']) + ':' + str(row['redistricting_year'])
    district_and_year_to_id[key] = row['id']
  return district_and_year_to_id

def update_elections_in_db(con, cursor, election_names):
  cursor.executemany("""
    INSERT INTO elections (election_type_id, year, state)
    VALUES (%(election_type_id)s, %(year)s, %(state)s)
    ON CONFLICT DO NOTHING""",
    election_names.values()
  )
  con.commit()
  return query(cursor, 'elections', "state = 'va'")

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
    VALUES (%(candidate_id)s, %(election_id)s, %(party_id)s, %(dollars)s, %(incumbent)s)
    ON CONFLICT (candidate_id, election_id) DO UPDATE
    SET dollars = %(dollars)s, incumbent = %(incumbent)s""",
    candidates_elections
  )
  cursor.executemany("""
    INSERT INTO district_election_results
    (candidate_id, election_id, district_id, votes, percentage, withdrew, won)
    VALUES (%(candidate_id)s, %(election_id)s, %(district_id)s, %(votes)s, %(percentage)s,
    %(withdrew)s, %(won)s)
    ON CONFLICT (candidate_id, election_id, district_id) DO UPDATE
    SET votes = %(votes)s, percentage = %(percentage)s, withdrew = %(withdrew)s, won = %(won)s""",
    district_election_results
  )
  con.commit()

def redistricting_year(year):
  return (year / 10) * 10 + 1

def main():
  con = psycopg2.connect(
    host='localhost',
    database='buildthelist_development',
    user='techforcampaigns'
  )
  cursor = con.cursor(cursor_factory=psycopg2.extras.DictCursor)

  cursor.execute("INSERT INTO district_types (name) VALUES ('state lower house') ON CONFLICT DO NOTHING")
  con.commit()
  cursor.execute("SELECT * FROM district_types WHERE name = 'state lower house'")
  district_type_id = cursor.fetchone()['id']

  candidate_names = {}
  election_types = set()
  parties = set()
  red_years_districts = {}
  dhc = query(cursor, 'raw_district_house_candidates')
  for row in dhc:
    candidate_names[row['firstname'] + ' ' + row['lastname']] = normalize_name(row['firstname'], row['lastname'])

    election_types.add('state lower house') # TODO: distinguish btw regular and special elections?

    parties.add(normalize_party(row['party']))

    red_year = redistricting_year(row['year'])
    if red_year not in red_years_districts:
      red_years_districts[red_year] = set()
    red_years_districts[red_year].add(row['district'])

  candidate_name_to_id = update_candidates_in_db(con, cursor, candidate_names)
  election_type_to_id = update_election_types_in_db(con, cursor, election_types)
  party_to_id = update_parties_in_db(con, cursor, parties)
  district_and_red_year_to_id = update_districts_in_db(con, cursor, district_type_id, red_years_districts)

  election_names = {}
  for row in dhc:
    election_type_id = election_type_to_id['state lower house']
    election_name = str(row['year']) + ':' + str(election_type_id)
    election_names[election_name] = {
      'election_type_id': election_type_id,
      'year': row['year'],
      'state': 'va'
    }

  elections = update_elections_in_db(con, cursor, election_names)
  election_type_and_year_to_id = get_election_type_and_year_to_id(elections, election_type_to_id)

  candidates_elections = []
  district_election_results = []
  for row in dhc:
    year = row['year']
    name = normalize_name(row['firstname'], row['lastname'])
    candidate_id = candidate_name_to_id[name['firstname'] + ' ' + name['lastname']]
    election_id = election_type_and_year_to_id[
      str(year) + ' state lower house'
    ]
    party_id = party_to_id[normalize_party(row['party'])]
    district_and_red_year = str(row['district']) + ':' + str(redistricting_year(year))
    district_id = district_and_red_year_to_id[district_and_red_year]

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
  swc = query(cursor, 'raw_statewide_candidates')
  for row in swc:
    # don't bother collecting district names here, because the processing of
    # district_house_candidates already got them all

    m = p_name.match(row['candidatename'])
    candidate_names[row['candidatename']] = normalize_name(m.group(1), m.group(2))

    m = p_election.match(row['electionname'])
    election_types.add(normalize_election_type(m.group(2)))

    parties.add(normalize_party(row['candidateparty']))

  candidate_name_to_id = update_candidates_in_db(con, cursor, candidate_names)
  election_type_to_id = update_election_types_in_db(con, cursor, election_types)
  party_to_id = update_parties_in_db(con, cursor, parties)

  election_names = {}
  for row in swc:
    m = p_election.match(row['electionname'])
    election_type_id = election_type_to_id[normalize_election_type(m.group(2))]
    election_name = m.group(1) + ':' + str(election_type_id)
    election_names[election_name] = {
      'election_type_id': election_type_id,
      'year': m.group(1),
      'state': 'va'
    }

  elections = update_elections_in_db(con, cursor, election_names)
  election_type_and_year_to_id = get_election_type_and_year_to_id(elections, election_type_to_id)

  candidates_elections = []
  district_election_results = []
  for row in swc:
    m = p_name.match(row['candidatename'])
    name = normalize_name(m.group(1), m.group(2))
    candidate_id = candidate_name_to_id[name['firstname'] + ' ' + name['lastname']]
    m = p_election.match(row['electionname'])
    election_id = election_type_and_year_to_id[m.group(1) + ' ' + normalize_election_type(m.group(2))]

    party_id = party_to_id[normalize_party(row['candidateparty'])]
    red_year = str(redistricting_year(int(m.group(1))))
    district_id = district_and_red_year_to_id[str(row['district']) + ':' + red_year]

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
      'withdrew': False,
      'won': None
    })

  update_election_results(con, cursor, candidates_elections, district_election_results)

if __name__ == "__main__": main()
