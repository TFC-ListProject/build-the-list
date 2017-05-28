import json

import records

def connection():
    return records.Database(
        'postgres://localhost:5432/buildthelist_development?user=techforcampaigns'
    )

def save_county(db, data):
    name = data['name']
    state = data['state']

    sql = """
    INSERT INTO counties (name, state) VALUES (:name, :state)
    ON CONFLICT (name, state) DO UPDATE SET name = :name, state = :state
    RETURNING id
    """
    return db.query(
        sql,
        name=format_str(name),
        state=format_str(state)
    ).as_dict()[0]['id']

def save_municipality(db, data):
    county_id = data['county_id']
    name = data['name']

    sql = """
    INSERT INTO municipalities (county_id, name) VALUES (:county_id, :name)
    ON CONFLICT (county_id, name) DO UPDATE SET county_id = :county_id, name = :name
    RETURNING id
    """
    return db.query(
        sql,
        county_id=county_id,
        name=format_str(name)
    ).as_dict()[0]['id']

def save_election(conn, data):
    election_type = data['type']
    year = data['year']
    state = data['state']

    election_type_id = conn.query(
        """
        INSERT INTO election_types (name) VALUES (:name)
        ON CONFLICT (name) DO UPDATE SET name = :name
        RETURNING id
        """,
        name=format_str(election_type)
    ).as_dict()[0]['id']

    return conn.query(
        """
        INSERT INTO elections (election_type_id, year, state)
        VALUES (:election_type_id, :year, :state)
        ON CONFLICT (election_type_id, state, year) DO UPDATE SET
        election_type_id = :election_type_id, state = :state, year = :year
        RETURNING id
        """,
        election_type_id=election_type_id,
        year=year,
        state=format_str(state)
    ).as_dict()[0]['id']

def save_candidate(conn, data):
    first_name = data['first_name']
    last_name = data['last_name']
    return conn.query(
        """
        INSERT INTO candidates (first_name, last_name) VALUES
        (:first_name, :last_name)
        ON CONFLICT (first_name, last_name)
        DO UPDATE SET first_name = :first_name, last_name = :last_name
        RETURNING id
        """,
        first_name=format_str(first_name),
        last_name=format_str(last_name)
    ).as_dict()[0]['id']

def save_district(conn, data):
    name = data['name']
    state = data['state']
    district_type = data['type']

    district_type_id = conn.query(
        """
        INSERT INTO district_types (name) VALUES (:name)
        ON CONFLICT (name) DO UPDATE SET name = :name
        RETURNING id
        """,
        name=format_str(district_type)
    ).as_dict()[0]['id']

    return conn.query(
        """
        INSERT INTO districts (district_type_id, name, state)
        VALUES (:district_type_id, :name, :state)
        ON CONFLICT (name, state) DO UPDATE SET name = :name, state = :state
        RETURNING id
        """,
        district_type_id=district_type_id,
        name=format_str(name),
        state=format_str(state)
    ).as_dict()[0]['id']

# def add_county_to_district(conn, data):
#     county_id = data['county_id']
#     district_id = data['district_id']

#     conn.query(
#         """
#         INSERT INTO counties_districts (county_id, district_id)
#         VALUES (:county_id, :district_id)
#         ON CONFLICT (county_id, district_id) DO UPDATE
#         SET county_id = :county_id, district_id = :district_id
#         """,
#         county_id=county_id,
#         district_id=district_id
#     )

def save_party(conn, data):
    name = data['name']

    sql = """
    INSERT INTO parties (name) VALUES (:name)
    ON CONFLICT (name) DO UPDATE SET name = :name
    RETURNING id
    """
    return conn.query(
        sql,
        name=format_str(name)
    ).as_dict()[0]['id']

def election_add_candidate(conn, data):
    candidate_id = data['candidate_id']
    election_id = data['election_id']
    party_id = data['party_id']

    conn.query(
        """
        INSERT INTO candidates_elections (candidate_id, election_id, party_id)
        VALUES (:candidate_id, :election_id, :party_id)
        """,
        candidate_id=candidate_id,
        election_id=election_id,
        party_id=party_id
    )

def add_election_result_to_district(conn, data):
    candidate_id = data['candidate_id']
    district_id = data['district_id']
    election_id = data['election_id']
    votes = data['votes']

    conn.query(
        """
        INSERT INTO district_election_results (candidate_id, district_id, election_id, votes)
        VALUES (:candidate_id, :district_id, :election_id, :votes)
        ON CONFLICT (candidate_id, district_id, election_id) DO UPDATE
        SET candidate_id = :candidate_id, district_id = :district_id, election_id = :election_id
        """,
        candidate_id=candidate_id,
        district_id=district_id,
        election_id=election_id,
        votes=votes,
    )

def add_election_result_to_county(conn, data):
    candidate_id = data['candidate_id']
    county_id = data['county_id']
    election_id = data['election_id']
    votes = data['votes']

    conn.query(
        """
        INSERT INTO county_election_results (candidate_id, county_id, election_id, votes)
        VALUES (:candidate_id, :county_id, :election_id, :votes)
        ON CONFLICT (candidate_id, county_id, election_id) DO UPDATE
        SET candidate_id = :candidate_id, county_id = :county_id, election_id = :election_id
        """,
        candidate_id=candidate_id,
        county_id=county_id,
        election_id=election_id,
        votes=votes,
    )

def add_election_result_to_municipality(conn, data):
    candidate_id = data['candidate_id']
    election_id = data['election_id']
    municipality_id = data['municipality_id']
    votes = data['votes']

    conn.query(
        """
        INSERT INTO municipality_election_results (candidate_id, election_id, municipality_id, votes)
        VALUES (:candidate_id, :election_id, :municipality_id, :votes)
        ON CONFLICT (candidate_id, election_id, municipality_id) DO UPDATE
        SET candidate_id = :candidate_id, election_id = :election_id, municipality_id = :municipality_id
        """,
        candidate_id=candidate_id,
        election_id=election_id,
        municipality_id=municipality_id,
        votes=votes,
    )

def find_district_ids(conn, districts):
    return conn.query(
        """
        SELECT id FROM districts
        WHERE name IN (:districts)
        ORDER BY created_at
        """,
        districts=', '.join(districts)
    ).as_dict()

def find_counties(conn, counties):
    return conn.query(
        """
        SELECT id, name
        FROM counties WHERE name IN (:counties)
        ORDER BY created_at
        """,
        counties=', '.join(counties)
    ).as_dict()

def find_municipality_ids(conn, municipalities):
    return conn.query(
        """
        SELECT id FROM municipalities
        WHERE name IN (:municipalities)
        ORDER BY created_at
        """,
        municipalities=', '.join(municipalities)
    ).as_dict()

def format_str(s):
    return s.lower().strip()
