import build_the_list.election_repository as er

rows = [
    ['District 1', 'congressional', 'County1', 'City1', 10, 20, 30],
    ['District 1', 'congressional', 'County1', 'City2', 11, 12, 13],
    ['District 1', 'congressional', 'County2', 'City3', 1, 2, 3],
]

def test_votes_by_district():
    result = er.votes_by_district(rows, 'District 1', 0, 4)
    expected = 22

    assert result == expected

def test_votes_by_county():
    result = er.votes_by_county(rows, 'County1', 0, 4)
    expected = 21

    assert result == expected

def test_votes_by_municipality():
    result = er.votes_by_municipality(rows, 'City1', 0, 4)
    expected = 10

    assert result == expected
