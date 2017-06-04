-- candidates
CREATE TABLE IF NOT EXISTS candidates (
    id SERIAL PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_candidates_name_unique ON candidates (last_name, first_name);


-- counties
CREATE TABLE IF NOT EXISTS counties (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    state varchar(2) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_counties_state_name_unique ON counties (state, name);


-- district_types
CREATE TABLE IF NOT EXISTS district_types (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_district_types_name_unique ON district_types (name);


-- districts
CREATE TABLE IF NOT EXISTS districts (
    id SERIAL PRIMARY KEY,
    district_type_id integer REFERENCES district_types(id) NOT NULL,
    redistricting_year integer NOT NULL,
    district_number integer NOT NULL,
    state varchar(2) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_districts_state_year_type_number_unique ON districts
(state, redistricting_year, district_type_id, district_number);


-- election_types
CREATE TABLE IF NOT EXISTS election_types (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_election_types_name_unique ON election_types (name);


-- elections
CREATE TABLE IF NOT EXISTS elections (
    id SERIAL PRIMARY KEY,
    election_type_id integer REFERENCES election_types(id) NOT NULL,
    year smallint NOT NULL,
    state varchar(2) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_elections_election_type_id ON elections (election_type_id);
CREATE UNIQUE INDEX idx_elections_state_year_type_unique ON elections
(state, year, election_type_id);


-- municipalities
CREATE TABLE IF NOT EXISTS municipalities (
    id SERIAL PRIMARY KEY,
    county_id integer REFERENCES counties(id) NOT NULL,
    name varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_municipalities_county_id_name_unique ON municipalities
(county_id, name);


-- parties
CREATE TABLE IF NOT EXISTS parties (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX idx_parties_name_unique ON parties (name);


-- candidates_elections
CREATE TABLE IF NOT EXISTS candidates_elections (
    candidate_id integer REFERENCES candidates(id) NOT NULL,
    election_id integer REFERENCES elections(id) NOT NULL,
    party_id integer REFERENCES parties(id) NOT NULL,
    dollars integer,
    incumbent boolean,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX candidates_elections_candidate_election_unique ON candidates_elections
(candidate_id, election_id);


-- county_election_results
CREATE TABLE IF NOT EXISTS county_election_results (
    candidate_id integer REFERENCES candidates(id) NOT NULL,
    county_id integer REFERENCES counties(id) NOT NULL,
    election_id integer REFERENCES elections(id) NOT NULL,
    votes integer,
    percentage numeric,
    withdrew boolean not null default false,
    won boolean,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX county_election_results_unique
ON county_election_results
(election_id, county_id, candidate_id);


-- district_election_results
CREATE TABLE IF NOT EXISTS district_election_results (
    candidate_id integer REFERENCES candidates(id) NOT NULL,
    district_id integer REFERENCES districts(id) NOT NULL,
    election_id integer REFERENCES elections(id) NOT NULL,
    votes integer,
    percentage numeric,
    withdrew boolean not null default false,
    won boolean,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX district_election_results_unique
ON district_election_results
(election_id, district_id, candidate_id);


-- municipality_election_results
CREATE TABLE IF NOT EXISTS municipality_election_results (
    candidate_id integer REFERENCES candidates(id) NOT NULL,
    election_id integer REFERENCES elections(id) NOT NULL,
    municipality_id integer REFERENCES municipalities(id) NOT NULL,
    votes integer,
    percentage numeric,
    withdrew boolean not null default false,
    won boolean,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX municipality_election_results_unique
ON municipality_election_results
(election_id, municipality_id, candidate_id);


-- CREATE TABLE IF NOT EXISTS counties_districts (
--     county_id integer REFERENCES counties(id) NOT NULL,
--     district_id integer REFERENCES districts(id) NOT NULL
-- );
