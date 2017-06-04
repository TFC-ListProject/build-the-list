-- set percentage

UPDATE district_election_results der
SET percentage = (CAST(votes AS DECIMAL) / der_sum.total_votes) * 100
FROM (
  SELECT district_id, election_id, SUM(votes) AS total_votes
  FROM district_election_results
  GROUP BY district_id, election_id
) der_sum
WHERE der.district_id = der_sum.district_id AND
  der.election_id = der_sum.election_id AND
  der_sum.total_votes > 0 AND
  der.votes > 0;

-- set won

DROP TABLE IF EXISTS der_winners;
CREATE TABLE der_winners (district_id integer, election_id integer, candidate_id integer);
CREATE UNIQUE INDEX idx_der_winners ON der_winners (district_id, election_id);

INSERT INTO der_winners
SELECT der.district_id, der.election_id, der.candidate_id
FROM district_election_results der
JOIN elections e ON der.election_id = e.id
JOIN election_types et ON e.election_type_id = et.id
JOIN districts d ON der.district_id = d.id
JOIN district_types dt ON d.district_type_id = dt.id
WHERE et.name = dt.name AND der.votes > 0
ORDER BY der.votes DESC
ON CONFLICT DO NOTHING;

UPDATE district_election_results der
SET won = TRUE
FROM der_winners
WHERE der.district_id = der_winners.district_id AND
  der.election_id = der_winners.election_id AND
  der.candidate_id = der_winners.candidate_id;

UPDATE district_election_results der
SET won = FALSE
FROM der_winners
WHERE der.district_id = der_winners.district_id AND
  der.election_id = der_winners.election_id AND
  der.candidate_id != der_winners.candidate_id;

-- NJ GA has two winners per district!

DELETE FROM der_winners;

INSERT INTO der_winners
SELECT der.district_id, der.election_id, der.candidate_id
FROM district_election_results der
JOIN elections e ON der.election_id = e.id
JOIN election_types et ON e.election_type_id = et.id
JOIN districts d ON der.district_id = d.id
JOIN district_types dt ON d.district_type_id = dt.id
WHERE et.name = dt.name AND
  der.votes > 0 AND
  NOT der.won AND
  d.state = 'nj' AND
  dt.name = 'state lower house'
ORDER BY der.votes DESC
ON CONFLICT DO NOTHING;

UPDATE district_election_results der
SET won = TRUE
FROM der_winners
WHERE der.district_id = der_winners.district_id AND
  der.election_id = der_winners.election_id AND
  der.candidate_id = der_winners.candidate_id;

DROP TABLE der_winners;
