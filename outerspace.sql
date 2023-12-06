-- create tables

CREATE TABLE stars (
    name VARCHAR(20) PRIMARY KEY,
    temp INT
);

CREATE TABLE planets (
    name VARCHAR(20) PRIMARY KEY,
    orbital_period NUMERIC,
    star VARCHAR(20) NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    name VARCHAR(20) PRIMARY KEY,
    planet  VARCHAR(20) REFERENCES planets
);

