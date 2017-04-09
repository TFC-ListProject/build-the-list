from __future__ import print_function
import records

def db():
    return records.Database('postgres://localhost:5432/buildthelist_development?user=techforcampaigns')

def insert_candidates_sql(candidates):
    split = map(lambda x: x.split(' '), candidates)

    def build_values_sql(l):
        head, rest = l[0], l[1:]
        return "('{}', '{}')".format(_format_str(head), _format_str(' '.join(rest)))
    values_sql = ', '.join(map(build_values_sql, split))
    return """
    INSERT INTO candidates (first_name, last_name) VALUES
    {}
    RETURNING id
    """.format(values_sql)

def insert_candidates(db, candidates):
    sql = insert_candidates_sql(candidates)
    return db.query(sql).as_dict()

def _format_str(s):
    return s.lower().strip()

if __name__ == '__main__':
    db = db()
    t = db.transaction()
    print('BEGIN TRANSACTION')
    # candidate_ids = insert_candidates(db, candidates)
    t.commit()

    # db.query('TRUNCATE candidates RESTART IDENTITY CASCADE')
