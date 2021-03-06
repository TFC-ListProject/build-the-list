import build_the_list.election as e
import build_the_list.utils as utils

pdf_rows = [
    'Congressional November 8, 2016', 'General Election ResultsDistrict 1', 'Donald W. Norcross Democratic Bob Patterson Republican Michael Berman AmericanIndependents.org William F. Sihr IV Libertarian Party Scot John Tomaszewski We Deserve Better', 'Burlington County', 'Maple Shade Twp 4,025 2,752 109 64 53', 'Palmyra Boro 1,975 1,257 26 31 10', 'Federal Overseas', 'Burlington Totals 6,000 4,009 135 95 63', 'Camden County', 'Audubon Boro 2,409 1,797 18 60 95', 'Audubon Park Boro 288 204 1 1 12', 'Barrington Boro 1,733 1,343 24 41 44', 'Bellmawr Boro 2,649 1,831 16 35 81', 'Berlin Boro 1,591 1,774 15 35 75', 'Berlin Twp. 1,293 941 10 12 39', 'Brooklawn Boro 455 265 2 5 16', 'Camden City 16,424 1,016 122 99 414', 'Cherry Hill Twp. 20,655 13,318 160 261 490', 'Chesilhurst Boro 476 163 3 1 11', 'Clementon Boro 1,126 640 9 14 36', 'Collingswood Boro 4,581 1,994 53 99 186', 'Gibbsboro Boro 592 515 8 5 34', 'Gloucester City 2,259 1,369 12 27 74', 'Gloucester Twp. 15,554 11,003 101 202 402', 'Haddon Heights Boro 2,251 1,918 21 34 67', 'Haddon Twp. 4,408 3,133 40 99 171', 'Haddonfield Boro 3,557 3,093 27 56 86', 'Hi-Nella Boro 204 136 3 6 9', 'Laurel Springs Boro 488 394 4 8 18', 'Lawnside Boro 1,329 60 5 6 16', 'Lindenwold Boro 4,163 1,277 25 37 84', 'Magnolia Boro 1,172 643 7 12 40', 'Merchantville Boro 1,052 583 17 18 34', 'Mt. Ephraim Boro 1,173 802 5 12 41', 'Oaklyn Boro 1,076 703 15 24 73', 'Pennsauken Twp 10,181 3,103 61 101 284', 'Pine Hill Boro 2,513 1,207 18 34 88', 'Pine Valley Boro 1 9 0 0 1', 'Runnemede Boro 1,914 1,369 23 33 70', 'Somerdale Boro 1,533 686 11 15 39', 'Stratford Boro 1,669 1,292 9 33 45', 'Tavistok Boro 2 4 0 1 0', 'Voorhees Twp. 7,914 5,530 53 86 150', 'Winslow Twp. 10,743 5,256 60 106 227', 'Woodlynne Boro 665 118 3 11 23', 'Federal Overseas 66 14 4 3 2', 'Camden Totals 130,159 69,503 965 1,632 3,577', 'Page 1 NJDOE-ds12/21/2016-', 'Congressional November 8, 2016', 'General Election ResultsDistrict 1', 'Donald W. Norcross Democratic Bob Patterson Republican Michael Berman AmericanIndependents.org William F. Sihr IV Libertarian Party Scot John Tomaszewski We Deserve Better', 'Gloucester County', 'Deptford 7,378 4,782 123 105 306', 'East Greenwich 1,877 2,250 36 32 64', 'Glassboro 3,851 2,498 69 51 170', 'Greenwich 1,260 1,060 16 18 64', 'Logan 1,504 1,151 36 24 58', 'Monroe 8,049 6,838 142 110 294', 'National Park 631 463 12 17 25', 'Paulsboro 1,473 425 22 12 44', 'Washington 10,833 11,750 217 159 382', 'Wenoah 636 582 23 18 25', 'West Deptford 5,440 4,334 92 62 238', 'Westville 798 688 28 21 55', 'Woodbury 2,484 1,350 42 36 75', 'Woodbury Heights 827 704 12 18 32', 'Federal Overseas 31 1 1 0 1', 'Gloucester Totals 47,072 38,876 871 683 1,833', 'District 1 Totals 183,231 112,388 1,971 2,410 5,473', 'Page 2 NJDOE-ds12/21/2016-'
]

def test_get_rows():
    config = utils.get_config('2016-municipality-hor-district1.pdf')
    result = e.get_rows(pdf_rows, config)[0:2]
    expected = [
        [
            'District 1',
            'congressional',
            'Burlington County',
            'Maple Shade Twp',
            4025, 2752, 109, 64, 53,
        ],
        [
            'District 1',
            'congressional',
            'Burlington County',
            'Palmyra Boro',
            1975, 1257, 26, 31, 10,
        ],
    ]

    assert result == expected
