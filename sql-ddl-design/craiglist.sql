-- from the terminal run:
-- psql < craiglist.sql
DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS regions;

CREATE TABLE
   regions (
      id SERIAL PRIMARY KEY,
      states VARCHAR(80) NOT NULL,
      city VARCHAR(80) NOT NULL,
      county VARCHAR(80) NOT NULL
   );

CREATE TABLE
   categories (id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL);

CREATE TABLE
   users (
      id SERIAL PRIMARY KEY,
      first_name VARCHAR(40) NOT NULL,
      last_name VARCHAR(40) NOT NULL,
      email VARCHAR(80) NOT NULL,
      preferred_region_id INT,
      FOREIGN KEY (preferred_region_id) REFERENCES regions (id),
      preferred_category_id INT,
      FOREIGN KEY (preferred_category_id) REFERENCES categories (id)
   );

CREATE TABLE
   posts (
      id SERIAL PRIMARY KEY,
      title VARCHAR(40) NOT NULL,
      content TEXT[] NOT NULL,
      user_id INT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users (id),
      region_id INT NOT NULL,
      FOREIGN KEY (region_id) REFERENCES regions (id),
      category_id INT NOT NULL,
      FOREIGN KEY (category_id) REFERENCES categories (id)
   );

INSERT INTO
   regions (states, city, county)
VALUES
   (
      'California',
      'San Francisco',
      'San Francisco County'
   ),
   ('Georgia', 'Atlanta', 'Fulton County'),
   ('Washington', 'Seattle', 'King County');


INSERT INTO
   categories (name)
VALUES
   ('Housing'),
   ('Jobs'),
   ('For Sale');


INSERT INTO
   users (
      first_name,
      last_name,
      email,
      preferred_region_id,
      preferred_category_id
   )
VALUES
   ('John', 'Doe', 'john.doe@example.com', 1, 1),
   ('Jane', 'Smith', 'jane.smith@example.com', 2, 2),
   (
      'Alice',
      'Johnson',
      'alice.johnson@example.com',
      3,
      3
   );


INSERT INTO
   posts (title, content, user_id, region_id, category_id)
VALUES
   (
      'Lovely apartment for rent',
      '{Spacious 2-bedroom apartment in the heart of San Francisco.}',
      1,
      1,
      1
   ),
   (
      'Software developer job',
      '{Looking for an experienced software developer in Atlanta.}',
      2,
      2,
      2
   ),
   (
      'Bicycle for sale',
      '{Almost new bicycle for sale in Seattle.}',
      3,
      3,
      3
   );

CREATE INDEX idx_post_user_id ON posts (user_id);
CREATE INDEX idx_post_region_id ON posts (region_id);
CREATE INDEX idx_post_category_id ON posts (category_id);
