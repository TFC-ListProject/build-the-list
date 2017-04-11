class County(object):
    def __init__(self, db):
        self.db = db

    def save(self, data):
        name = data['name']

        sql = """
        INSERT INTO counties (name) VALUES (:name)
        RETURNING id
        """
        return self.db.query(
            sql,
            name=self._format_str(name)
        ).as_dict()[0]['id']

    def add_election_result(self, data):
        candidate_id = data['candidate_id']
        county_id = data['county_id']
        election_id = data['election_id']
        votes = data['votes']

        sql = """
        INSERT INTO county_election_results (candidate_id, county_id, election_id, votes) VALUES (:candidate_id, :county_id, :election_id, :votes)
        """
        self.db.query(
            sql,
            candidate_id=candidate_id,
            county_id=county_id,
            election_id=election_id,
            votes=votes
        )

        return None

    def _format_str(self, s):
        return s.lower().strip()
