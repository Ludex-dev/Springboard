-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

DROP TABLE IF EXISTS song_artists;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS producers;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);
CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT REFERENCES albums(id),
  producer_id INT REFERENCES producers(id)
);
CREATE TABLE song_artists (
  song_id INT REFERENCES songs(id),
  artist_id INT REFERENCES artists(id),
  PRIMARY KEY (song_id, artist_id)
);

INSERT INTO artists (name)
VALUES 
  ('Hanson'), 
  ('Queen'), 
  ('Mariah Cary'), 
  ('Boyz II Men'), 
  ('Lady Gaga'), 
  ('Bradley Cooper'), 
  ('Nickelback'), 
  ('Jay Z'), 
  ('Alicia Keys'), 
  ('Katy Perry'), 
  ('Juicy J'), 
  ('Maroon 5'), 
  ('Christina Aguilera'), 
  ('Avril Lavigne'), 
  ('Destiny''s Child');

INSERT INTO producers (name)
VALUES 
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO albums (name)
VALUES 
  ('Middle of Nowhere'), 
  ('A Night at the Opera'), 
  ('Daydream'), 
  ('A Star Is Born'), 
  ('Silver Side Up'), 
  ('The Blueprint 3'), 
  ('Prism'), 
  ('Hands All Over'), 
  ('Let Go'), 
  ('The Writing''s on the Wall');



  INSERT INTO songs (title, duration_in_seconds, release_date, album_id, producer_id)
  VALUES
    ('MMMBop', 238, '04-15-1997', 1, 1),
    ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2),
    ('One Sweet Day', 282, '11-14-1995', 3, 3),
    ('Shallow', 216, '09-27-2018', 4, 4),
    ('How You Remind Me', 223, '08-21-2001', 5, 5),
    ('New York State of Mind', 276, '10-20-2009', 6, 6),
    ('Dark Horse', 215, '12-17-2013', 7, 7),
    ('Moves Like Jagger', 201, '06-21-2011', 8, 8),
    ('Complicated', 244, '05-14-2002', 9, 9),
    ('Say My Name', 240, '11-07-1999', 10, 10);


INSERT INTO song_artists (song_id, artist_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (3, 4),
  (4, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (6, 9),
  (7, 10),
  (7, 11),
  (8, 12),
  (8, 13),
  (9, 14),
  (10, 15);
  
  CREATE INDEX idx_songs_title ON songs (title);
  CREATE INDEX idx_songs_release_date ON songs (release_date);
  CREATE INDEX idx_song_artists_song_id ON song_artists (song_id);
  CREATE INDEX idx_song_artists_artist_id ON song_artists (artist_id);
