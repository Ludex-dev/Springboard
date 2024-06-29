-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

DROP TABLE IF EXISTS moons;
DROP TABLE IF EXISTS planets;
DROP TABLE IF EXISTS solar_systems;

CREATE TABLE solar_systems (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  primary_star VARCHAR(50) UNIQUE NOT NULL,
  auxiliary_star VARCHAR(50) UNIQUE
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  orbital_period_in_years INT NOT NULL CHECK (orbital_period_in_years >= 0),
  orbits_around VARCHAR(50) NOT NULL,
  solar_system_id INT NOT NULL,
  FOREIGN KEY (solar_system_id) REFERENCES solar_systems(id)
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  planet_id INT NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planets(id)
);

INSERT INTO solar_systems (name, primary_star, auxiliary_star) VALUES
  ('Solar System', 'The Sun', NULL),
  ('Alpha Centauri System', 'Alpha Centauri A', 'Alpha Centauri B'),
  ('Proxima Centauri System', 'Proxima Centauri', NULL),
  ('Sirius System', 'Sirius A', 'Sirius B');

INSERT INTO planets (name, orbital_period_in_years, orbits_around, solar_system_id) VALUES
  ('Mercury', 88, 'The Sun', 1),
  ('Venus', 225, 'The Sun', 1),
  ('Earth', 365, 'The Sun', 1),
  ('Mars', 687, 'The Sun', 1),
  ('Proxima Centauri b', 11, 'Proxima Centauri', 2),
  ('Sirius b', 50, 'Sirius A', 3);

INSERT INTO moons (name, planet_id) VALUES
  ('The Moon', 3),
  ('Phobos', 4),
  ('Deimos', 4),
  ('Proxima b Moon 1', 5),
  ('Sirius b Moon 1', 6);

CREATE INDEX idx_solar_systems_name ON solar_systems (name);
CREATE INDEX idx_solar_systems_primary_star ON solar_systems (primary_star);

CREATE INDEX idx_planets_name ON planets (name);
CREATE INDEX idx_planets_orbits_around ON planets (orbits_around);

CREATE INDEX idx_moons_name ON moons (name);
  
