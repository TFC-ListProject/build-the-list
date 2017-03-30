CREATE TABLE election_types (
  id serial primary key,
  name varchar(100) NOT NULL
);

CREATE TABLE elections (
  id serial PRIMARY KEY,
  election_type_id integer NOT NULL,
  year smallint NOT NULL,
  state varchar(2)
);
