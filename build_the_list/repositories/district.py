class District(object):
    def __init__(self, db):
        self.db = db

    def save(self, data):
        district_type = data['type']
        name = data['name']
        state = data['state']

        district_type_id = self.db.query(
            """
            INSERT INTO district_types (name) VALUES (:name)
            ON CONFLICT (name) DO UPDATE SET name = :name
            RETURNING id
            """,
            name=self._format_str(district_type)
        ).as_dict()[0]['id']

        sql = """
        INSERT INTO districts (district_type_id, name, state)
        VALUES (:district_type_id, :name, :state)
        RETURNING id
        """
        return self.db.query(
            sql,
            district_type_id=district_type_id,
            name=self._format_str(name)
            state=self._format_str(state)
        ).as_dict()[0]['id']

    def add_county(self, data):
        county_id = data['county_id']
        district_id = data['district_id']

        sql = """
        INSERT INTO counties_districts (county_id, district_id)
        VALUES (:county_id, :district_id)
        """
        self.db.query(
            sql,
            county_id=county_id,
            district_id=district_id
        )

    def add_election_result(self, data):
        candidate_id = data['candidate_id']
        district_id = data['district_id']
        election_id = data['election_id']
        votes = data['votes']

        sql = """
        INSERT INTO district_election_results (candidate_id, district_id, election_id, votes)
        VALUES (:candidate_id, :district_id, :election_id, :votes)
        """
        self.db.query(
            sql,
            candidate_id=candidate_id,
            district_id=district_id,
            election_id=election_id,
            votes=votes
        )

        return None

    def _format_str(self, s):
        return s.lower().strip()
