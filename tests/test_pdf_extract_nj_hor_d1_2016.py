import conftest
import build_the_list.pdf_extract as pe

extracted_pdf = [
    'Congressional', 'November 8, 2016', 'General Election Results', 'District 1', 'Donald W. Norcross', 'Democratic', 'Bob Patterson', 'Republican', 'Michael Berman', 'AmericanIndependents.org', 'William F. Sihr IV', 'Libertarian Party', 'Scot John Tomaszewski', 'We Deserve Better', 'Burlington County', 'Maple Shade Twp', 'Palmyra Boro', 'Federal Overseas', 'Burlington Totals', 'Camden County', 'Audubon Boro', 'Audubon Park Boro', 'Barrington Boro', 'Bellmawr Boro', 'Berlin Boro', 'Berlin Twp.', 'Brooklawn Boro', 'Camden City', 'Cherry Hill Twp.', 'Chesilhurst Boro', 'Clementon Boro', 'Collingswood Boro', 'Gibbsboro Boro', 'Gloucester City', 'Gloucester Twp.', 'Haddon Heights Boro', 'Haddon Twp.', 'Haddonfield Boro', 'Hi-Nella Boro', 'Laurel Springs Boro', 'Lawnside Boro', 'Lindenwold Boro', 'Magnolia Boro', 'Merchantville Boro', 'Mt. Ephraim Boro', 'Oaklyn Boro', 'Pennsauken Twp', 'Pine Hill Boro', 'Pine Valley Boro', 'Runnemede Boro', 'Somerdale Boro', 'Stratford Boro', 'Tavistok Boro', 'Voorhees Twp.', 'Winslow Twp.', 'Woodlynne Boro', 'Federal Overseas', 'Camden Totals', '4,025', '1,975', '6,000', '2,409', '288', '1,733', '2,649', '1,591', '1,293', '455', '16,424', '20,655', '476', '1,126', '4,581', '592', '2,259', '15,554', '2,251', '4,408', '3,557', '204', '488', '1,329', '4,163', '1,172', '1,052', '1,173', '1,076', '10,181', '2,513', '1', '1,914', '1,533', '1,669', '2', '7,914', '10,743', '665', '66', '130,159', '2,752', '1,257', '4,009', '1,797', '204', '1,343', '1,831', '1,774', '941', '265', '1,016', '13,318', '163', '640', '1,994', '515', '1,369', '11,003', '1,918', '3,133', '3,093', '136', '394', '60', '1,277', '643', '583', '802', '703', '3,103', '1,207', '9', '1,369', '686', '1,292', '4', '5,530', '5,256', '118', '14', '69,503', '109', '26', '135', '18', '1', '24', '16', '15', '10', '2', '122', '160', '3', '9', '53', '8', '12', '101', '21', '40', '27', '3', '4', '5', '25', '7', '17', '5', '15', '61', '18', '0', '23', '11', '9', '0', '53', '60', '3', '4', '965', '64', '31', '95', '60', '1', '41', '35', '35', '12', '5', '99', '261', '1', '14', '99', '5', '27', '202', '34', '99', '56', '6', '8', '6', '37', '12', '18', '12', '24', '101', '34', '0', '33', '15', '33', '1', '86', '106', '11', '3', '1,632', '53', '10', '63', '95', '12', '44', '81', '75', '39', '16', '414', '490', '11', '36', '186', '34', '74', '402', '67', '171', '86', '9', '18', '16', '84', '40', '34', '41', '73', '284', '88', '1', '70', '39', '45', '0', '150', '227', '23', '2', '3,577', 'Page 1', 'NJDOE-ds', '12/21/2016-', 'Congressional', 'November 8, 2016', 'General Election Results', 'District 1', 'Donald W. Norcross', 'Democratic', 'Bob Patterson', 'Republican', 'Michael Berman', 'AmericanIndependents.org', 'William F. Sihr IV', 'Libertarian Party', 'Scot John Tomaszewski', 'We Deserve Better', 'Gloucester County', 'Deptford', 'East Greenwich', 'Glassboro', 'Greenwich', 'Logan', 'Monroe', 'National Park', 'Paulsboro', 'Washington', 'Wenoah',
    'West Deptford', 'Westville', 'Woodbury', 'Woodbury Heights', 'Federal Overseas', 'Gloucester Totals', 'District 1 Totals', '7,378', '1,877', '3,851', '1,260', '1,504', '8,049', '631', '1,473', '10,833', '636', '5,440', '798', '2,484', '827', '31', '47,072', '183,231', '4,782', '2,250', '2,498', '1,060', '1,151', '6,838', '463', '425', '11,750', '582', '4,334', '688', '1,350', '704', '1', '38,876', '112,388', '123', '36', '69', '16', '36', '142', '12', '22', '217', '23', '92', '28', '42', '12', '1', '871', '1,971', '105', '32', '51', '18', '24', '110', '17', '12', '159', '18', '62', '21', '36', '18', '0', '683', '2,410', '306', '64', '170', '64', '58', '294', '25', '44', '382', '25', '238', '55', '75', '32', '1', '1,833', '5,473', 'Page 2', 'NJDOE-ds', '12/21/2016-', ''
]

def test_candidates():
    result = pe.candidates2(extracted_pdf)
    expected = [
        'Donald W. Norcross',
        'Bob Patterson',
        'Michael Berman',
        'William F. Sihr IV',
        'Scot John Tomaszewski',
    ]

    assert result == expected

def test_parties():
    result = pe.parties2(extracted_pdf)
    expected = [
        'Democratic',
        'Republican',
        'AmericanIndependents.org',
        'Libertarian Party',
        'We Deserve Better',
    ]

    assert result == expected

def test_votes_by_municipality_first_row():
    result = pe.votes_by_municipality2(extracted_pdf)['Burlington County']['Maple Shade Twp']
    expected = [4025, 2752, 109, 64, 53]

    assert result == expected

def test_votes_by_municipality_another_row():
    result = pe.votes_by_municipality2(extracted_pdf)['Camden County']['Woodlynne Boro']
    expected = [665, 118, 3, 11, 23]

    assert result == expected

def test_votes_by_municipality_second_page_first_row():
    result = pe.votes_by_municipality2(extracted_pdf)['Gloucester County']['Deptford']
    expected = [7378, 4782, 123, 105, 306]

    assert result == expected

def test_votes_by_municipality_second_page_last_row():
    result = pe.votes_by_municipality2(extracted_pdf)['Gloucester County']['Federal Overseas']
    expected = [31, 1, 1, 0, 1]

    assert result == expected
