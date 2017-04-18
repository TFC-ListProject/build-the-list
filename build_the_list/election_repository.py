def votes_by_district(rows, district, i, skip_amount):
    filtered_rows = filter(lambda row: row[0] == district, rows)

    return reduce(lambda acc, x: acc + x[i + skip_amount], filtered_rows, 0)

def votes_by_county(rows, county, i, skip_amount):
    filtered_rows = filter(lambda row: row[2] == county, rows)

    return reduce(lambda acc, x: acc + x[i + skip_amount], filtered_rows, 0)

def votes_by_municipality(rows, municipality, i, skip_amount):
    filtered_rows = filter(lambda row: row[3] == municipality, rows)

    return reduce(lambda acc, x: acc + x[i + skip_amount], filtered_rows, 0)

def save(db, candidates, parties, election, rows):
    conn = db.connection()
    election_id = db.save_election(conn, {
        'type': election['type'],
        'year': election['year'],
        'state': election['state'],
    })

    candidate_ids = []
    for i, c in enumerate(candidates):
        name = c.split(' ')
        first_name = name[0]
        last_name = ' '.join(name[1:])
        candidate_id = db.save_candidate(conn, {
            'first_name': first_name,
            'last_name': last_name,
        })
        candidate_ids.append(candidate_id)
        party_id = db.save_party(conn, {
            'name': parties[i],
        })
        db.election_add_candidate(conn, {
            'candidate_id': candidate_id,
            'election_id': election_id,
            'party_id': party_id,
        })

    counties = []
    municipalities = []
    districts = []
    for row in rows:
        county_id = db.save_county(conn, {
            'name': row[2],
            'state': election['state'],
        })
        counties.append({
            'id': county_id,
            'name': row[2],
        })

        municipality_id = db.save_municipality(conn, {
            'county_id': county_id,
            'name': row[3],
        })
        municipalities.append({
            'id': municipality_id,
            'name': row[3],
        })

        if row[0] and row[1]:
            district_id = db.save_district(conn, {
                'name': row[0],
                'state': election['state'],
                'type': row[1],
            })
            db.add_county_to_district(conn, {
                'county_id': county_id,
                'district_id': district_id,
            })
            districts.append({
                'id': district_id,
                'name': row[0],
            })

    skip_amount = 4
    for i, candidate_id in enumerate(candidate_ids):
        # TODO: only loop over unique districts
        for district in districts:
            db.add_election_result_to_district(conn, {
                'candidate_id': candidate_id,
                'district_id': district_id,
                'election_id': election_id,
                'votes': votes_by_district(rows, district['name'], i, skip_amount),
            })

        # TODO: only loop over unique counties
        for county in counties:
            db.add_election_result_to_county(conn, {
                'candidate_id': candidate_id,
                'county_id': county['id'],
                'election_id': election_id,
                'votes': votes_by_county(rows, county['name'], i, skip_amount),
            })

        for municipality in municipalities:
            db.add_election_result_to_municipality(conn, {
                'candidate_id': candidate_id,
                'election_id': election_id,
                'municipality_id': municipality['id'],
                'votes': votes_by_municipality(rows, municipality['name'], i, skip_amount),
            })
