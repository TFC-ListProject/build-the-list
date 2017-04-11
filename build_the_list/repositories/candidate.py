class Candidate(object):
    def __init__(self, db):
        self.db = db

    def save(self, data):
        split = data.split(' ')
        head, rest = split[0], split[1:]
        values_sql = "('{}', '{}')".format(self._format_str(head), self._format_str(' '.join(rest)))
        sql = """
        INSERT INTO candidates (first_name, last_name) VALUES
        {}
        RETURNING id
        """.format(values_sql)
        return self.db.query(sql).as_dict()[0]['id']

    def _format_str(self, s):
        return s.lower().strip()
