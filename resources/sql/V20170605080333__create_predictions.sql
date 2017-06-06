-- predictions
CREATE TABLE IF NOT EXISTS predictions (
  id SERIAL PRIMARY KEY,
  state varchar(2) NOT NULL,
  district_number integer NOT NULL,
  turnout numeric NOT NULL,
  dollars_spent integer NOT NULL,
  chance_win numeric NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);
