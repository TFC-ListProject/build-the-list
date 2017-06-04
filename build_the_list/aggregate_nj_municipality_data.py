import psycopg2
import psycopg2.extras
import re

def find_district(muni, red_year, county, red_year_to_muni_to_district):
  muni_to_district = red_year_to_muni_to_district[red_year]
  for suffix in ['', ' city', ' borough', ' township', ' town', ' village']:
    for add_county in [False, True]:
      key = muni + suffix
      if add_county:
        key = key + ' (' + county + ')'
      if key in muni_to_district:
        return muni_to_district[key]
  return None

def populate_districts(con, cur):
  cur.execute("SELECT id FROM district_types WHERE name = 'state lower house'")
  district_type_id = cur.fetchone()['id']

  cur.execute("""
    SELECT DISTINCT year
    FROM municipality_election_results mer
    JOIN elections e ON mer.election_id = e.id""")
  red_years = set()
  for row in cur.fetchall():
    red_years.add(redistricting_year(row['year']))
  cur.execute("SELECT DISTINCT district FROM municipality_district WHERE state = 'nj'")
  for row in cur.fetchall():
    for red_year in red_years:
      number = row['district']
      cur.execute("""
        INSERT INTO districts (state, redistricting_year, district_type_id, district_number)
        VALUES ('nj', %(red_year)s, %(district_type_id)s, %(number)s)
        ON CONFLICT DO NOTHING""",
        {'red_year': red_year, 'district_type_id': district_type_id, 'number': number}
      )
      con.commit()

  cur.execute("""
    SELECT * FROM districts
    WHERE district_type_id = %(district_type_id)s
    AND state = 'nj'""",
    {'district_type_id': district_type_id}
  )
  district_and_red_year_to_id = {}
  for row in cur.fetchall():
    red_year = str(row['redistricting_year'])
    district_and_red_year_to_id[str(row['district_number']) + ':' + red_year] = row['id']
  return district_and_red_year_to_id

def redistricting_year(year):
  return (year / 10) * 10 + 1

def main():
  con = psycopg2.connect(
    host='localhost',
    database='buildthelist_development',
    user='techforcampaigns',
  )
  cur = con.cursor(cursor_factory=psycopg2.extras.DictCursor)

  district_and_red_year_to_id = populate_districts(con, cur)

  red_year_to_muni_to_district = {}

  cur.execute("SELECT * FROM municipality_district")
  for md in cur.fetchall():
    red_year = md['redistricting_year']
    if red_year not in red_year_to_muni_to_district:
      red_year_to_muni_to_district[red_year] = {}
    muni = md['municipality'].lower().replace(' (partial)', '')
    red_year_to_muni_to_district[red_year][muni] = md['district']

  cur.execute("""
    SELECT mer.candidate_id, mer.election_id, mer.votes, m.name AS muni_name,
      c.name AS county_name, e.year AS year
    FROM municipality_election_results mer
    JOIN municipalities m ON mer.municipality_id = m.id
    JOIN counties c ON m.county_id = c.id
    JOIN elections e ON mer.election_id = e.id""")
  hit = 0
  miss = 0
  misses = set()
  district_tallies = {}
  for mer in cur.fetchall():
    candidate_id = mer['candidate_id']
    election_id = mer['election_id']
    red_year = redistricting_year(mer['year'])
    orig_muni = mer['muni_name']

    if orig_muni == 'federal overseas' or orig_muni == 'total':
      continue

    muni = re.sub('twp\.?$', 'township', orig_muni)
    muni = re.sub(' boro$', ' borough', muni)
    muni = re.sub('\s+', ' ', muni)
    muni = re.sub(',?\s?city of\s?', '', muni)
    muni = re.sub('essex f(a|e)lls.*', 'essex fells', muni)

    replacements = {
      'phillpsburg': 'phillipsburg',
      'hacketstown': 'hackettstown',
      'plainsborough': 'plainsboro',
      ' town of': ' town',
      'e. ': 'east ',
      ' hgts': ' heights',
      'patterson': 'paterson',
      'teterborough': 'teterboro',
      'mt. ': 'mount ',
      'ephriam': 'ephraim',
      'pointpleasant': 'point pleasant',
      'bellevilletownship': 'belleville township',
      'winslowtownship': 'winslow township',
      'riversidetownship': 'riverside township',
      'somerspoint': 'somers point',
      'peapack & gladstone': 'peapack-gladstone',
      'closterboro': 'closter',
      'maywoodboro': 'maywood',
      'cinnnaminson': 'cinnaminson',
      'bedminister': 'bedminster',
      'bayonne city': 'bayonne',
      'pt. pleasant': 'point pleasant',
      ' twn.': ' town',
      'little fallstwp.': 'little falls township',
      'little fallstownship': 'little falls township',
      'seaside parkboro': 'seaside park borough',
      'northfield twp.': 'northfield',
      'northfield township': 'northfield',
      'tavistok': 'tavistock',
      'travistock': 'tavistock',
      'twp. of ': '',
      'salem city- east ward': 'salem',
      'salem city- west ward': 'salem',
      'salem eastward': 'salem',
      'salem westward': 'salem',
      'chesihurst': 'chesilhurst',
      'seagirt': 'sea girt',
      'sayerville': 'sayreville',
      'seabright': 'sea bright',
      'wenoah': 'wenonah',
      'estelle manor': 'estell manor',
      'moorestwon': 'moorestown',
      'peaquannock': 'pequannock',
      'wycoff': 'wyckoff',
      'woodridge': 'wood-ridge',
      'highbridge': 'high bridge',
      'fairlawn': 'fair lawn',
      'hainespirt': 'hainesport',
      'lindenwood': 'lindenwold',
      'greenbrook': 'green brook'
    }
    for from_string in replacements:
      muni = muni.replace(from_string, replacements[from_string])

    if muni == 'orange' or muni == 'orange city' or muni == 'orange township':
      muni = 'city of orange'
    if muni == 'south orange village township' or muni == 'south orange':
      muni = 'south orange village'
    if muni == 'north bergen town':
      muni = 'north bergen township'

    replacements2 = {
      'avon borough': 'avon-by-the-sea',
      'glen ridge borough': 'glen ridge',
      'new brunswick township': 'new brunswick'
    }
    for from_string in replacements2:
      muni = muni.replace(from_string, replacements2[from_string])

    county = mer['county_name']

    district_num = find_district(muni, red_year, county, red_year_to_muni_to_district)
    if district_num:
      hit = hit+1
      if red_year not in district_tallies:
        district_tallies[red_year] = {}
      red_year_dict = district_tallies[red_year]
      if district_num not in red_year_dict:
        red_year_dict[district_num] = {}
      district_dict = red_year_dict[district_num]
      if election_id not in district_dict:
        district_dict[election_id] = {}
      election_dict = district_dict[election_id]
      if candidate_id not in election_dict:
        election_dict[candidate_id] = 0
      election_dict[candidate_id] = election_dict[candidate_id] + mer['votes']
    else:
      miss = miss+1
      misses.add(muni + ' (' + orig_muni + ')' + ' (' + county + ')')

  rows_to_insert = []
  for red_year in district_tallies:
    for district_num in district_tallies[red_year]:
      for election_id in district_tallies[red_year][district_num]:
        for candidate_id in district_tallies[red_year][district_num][election_id]:
          rows_to_insert.append({
            'district_id': district_and_red_year_to_id[str(district_num) + ':' + str(red_year)],
            'election_id': election_id,
            'candidate_id': candidate_id,
            'votes': district_tallies[red_year][district_num][election_id][candidate_id]
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

  for missed in misses:
    print 'Missed: ' + missed

if __name__ == "__main__": main()
