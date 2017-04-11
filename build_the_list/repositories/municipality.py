class Municipality(object):
    def __init__(self, db):
        self.db = db

    def save(self, data):
        county_id = data['county_id']
        name = data['name']

        sql = """
        INSERT INTO municipalities (county_id, name) VALUES (:county_id, :name)
        RETURNING id
        """
        return self.db.query(sql, county_id=county_id, name=self._format_str(data['name'])).as_dict()[0]['id']

    def add_election_result(self, data):
        candidate_id = data['candidate_id']
        election_id = data['election_id']
        municipality_id = data['municipality_id']
        votes = data['votes']

        sql = """
        INSERT INTO municipality_election_results (candidate_id, election_id, municipality_id, votes) VALUES (:candidate_id, :election_id, :municipality_id, :votes)
        """
        self.db.query(
            sql,
            candidate_id=candidate_id,
            election_id=election_id,
            municipality_id=municipality_id,
            votes=votes
        )

        return None

    def _format_str(self, s):
        return s.lower().strip()
