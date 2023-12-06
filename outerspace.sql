-- create tables

CREATE TABLE stars (
    name VARCHAR(20) PRIMARY KEY,
    temp_kelvin FLOAT
);

CREATE TABLE planets (
    name VARCHAR(20) PRIMARY KEY,
    orbital_period_yrs NUMERIC,
    star VARCHAR(20) NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    name VARCHAR(20) PRIMARY KEY,
    planet  VARCHAR(20) REFERENCES planets
);


-- Insert data into tables

INSERT INTO stars (name, temp_kelvin)
    VALUES
        ('The Sun', 5800),
        ('Proxima Centauri', 3042),
        ('Gliese 876', 3192);

INSERT INTO planets (name, orbital_period_yrs, star)
    VALUES
        ('Earth', 1.00, 'The Sun'),
        ('Mars', 1.882, 'The Sun'),
        ('Venus', 0.62, 'The Sun'),
        ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
        ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (name, planet)
    VALUES
        ('The Moon', 'Earth'),
        ('Phobos', 'Mars'),
        ('Deimos', 'Mars');


-- name of planet, star is revolves around, number of moons

SELECT p.name, star, COUNT(m.name) as moons_count
    FROM planets AS p
        LEFT JOIN moons AS m
        ON p.name = m.planet
    GROUP BY p.name
    ORDER BY p.name ASC;







