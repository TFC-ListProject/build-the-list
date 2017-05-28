CREATE TABLE raw_district_house_candidates (
    firstname character varying(255),
    lastname character varying(255),
    party character varying(255),
    percentage numeric,
    numvotes integer,
    dollars integer,
    wasincumbent boolean,
    waswinner boolean,
    withdrew boolean,
    year integer,
    district integer,
    electiontype character varying(255)
);

CREATE TABLE raw_statewide_candidates (
    district integer,
    electionname character varying(255),
    vpapelectionid integer,
    candidatename character varying(255),
    candidateparty character varying(255),
    numvotes integer,
    percentage numeric
);

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
