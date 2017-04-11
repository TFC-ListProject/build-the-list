class Party(object):
    def __init__(self, db):
        self.db = db

    def save(self, data):
        name = data['name']

        sql = """
        INSERT INTO parties (name) VALUES (:name)
        ON CONFLICT (name) DO UPDATE SET name = :name
        RETURNING id
        """
        return self.db.query(
            sql,
            name=self._format_str(name)
        ).as_dict()[0]['id']

    def _format_str(self, s):
        return s.lower().strip()
