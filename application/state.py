import records

class State:
    def __init__(self, db):
        self.db = db

    def find_districts(self, data):
        election_type = data.get('election_type')
        state = data.get('state')
        year = data.get('year')

        sql = '''
        SELECT
            d.district_number,
            p.name
        FROM
            districts d
        JOIN district_election_results der ON d.id = der.district_id
        JOIN candidates_elections ce ON der.election_id = ce.election_id
        JOIN candidates c ON c.id = ce.candidate_id AND c.id = der.candidate_id
        JOIN elections e ON e.id = ce.election_id AND e.id = der.election_id
        JOIN election_types et ON et.id = e.election_type_id
        JOIN parties p ON p.id = ce.party_id
        WHERE
            d.state = '{state}'
            AND et.name = {election_type}
            AND e.year = {year}
            AND der.won = true
        ORDER BY d.district_number
        '''.format(election_type=election_type, state=state, year=year)
        rows = self.db.engine.execute(sql).fetchall()

        def build_row(row):
            return dict(
                number=row[0],
                party=row[1],
            )

        return dict(
            districts=map(build_row, rows)
        )
