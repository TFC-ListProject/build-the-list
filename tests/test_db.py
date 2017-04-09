import build_the_list.db as db
import conftest
import records

DB = records.Database('postgres://localhost:5432/buildthelist_test?user=techforcampaigns')

def test_insert_candidates_sql():
    candidates = ['c 1', 'c 2', 'c 3 4']
    expected = """
    INSERT INTO candidates (first_name, last_name) VALUES
    ('c', '1'), ('c', '2'), ('c', '3 4')
    RETURNING id
    """
    result = db.insert_candidates_sql(candidates)

    assert result == expected

def test_insert_candidates():
    DB.query('TRUNCATE candidates RESTART IDENTITY CASCADE')
    candidates = ['Hillary Rodham Clinton', 'Donald J. Trump', 'Jill Stein']
    expected = [
        { 'id': 1 },
        { 'id': 2 },
        { 'id': 3 },
    ]
    result = db.insert_candidates(DB, candidates)

    assert result == expected
