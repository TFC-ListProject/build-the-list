CREATE TABLE raw_precinct_to_hod (
    state varchar(2),
    precinctname varchar(255),
    hoddistrict integer
);

CREATE TABLE raw_precinct_usr_vote (
    state varchar(2),
    precinctname varchar(255),
    usrdistrict integer,
    year integer,
    candidatename varchar(255),
    candidateparty varchar(255),
    votes integer
);
