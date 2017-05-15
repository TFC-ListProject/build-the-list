import psycopg2
import psycopg2.extras
import pdb
import re

def find_district(muni, county, muni_to_district):
  for suffix in ['', ' city', ' borough', ' township', ' town']:
    for add_county in [False, True]:
      key = muni + suffix
      if add_county:
        key = key + ' (' + county + ')'
      if key in muni_to_district:
        return muni_to_district[key]
  return None

def populate_districts(con, cur):
  cur.execute("SELECT id FROM district_types WHERE name = 'legislative'")
  district_type_id = cur.fetchone()['id']

  cur.execute("SELECT DISTINCT district FROM municipality_district")
  for row in cur.fetchall():
    name = row['district']
    cur.execute("""
      INSERT INTO districts (state, district_type_id, name)
      VALUES ('NJ', %(district_type_id)s, %(name)s)
      ON CONFLICT DO NOTHING""",
      {'district_type_id': district_type_id, 'name': name}
    )
    con.commit()

  cur.execute("""
    SELECT * FROM districts
    WHERE district_type_id = %(district_type_id)s
    AND state = 'NJ'""",
    {'district_type_id': district_type_id}
  )
  district_to_id = {}
  for row in cur.fetchall():
    district_num = int(row['name'].replace('District ', ''))
    district_to_id[district_num] = row['id']
  return district_to_id

def main():
  con = psycopg2.connect(
    host='localhost',
    database='buildthelist_development',
    user='techforcampaigns',
  )
  cur = con.cursor(cursor_factory=psycopg2.extras.DictCursor)

  district_to_id = populate_districts(con, cur)

  muni_to_district = {}

  cur.execute("SELECT * FROM municipality_district")
  for md in cur.fetchall():
    muni = md['municipality'].lower().replace(' (partial)', '')
    muni_to_district[muni] = int(md['district'].replace('District ', ''))

  cur.execute("""
    SELECT mer.candidate_id, mer.election_id, mer.votes, m.name AS muni_name, C.name as county_name
    FROM municipality_election_results mer
    JOIN municipalities m ON mer.municipality_id = m.id
    JOIN counties c ON m.county_id = c.id""")
  hit = 0
  miss = 0
  district_tallies = {}
  for mer in cur.fetchall():
    candidate_id = mer['candidate_id']
    election_id = mer['election_id']
    muni = re.sub('twp\.?$', 'township', mer['muni_name'])
    muni = re.sub('boro$', 'borough', muni)
    muni = re.sub('\s+', ' ', muni)
    muni = muni.replace('phillpsburg', 'phillipsburg').replace('hacketstown', 'hackettstown')
    muni = muni.replace('city of ', '').replace('plainsborough', 'plainsboro')
    muni = muni.replace(' town of', ' town').replace('e. ', 'east ')
    muni = muni.replace('south orange', 'south orange village').replace('patterson', 'paterson')
    muni = muni.replace('teterborough', 'teterboro')
    if muni == 'orange':
      muni = 'city of orange'
    county = mer['county_name'].replace(' county', '')
    district_num = find_district(muni, county, muni_to_district)
    if district_num:
      hit = hit+1
      if district_num not in district_tallies:
        district_tallies[district_num] = {}
      district_dict = district_tallies[district_num]
      if election_id not in district_dict:
        district_dict[election_id] = {}
      election_dict = district_dict[election_id]
      if candidate_id not in election_dict:
        election_dict[candidate_id] = 0
      election_dict[candidate_id] = election_dict[candidate_id] + mer['votes']
    else:
      miss = miss+1
      print "Can't match " + muni

  rows_to_insert = []
  for district_num in district_tallies:
    for election_id in district_tallies[district_num]:
      for candidate_id in district_tallies[district_num][election_id]:
        district_id = district_to_id[district_num]
        rows_to_insert.append({
          'district_id': district_id,
          'election_id': election_id,
          'candidate_id': candidate_id,
          'votes': district_tallies[district_num][election_id][candidate_id]
        })
  cur.executemany("""
    INSERT INTO district_election_results (district_id, election_id, candidate_id, votes)
    VALUES (%(district_id)s, %(election_id)s, %(candidate_id)s, %(votes)s)
    ON CONFLICT DO NOTHING""",
    rows_to_insert
  )
  con.commit()
  print 'Hit: ' + str(hit)
  print 'Miss: ' + str(miss)

if __name__ == "__main__": main()
