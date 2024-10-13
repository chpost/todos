CREATE TABLE lists (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE todos (
  id serial PRIMARY KEY,
  name text NOT NULL,
  completed boolean NOT NULL default false,
  list_id integer REFERENCES lists (id)
    ON DELETE CASCADE NOT NULL
);