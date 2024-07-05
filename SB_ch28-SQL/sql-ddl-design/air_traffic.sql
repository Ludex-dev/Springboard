-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

DROP TABLE IF EXISTS tickets;

DROP TABLE IF EXISTS passenger;

DROP TABLE IF EXISTS airport;

DROP TABLE IF EXISTS airline;

CREATE TABLE
  passenger (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    sex CHAR(1) NOT NULL,
    age INT NOT NULL
  );

CREATE TABLE
  airport (
    id SERIAL PRIMARY KEY,
    airport_name VARCHAR(70) NOT NULL,
    city VARCHAR(70) NOT NULL,
    country VARCHAR(50) NOT NULL
  );

CREATE TABLE
  airline (
    id SERIAL PRIMARY KEY,
    airline_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
  );

CREATE TABLE
  tickets (
    id SERIAL PRIMARY KEY,
    passenger_id INT NOT NULL,
    airline_id INT NOT NULL,
    airport_id INT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger (id),
    FOREIGN KEY (airline_id) REFERENCES airline (id),
    FOREIGN KEY (airport_id) REFERENCES airport (id),
    seat VARCHAR(5) NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL
  );

INSERT INTO
  passenger (first_name, last_name, sex, age)
VALUES
  ('Jennifer', 'Finch', 'F', 28),
  ('Thadeus', 'Gathercoal', 'M', 35),
  ('Sonja', 'Pauley', 'F', 42),
  ('Waneta', 'Skeleton', 'F', 31),
  ('Berkie', 'Wycliff', 'M', 47),
  ('Alvin', 'Leathes', 'M', 39),
  ('Cory', 'Squibbes', 'M', 26);

INSERT INTO
  airport (airport_name, city, country)
VALUES
  (
    'Washington Dulles International Airport',
    'Washington DC',
    'United States'
  ),
  ('Narita International Airport', 'Tokyo', 'Japan'),
  (
    'Los Angeles International Airport',
    'Los Angeles',
    'United States'
  ),
  (
    'Seattle-Tacoma International Airport',
    'Seattle',
    'United States'
  ),
  ('Charles de Gaulle Airport', 'Paris', 'France'),
  ('Dubai International Airport', 'Dubai', 'UAE'),
  (
    'John F. Kennedy International Airport',
    'New York',
    'United States'
  ),
  (
    'The Eastern Iowa Airport',
    'Cedar Rapids',
    'United States'
  ),
  (
    'Charlotte Douglas International Airport',
    'Charlotte',
    'United States'
  ),
  (
    'Sao Paulo-Guarulhos International Airport',
    'Sao Paulo',
    'Brazil'
  );

INSERT INTO
  airline (airline_name, country)
VALUES
  ('United', 'United States'),
  ('British Airways', 'United Kingdom'),
  ('Delta', 'United States'),
  ('TUI Fly Belgium', 'Belgium'),
  ('Air China', 'China'),
  ('American Airlines', 'United States'),
  ('Avianca Brasil', 'Brazil');

INSERT INTO
  tickets (
    passenger_id,
    airline_id,
    airport_id,
    seat,
    departure,
    arrival
  )
VALUES
  (
    1,
    1,
    1,
    '33B',
    '2018-04-08 09:00:00',
    '2018-04-08 12:00:00'
  ),
  (
    2,
    2,
    2,
    '8A',
    '2018-12-19 12:45:00',
    '2018-12-19 16:15:00'
  ),
  (
    3,
    3,
    3,
    '12F',
    '2018-01-02 07:00:00',
    '2018-01-02 08:03:00'
  ),
  (
    1,
    3,
    4,
    '20A',
    '2018-04-15 16:50:00',
    '2018-04-15 21:00:00'
  ),
  (
    4,
    4,
    5,
    '23D',
    '2018-08-01 18:30:00',
    '2018-08-01 21:50:00'
  ),
  (
    2,
    5,
    6,
    '18C',
    '2018-10-31 01:15:00',
    '2018-10-31 12:55:00'
  ),
  (
    5,
    1,
    7,
    '9E',
    '2019-02-06 06:00:00',
    '2019-02-06 07:47:00'
  ),
  (
    6,
    6,
    8,
    '1A',
    '2018-12-22 14:42:00',
    '2018-12-22 15:56:00'
  ),
  (
    5,
    6,
    9,
    '32B',
    '2019-02-06 16:28:00',
    '2019-02-06 19:18:00'
  ),
  (
    7,
    7,
    10,
    '10D',
    '2019-01-20 19:30:00',
    '2019-01-20 22:45:00'
  );

CREATE INDEX idx_tickets_passenger_id ON tickets (passenger_id);

CREATE INDEX idx_tickets_airline_id ON tickets (airline_id);

CREATE INDEX idx_tickets_airport_id ON tickets (airport_id);