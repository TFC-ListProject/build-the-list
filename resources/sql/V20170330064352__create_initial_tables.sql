CREATE TABLE IF NOT EXISTS candidates (
  id SERIAL PRIMARY KEY,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS districts (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  state varchar(2) NOT NULL
);
CREATE UNIQUE INDEX idx_districts_state_lower_unique ON districts (lower(state));

CREATE TABLE IF NOT EXISTS election_types (
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS elections (
  id SERIAL PRIMARY KEY,
  election_type_id integer REFERENCES election_types(id) NOT NULL,
  year smallint NOT NULL,
  state varchar(2)
);
CREATE UNIQUE INDEX idx_elections_state_lower_unique ON elections (lower(state));
CREATE INDEX idx_elections_election_type_id ON elections(election_type_id);

CREATE TABLE IF NOT EXISTS municipalities (
  id SERIAL PRIMARY KEY,
  district_id integer REFERENCES districts(id) NOT NULL,
  name varchar(255) NOT NULL
);
CREATE INDEX idx_elections_district_id ON municipalities(district_id);

CREATE TABLE IF NOT EXISTS parties (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS candidates_elections (
  candidate_id integer REFERENCES candidates(id) NOT NULL,
  election_id integer REFERENCES elections(id) NOT NULL,
  party_id integer REFERENCES parties(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS district_election_results (
  candidate_id integer REFERENCES candidates(id) NOT NULL,
  district_id integer REFERENCES districts(id) NOT NULL,
  election_id integer REFERENCES elections(id) NOT NULL,
  votes integer NOT NULL
);

CREATE TABLE IF NOT EXISTS municipality_election_results (
  candidate_id integer REFERENCES candidates(id) NOT NULL,
  election_id integer REFERENCES elections(id) NOT NULL,
  municipality_id integer REFERENCES municipalities(id) NOT NULL,
  votes integer NOT NULL
);
