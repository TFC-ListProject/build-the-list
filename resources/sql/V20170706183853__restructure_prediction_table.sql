ALTER TABLE predictions
  DROP COLUMN IF EXISTS turnout;

ALTER TABLE predictions
  DROP COLUMN IF EXISTS dollars_spent;

ALTER TABLE predictions
  DROP COLUMN IF EXISTS chance_win;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS turnout_delta numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS spend_ratio numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS historical_turnout numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS historical_d_spend numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS historical_r_spend numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS historical_spend_ratio numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS current_d_spend numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS current_r_spend numeric NOT NULL;

ALTER TABLE predictions
  ADD COLUMN IF NOT EXISTS prediction numeric NOT NULL;
