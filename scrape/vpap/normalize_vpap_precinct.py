import psycopg2
import psycopg2.extras
import re
import pdb

def query(cursor, t):
  cursor.execute('SELECT * FROM ' + t)
  return cursor.fetchall()

def normalize_party(party):
  if party == 'Democrat':
    party = 'democratic'
  return party.lower()

# copied from normalize_vpap.py (will refactor later?)
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

# copied from normalize_vpap.py
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

def redistricting_year(year):
  return (year / 10) * 10 + 1

def get_district_num_and_red_year_to_district_id(con, cursor, district_type):
  cursor.execute("""
    INSERT INTO district_types (name) VALUES (%(district_type)s) ON CONFLICT DO NOTHING""",
    {'district_type': district_type}
  )
  con.commit()
  cursor.execute("""
    SELECT * FROM district_types WHERE name = %(district_type)s""",
    {'district_type': district_type}
  )
  district_type_id = cursor.fetchone()['id']

  cursor.execute("""
    SELECT DISTINCT districtnumber, year FROM raw_precinct_vote WHERE districttype = %(district_type)s""",
    {'district_type': district_type}
  )
  for row in cursor.fetchall():
    red_year = redistricting_year(row['year'])
    cursor.execute("""
      INSERT INTO districts (district_type_id, redistricting_year, district_number, state)
      VALUES (%(district_type_id)s, %(red_year)s, %(number)s, 'va')
      ON CONFLICT DO NOTHING""",
      {'district_type_id': district_type_id, 'red_year': red_year, 'number': row['districtnumber']}
    )
  con.commit()

  cursor.execute(
    "SELECT * FROM districts where state = 'va' AND district_type_id = %(district_type_id)s",
    {'district_type_id': district_type_id}
  )
  ret = {}
  for row in cursor.fetchall():
    key = str(row['district_number']) + ':' + str(row['redistricting_year'])
    ret[key] = row['id']

  return ret

def get_usr_district_id_and_year_to_election_id(
  con,
  cursor,
  usr_district_num_and_red_year_to_district_id,
  usr_election_type_id):
  cursor.execute("""
    SELECT DISTINCT year, districtnumber
    FROM raw_precinct_vote
    WHERE districttype = 'us congressional'"""
  )
  for row in cursor.fetchall():
    year = row['year']
    red_year = redistricting_year(year)
    district_number = row['districtnumber']
    key = str(district_number) + ':' + str(red_year)
    district_id = usr_district_num_and_red_year_to_district_id[key]
    cursor.execute("""
      INSERT INTO elections (election_type_id, district_id, year, state)
      VALUES (%(election_type_id)s, %(district_id)s, %(year)s, 'va')
      ON CONFLICT DO NOTHING""",
      {'election_type_id': usr_election_type_id, 'district_id': district_id, 'year': year}
    )
  con.commit()
  cursor.execute(
    "SELECT * FROM elections WHERE state = 'va' AND election_type_id = %(election_type_id)s",
    {'election_type_id': usr_election_type_id}
  )
  ret = {}
  for row in cursor.fetchall():
    ret[str(row['district_id']) + ':' + str(row['year'])] = row['id']
  return ret

def main():
  con = psycopg2.connect(
    host='localhost',
    database='buildthelist_development',
    user='techforcampaigns'
  )
  cursor = con.cursor(cursor_factory=psycopg2.extras.DictCursor)

  cursor.execute("INSERT INTO election_types (name) VALUES ('us congressional') ON CONFLICT DO NOTHING")
  con.commit()
  cursor.execute("SELECT * FROM election_types WHERE name = 'us congressional'")
  usr_election_type_id = cursor.fetchone()['id']

  # populate usr districts
  usr_district_num_and_red_year_to_district_id = \
    get_district_num_and_red_year_to_district_id(con, cursor, 'us congressional')

  # populate hod districts
  hod_district_num_and_red_year_to_district_id = \
    get_district_num_and_red_year_to_district_id(con, cursor, 'state lower house')

  # populate elections
  usr_district_id_and_year_to_election_id = get_usr_district_id_and_year_to_election_id(
    con,
    cursor,
    usr_district_num_and_red_year_to_district_id,
    usr_election_type_id
  )

  # populate parties, candidates, and p_to_h_vote_counts mapping
  p_to_h_vote_counts = {}
  parties = set()
  p_name = re.compile('([^,]*) (.*)')
  candidate_names = {}
  rpv = query(cursor, 'raw_precinct_vote')
  for row in rpv:
    if row['districttype'] == 'us congressional':
      parties.add(normalize_party(row['candidateparty']))

      m = p_name.match(row['candidatename'])
      candidate_names[row['candidatename']] = {
        'firstname': m.group(1).lower(),
        'lastname': m.group(2).lower()
      }
    else:
      precinct_id = row['sourceprecinctid']
      hod_number = row['districtnumber']
      votes = int(row['votes'])
      if precinct_id not in p_to_h_vote_counts:
        p_to_h_vote_counts[precinct_id] = {}
        if hod_number not in p_to_h_vote_counts[precinct_id]:
          p_to_h_vote_counts[precinct_id][hod_number] = votes
        else:
          p_to_h_vote_counts[precinct_id][hod_number] = p_to_h_vote_counts[precinct_id][hod_number] + votes

  party_to_id = update_parties_in_db(con, cursor, parties)
  candidate_name_to_id = update_candidates_in_db(con, cursor, candidate_names)

  # A precinct votes for a U.S. House candidate. Which HoD district to count that toward?
  # If the precinct is linked to multiple HoD districts, assign U.S. House votes proportionally
  # based on the ratio of the number of votes cast in the last few elections for each HoD district.
  precinct_to_hod_shares = {}
  for precinct_id in p_to_h_vote_counts:
    precinct_to_hod_shares[precinct_id] = {}
    total_votes = 0
    for votes in p_to_h_vote_counts[precinct_id].values():
      total_votes = total_votes + votes
    for hod_number in p_to_h_vote_counts[precinct_id]:
      votes = p_to_h_vote_counts[precinct_id][hod_number]
      share = float(votes) / float(total_votes) if total_votes > 0 else 0
      precinct_to_hod_shares[precinct_id][hod_number] = share

  usr_results = {}
  for row in rpv:
    if row['districttype'] != 'us congressional':
      continue
    precinct_id = row['sourceprecinctid']
    if precinct_id not in precinct_to_hod_shares:
      # this would happen if we had US congress results but not HoD results for a precinct
      continue
    hod_shares = precinct_to_hod_shares[precinct_id]
    candidate_id = candidate_name_to_id[row['candidatename'].lower()]
    party_id = party_to_id[normalize_party(row['candidateparty'])]
    district_num = row['districtnumber']
    year = row['year']
    red_year = redistricting_year(year)
    votes = row['votes']

    usr_lookup_key = str(district_num) + ':' + str(red_year)
    usr_district_id = usr_district_num_and_red_year_to_district_id[usr_lookup_key]
    election_id = usr_district_id_and_year_to_election_id[str(usr_district_id) + ':' + str(year)]

    for hod_number in hod_shares:
      hod_district_id = hod_district_num_and_red_year_to_district_id[str(hod_number) + ':' + str(red_year)]
      der_key = str(candidate_id) + ':' + str(hod_district_id) + ':' + str(election_id)
      vote_share = float(votes) * hod_shares[hod_number]
    if der_key not in usr_results:
      usr_results[der_key] = {
        'candidate_id': candidate_id,
        'district_id': hod_district_id,
        'election_id': election_id,
        'year': year,
        'party_id': party_id,
        'votes': vote_share
      }
    else:
      usr_results[der_key]['votes'] = usr_results[der_key]['votes'] + vote_share

  # populate candidates_elections and der
  candidates_elections = []
  district_election_results = []
  for result in usr_results.values():
    candidates_elections.append({
      'candidate_id': result['candidate_id'],
      'election_id': result['election_id'],
      'party_id': result['party_id']
    })
    district_election_results.append({
      'candidate_id': result['candidate_id'],
      'district_id': result['district_id'],
      'election_id': result['election_id'],
      'votes': int(result['votes'])
    })

  cursor.executemany("""
    INSERT INTO candidates_elections
    (candidate_id, election_id, party_id)
    VALUES (%(candidate_id)s, %(election_id)s, %(party_id)s)
    ON CONFLICT DO NOTHING""",
    candidates_elections
  )

  cursor.executemany("""
    INSERT INTO district_election_results
    (candidate_id, election_id, district_id, votes)
    VALUES (%(candidate_id)s, %(election_id)s, %(district_id)s, %(votes)s)""",
    district_election_results
  )

  con.commit();

if __name__ == "__main__": main()

