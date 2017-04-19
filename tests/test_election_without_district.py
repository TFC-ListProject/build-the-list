import build_the_list.election as e
import build_the_list.utils as utils

pdf_rows = ['Presidential November 8, 2016', 'General Election ResultsAtlantic County', 'MUNICIPALITIES Hillary Rodham Clinton Democratic Donald J. Trump Republican Gary Johnson Libertarian Party Jill Stein Green Party Darrell Castle Constitution Party Alyson Kennedy Socialist Workers Party Rocky Roque De la Fuente American Delta Party Monica Moorehead Workers World Party Gloria La Riva Socialism and Liberation', 'Absecon City 1,949 2,163 74 40 7 1 1 2 3', 'Atlantic City 9,407 2,062 73 63 15 5 2 6 15', 'Brigantine City 1,885 2,660 95 39 4 2 1 1 7', 'Buena Boro 758 949 36 25 5 1 2 1 5', 'Buena Vista Twp. 1,491 1,868 54 20 11 1 1 0 3', 'Corbin City 85 158 10 2 3 0 0 0 0', 'Egg Harbor City  944 746 33 20 3 0 0 2 4', 'Egg Harbor Twp 9,973 9,563 398 175 53 4 15 10 25', 'Estell Manor City 244 677 18 10 7 1 1 1 0', 'Folsom Boro 325 549 17 6 1 0 0 0 0', 'Galloway Twp. 8,275 7,951 319 153 47 5 6 7 19', 'Hamilton Twp. 5,901 5,252 272 112 25 8 6 9 18', 'Hammonton  2,366 3,859 115 47 17 4 3 2 10', 'Linwood City 1,675 2,069 97 47 9 0 1 1 3', 'Longport Boro 182 306 16 1 0 1 0 0 0', 'Margate City 1,632 1,688 47 23 3 0 6 1 4', 'Mullica Twp. 1,142 1,710 56 24 9 3 1 0 4', 'Northfield Twp. 1,957 2,222 106 53 9 1 0 2 4', 'Pleasantville City 5,422 565 24 34 10 2 5 6 6', 'Port Republic 246 416 16 5 4 1 2 0 1', 'Somers Point City 2,319 2,330 116 46 11 3 1 5 6', 'Ventnor City 2,196 2,073 92 48 8 1 1 0 6', 'Weymouth Twp. 550 854 25 6 3 2 1 1 3COUNTY TOTAL 60,924 52,690 2,109 999 264 46 56 57 146', 'NJDOE-ds-12/14/2016']

def test_get_candidates():
    config = {
        'candidates': ['Hillary Rodham Clinton'],
    }
    result = e.get_candidates(config)
    expected = ['Hillary Rodham Clinton']

    assert result == expected

def test_get_election():
    config = {
        'state': 'nj',
        'type': 'presidential',
        'year': 2016,
    }
    result = e.get_election(config)
    expected = config

    assert result == expected

def test_get_parties():
    config = {
        'parties': ['Democratic'],
    }
    result = e.get_parties(config)
    expected = ['Democratic']

    assert result == expected

def test_get_rows():
    config = utils.get_config('2016-gen-elect-presidential-results-atlantic.pdf')
    result = e.get_rows(pdf_rows, config)[0:2]
    expected = [
        [
            None,
            None,
            'Atlantic County',
            'Absecon City',
            1949, 2163, 74, 40, 7, 1, 1, 2, 3,
        ],
        [
            None,
            None,
            'Atlantic County',
            'Atlantic City',
            9407, 2062, 73, 63, 15, 5, 2, 6, 15,
        ],
    ]

    assert result == expected

def test_extract_row():
    row = 'Atlantic City 9,407 2,062 73 63 15 5 2 6 15'
    result = e.extract_row(row)
    expected = {
        'municipality': 'Atlantic City',
        'votes': [9407, 2062, 73, 63, 15, 5, 2, 6, 15],
    }

    assert result == expected

def test_extract_row_with_totals():
    row = 'Weymouth Twp. 550 854 25 6 3 2 1 1 3COUNTY TOTAL 60,924 52,690 2,109 999 264 46 56 57 146'
    result = e.extract_row(row)
    expected = {
        'municipality': 'Weymouth Twp.',
        'votes': [550, 854, 25, 6, 3, 2, 1, 1, 3],
    }

    assert result == expected

def test_skip_row_when_skipping():
    row = 'Federal OverseasBurlington Totals 6,000 4,009 135 95 63'
    result = e.skip_row(row)
    expected = True

    assert result == expected

def test_skip_row_when_not_skipping():
    row = 'Weymouth Twp. 550 854 25 6 3 2 1 1 3COUNTY TOTAL 60,924 52,690 2,109 999 264 46 56 57 146'
    result = e.skip_row(row)
    expected = False

    assert result == expected
