import conftest
import build_the_list.pdf_extract as pe

extracted_pdf = ['November 8, 2016', 'General Election Results', 'Presidential', 'Atlantic County', 'MUNICIPALITIES', 'Hillary Rodham Clinton', 'Democratic', 'Donald J. Trump', 'Republican', 'Gary Johnson', 'Libertarian Party', 'Jill Stein', 'Green Party', 'Darrell Castle', 'Constitution Party', 'Alyson Kennedy Socialist', 'Workers Party', 'Rocky Roque De la Fuente', 'American Delta Party', 'Monica Moorehead', 'Workers World Party', 'Gloria La Riva', 'Socialism and Liberation', 'Absecon City', 'Atlantic City', 'Brigantine City', 'Buena Boro', 'Buena Vista Twp.', 'Corbin City', 'Egg Harbor City', 'Egg Harbor Twp', 'Estell Manor City', 'Folsom Boro', 'Galloway Twp.', 'Hamilton Twp.', 'Hammonton', 'Linwood City', 'Longport Boro', 'Margate City', 'Mullica Twp.', 'Northfield Twp.', 'Pleasantville City', 'Port Republic', 'Somers Point City', 'Ventnor City', 'Weymouth Twp.', 'COUNTY TOTAL', '1,949', '9,407', '1,885', '758', '1,491', '85', '944', '9,973', '244', '325', '8,275', '5,901', '2,366', '1,675', '182', '1,632', '1,142', '1,957', '5,422', '246', '2,319', '2,196', '550', '60,924', '2,163', '2,062', '2,660', '949', '1,868', '158', '746', '9,563', '677', '549', '7,951', '5,252', '3,859', '2,069', '306', '1,688', '1,710', '2,222', '565', '416', '2,330', '2,073', '854', '52,690', '74', '73', '95', '36', '54', '10', '33', '398', '18', '17', '319', '272', '115', '97', '16', '47', '56', '106', '24', '16', '116', '92', '25', '2,109', '40', '63', '39', '25', '20', '2', '20', '175', '10', '6', '153', '112', '47', '47', '1', '23', '24', '53', '34', '5', '46', '48', '6', '999', '7', '15', '4', '5', '11', '3', '3', '53', '7', '1', '47', '25', '17', '9', '0', '3', '9', '9', '10', '4', '11', '8', '3', '264', '1', '5', '2', '1', '1', '0', '0', '4', '1', '0', '5', '8', '4', '0', '1', '0', '3', '1', '2', '1', '3', '1', '2', '46', '1', '2', '1', '2', '1', '0', '0', '15', '1', '0', '6', '6', '3', '1', '0', '6', '1', '0', '5', '2', '1', '1', '1', '56', '2', '6', '1', '1', '0', '0', '2', '10', '1', '0', '7', '9', '2', '1', '0', '1', '0', '2', '6', '0', '5', '0', '1', '57', '3', '15', '7', '5', '3', '0', '4', '25', '0', '0', '19', '18', '10', '3', '0', '4', '4', '4', '6', '1', '6', '6', '3', '146', 'NJDOE-ds-12/14/2016', ''][4:-2]

# def test_candidates():
    # result = pe.candidates(extracted_pdf[:])
    # expected = [
        # 'Hillary Rodham Clinton',
        # 'Donald J. Trump',
        # 'Gary Johnson',
        # 'Jill Stein',
        # 'Darrell Castle',
        # 'Alyson Kennedy',
        # 'Rocky Roque De la Fuente',
        # 'Monica Moorehead',
        # 'Gloria La Riva',
    # ]

    # assert result == expected

# def test_parties():
    # result = pe.parties(extracted_pdf[:])
    # expected = [
        # 'Democratic',
        # 'Republican',
        # 'Libertarian Party',
        # 'Green Party',
        # 'Constitution Party',
        # 'Socialist Workers Party',
        # 'American Delta Party',
        # 'Workers World Party',
        # 'Socialism and Liberation',
    # ]

    # assert result == expected

# def test_votes_by_municipality_first_row():
    # result = pe.votes_by_municipality(pe._vote_filtered(extracted_pdf[:]))['Absecon City']
    # expected = [1949, 2163, 74, 40, 7, 1, 1, 2, 3]

    # assert result == expected

# def test_votes_by_municipality_last_row():
    # result = pe.votes_by_municipality(pe._vote_filtered(extracted_pdf))['Weymouth Twp.']
    # expected = [550, 854, 25, 6, 3, 2, 1, 1, 3]

    # assert result == expected
