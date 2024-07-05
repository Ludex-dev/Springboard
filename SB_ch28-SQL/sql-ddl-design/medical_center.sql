-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS diagonosis;
DROP TABLE IF EXISTS visit;

CREATE TABLE doctors 
(
   id SERIAL PRIMARY KEY
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   contact_phone INTEGER VARCHAR(12),
   email TEXT NOT NULL,
   specialty TEXT NOT NULL
);

CREATE TABLE patients 
(
   id SERIAL PRIMARY KEY
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   sex ENUM('m','f'),
   contact_phone INTEGER VARCHAR(12),
   email TEXT NOT NULL,
   birth_date DATE NOT NULL
);

CREATE TABLE diseases 
(
   id SERIAL PRIMARY KEY
   name TEXT NOT NULL,
   description TEXT NOT NULL
);

CREATE TABLE diagonosis (
   id SERIAL PRIMARY KEY
   visit_id INT REFERENCES visit(id),
   disease_id INT REFERENCES diseases(id),
   notes TEXT NOT NULL
);

CREATE TABLE visit (
   id SERIAL PRIMARY KEY
   doctor_id INT REFERENCES doctors(id),
   patient_id INT REFERENCES patients(id),
   diagonosis_id INT REFERENCES diagonosis(id),
   visit_date DATE NOT NULL,
   notes TEXT NOT NULL
);

CREATE INDEX idx_doctors_last_name ON doctors (last_name);

CREATE INDEX idx_patients_last_name ON patients (last_name);

CREATE INDEX idx_diseases_name ON diseases (name);

CREATE INDEX idx_visit_doctor_id ON visit (doctor_id);
CREATE INDEX idx_visit_patient_id ON visit (patient_id);
CREATE INDEX idx_visit_visit_date ON visit (visit_date);
