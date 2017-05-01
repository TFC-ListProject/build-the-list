-- ALTER TABLE counties ADD COLUMN state varchar(2) NOT NULL;
-- CREATE UNIQUE INDEX idx_counties_name_and_state_unique ON counties (name, state);

-- CREATE UNIQUE INDEX idx_municipalities_county_id_and_name_unique ON municipalities (county_id, name);
-- CREATE UNIQUE INDEX idx_districts_name_and_state_unique ON districts (name, state);

-- CREATE UNIQUE INDEX idx_district_election_results_ids ON district_election_results (candidate_id, district_id, election_id);
-- CREATE UNIQUE INDEX idx_county_election_results_ids ON county_election_results (candidate_id, county_id, election_id);
-- CREATE UNIQUE INDEX idx_municipality_election_results_ids ON municipality_election_results (candidate_id, election_id, municipality_id);
-- CREATE UNIQUE INDEX idx_counties_districts_on_ids ON counties_districts (county_id, district_id);

-- CREATE UNIQUE INDEX idx_elections ON elections (election_type_id, state, year);
