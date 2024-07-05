-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

DROP TABLE IF EXISTS player_stats;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS league_season;
DROP TABLE IF EXISTS referee;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS team_ranking;

CREATE TABLE teams (
   id SERIAL PRIMARY KEY,
   team VARCHAR(15) UNIQUE
);

CREATE TABLE referee (
   id SERIAL PRIMARY KEY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL
);

CREATE TABLE league_season (
   id SERIAL PRIMARY KEY,
   begin_date DATE NOT NULL,
   end_date DATE NOT NULL
);

CREATE TABLE players (
   id SERIAL PRIMARY KEY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   jersey_number INT NOT NULL,
   team_id INT REFERENCES teams(id)
);

CREATE TABLE game (
   id SERIAL PRIMARY KEY,
   team01_id INT REFERENCES teams(id),
   team02_id INT REFERENCES teams(id),
   date TIMESTAMP NOT NULL,
   referee_id INT REFERENCES referee(id),
   league_season_id INT REFERENCES league_season(id),
   team_01 INT NOT NULL,
   team_02 INT NOT NULL
);

CREATE TABLE player_stats (
   id SERIAL PRIMARY KEY,
   player_id INT REFERENCES players(id),
   game_id INT REFERENCES game(id),
   team_id INT REFERENCES teams(id),
   league_season_id INT REFERENCES league_season(id),
   player_score INT NOT NULL
);

CREATE TABLE team_ranking (
   id SERIAL PRIMARY KEY,
   team_id INT REFERENCES teams(id)
   league_season_id INT REFERENCES league_season(id),
   gross_scores INT NOT NULL
);

CREATE INDEX idx_players_team_id ON players(team_id);
CREATE INDEX idx_game_team01_id ON game(team01_id);
CREATE INDEX idx_game_team02_id ON game(team02_id);
CREATE INDEX idx_game_referee_id ON game(referee_id);
CREATE INDEX idx_game_league_season_id ON game(league_season_id);
CREATE INDEX idx_player_stats_composite ON player_stats(player_id, game_id, team_id, league_season_id);
CREATE INDEX idx_player_stats_composite ON player_stats(player_id, game_id, team_id, league_season_id);

   