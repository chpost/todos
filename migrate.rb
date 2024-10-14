require 'pg'

db = PG.connect(ENV['DATABASE_URL'])

db.exec <<~SQL
  CREATE TABLE IF NOT EXISTS lists (
    id serial PRIMARY KEY,
    name text UNIQUE NOT NULL
  );

  CREATE TABLE IF NOT EXISTS todos (
    id serial PRIMARY KEY,
    name text NOT NULL,
    completed boolean NOT NULL default false,
    list_id integer REFERENCES lists (id)
      ON DELETE CASCADE NOT NULL
  );
SQL

db.close
