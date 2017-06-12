DROP TABLE IF EXISTS raw_precinct_vote;
CREATE TABLE raw_precinct_vote (
    state varchar(2),
    sourceprecinctid integer,
    precinctname varchar(255),
    districttype varchar(255),
    districtnumber integer,
    year integer,
    candidatename varchar(255),
    candidateparty varchar(255),
    votes integer
);

DROP TABLE IF EXISTS raw_district_house_candidates;
CREATE TABLE raw_district_house_candidates (
    firstname varchar(255),
    lastname varchar(255),
    party varchar(255),
    percentage numeric,
    numvotes integer,
    dollars integer,
    wasincumbent boolean,
    waswinner boolean,
    withdrew boolean,
    year integer,
    district integer,
    electiontype varchar(255),
    state varchar(2)
);

DROP TABLE IF EXISTS raw_statewide_candidates;
CREATE TABLE raw_statewide_candidates (
    district integer,
    electionname varchar(255),
    vpapelectionid integer,
    candidatename varchar(255),
    candidateparty varchar(255),
    numvotes integer,
    percentage numeric,
    state varchar(2)
);
