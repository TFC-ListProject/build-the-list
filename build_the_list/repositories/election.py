class Election(object):
    def __init__(self, db):
        self.db = db

    def save(self, data):
        election_type = data['type']

        election_type_id = self.db.query(
            """
            INSERT INTO election_types (name) VALUES (:name)
            ON CONFLICT (name) DO UPDATE SET name = :name
            RETURNING id
            """,
            name=self._format_str(election_type)
        ).as_dict()[0]['id']

        return self.db.query(
            """
            INSERT INTO elections (election_type_id, year, state)
            VALUES (:election_type_id, :year, :state)
            RETURNING id
            """,
            election_type_id=election_type_id, year=data['year'], state=data['state'].lower()
        ).as_dict()[0]['id']

    def add_candidate(self, data):
        candidate_id = data['candidate_id']
        election_id = data['election_id']
        party_id = data['party_id']

        self.db.query(
            """
            INSERT INTO candidates_elections (candidate_id, election_id, party_id)
            VALUES (:candidate_id, :election_id, :party_id)
            """,
            candidate_id=candidate_id, election_id=election_id, party_id=party_id
        )

        return None

    def _format_str(self, s):
        return s.lower().strip()
