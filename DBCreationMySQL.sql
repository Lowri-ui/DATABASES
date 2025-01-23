-- Crea la base de datos --
CREATE DATABASE IF NOT EXISTS game_database;
USE game_database;

-- Table USERS --
CREATE TABLE users (
	ID INT(8) PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    nick TEXT NOT NULL,
    login TEXT NOT NULL,
    password TEXT NOT NULL,
    birthdate DATE
);

-- Table AVATARS --
CREATE TABLE avatars (
	ID INT(8) PRIMARY KEY NOT NULL,
    user_id INT(8) NOT NULL,
    game_id INT(8) NOT NULL,
    appearance TEXT,
    level INT(4)
);

-- Table GAMES
CREATE TABLE games (
	ID INT(8) PRIMARY KEY NOT NULL,
    code TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    rules TEXT
);

-- Table MATCHES --
CREATE TABLE matches (
	ID INT(8) PRIMARY KEY NOT NULL,
    game_id INT,
    name TEXT NOT NULL,
    password TEXT,
    created_at DATE,
    status TEXT NOT NULL,
    creator_avatar_id INT(8) NOT NULL
);

-- Table MATCH PARTICIPANTS --
CREATE TABLE match_participants (
    match_id INT(8) PRIMARY KEY NOT NULL,
    avatar_id INT(8) PRIMARY KEY NOT NULL
);

-- Table CONFRONTATIONS --
CREATE TABLE confrontations (
    ID INT(8) PRIMARY KEY NOT NULL,
    match_id INT(8) NOT NULL,
    avatar1_id INT(8) NOT NULL,
    avatar2_id INT(8) NOT NULL,
    result TEXT
);