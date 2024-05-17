-- Create database
CREATE DATABASE universe;

-- Connect to the database
\c universe;

-- Add tables
CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    abbreviation CHAR(3) NOT NULL
);

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    diameter_ly INT NOT NULL,
    distance_ly NUMERIC,
    is_spiral BOOLEAN,
    constellation_id INT REFERENCES constellation(constellation_id)
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    age_in_billion_years VARCHAR(30) NOT NULL,
    apparent_magnitude NUMERIC NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    has_life BOOLEAN NOT NULL,
    discovery_year INT,
    star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    discovered_by TEXT NOT NULL,
    discovery_year INT,
    planet_id INT REFERENCES planet(planet_id)
);

-- View table overview
\d

-- Add values to the constellation table
INSERT INTO constellation(name, abbreviation)
VALUES
('Sagittarius', 'Sgr'),
('Dorado', 'DOR'),
('Andromeda', 'And'),
('Ursa Major', 'UMa'),
('Virgo', 'Vir'),
('Canes Venatici', 'CVn'),
('Draco', 'Dra'),
('Serpens', 'Ser');

-- view constellation table
SELECT * FROM constellation;

-- Add values to the galaxy table
INSERT INTO galaxy(name, diameter_ly, distance_ly, is_spiral, constellation_id)
VALUES
('Milky Way', 100000, 0, TRUE, 1),
('Large Magellanic Cloud', 14000, 158000, TRUE, 2),
('Andromeda', 220000, 2500000, TRUE, 3),
('Cigar Galaxy', 37000, 11500000, TRUE, 4),
('Pinwheel Galaxy', 170000, 20870000, TRUE, 4),
('Sombrero Galaxy', 50000, 29350000, TRUE, 5),
('Whirlpool Galaxy', 60000, 30000000, TRUE, 6),
('Medusa Merger', 28500, 128000000, FALSE, 4),
('Tadpole Galaxy', 280000, 420000000, TRUE, 7),
('Hag''s Object', 100000, 600000000, FALSE, 8);

-- view galaxy table
SELECT * FROM galaxy;

-- Add values to the star table
INSERT INTO star(name, age_in_billion_years, apparent_magnitude, galaxy_id)
VALUES
('Polaris', '45-67', 1.98, 1),
('Sirius', '242', -1.46, 1),
('Proxima Centauri', '4.85', 15.5, 1),
('Betelgeuse', '8-14', 0.50, 1),
('Rigel', '8', 6.67, 1),
('Sun', '4.6', -26.74, 1);

-- view star table
SELECT * FROM star;

-- Add values to the planet table
INSERT INTO planet(name, has_life, discovery_year, star_id)
VALUES
('Proxima Centauri b', FALSE, 2016, 3),
('Proxima Centauri d', FALSE, 2020, 3),
('Mercury', FALSE, NULL, 6),
('Venus', FALSE, NULL, 6),
('Earth', TRUE, NULL, 6),
('Mars', FALSE, NULL, 6),
('Jupiter', FALSE, NULL, 6),
('Saturn', FALSE, NULL, 6),
('Uranus', FALSE, 1781, 6),
('Neptune', FALSE, 1846, 6),
('Pluto', FALSE, 1930, 6),
('Ceres', FALSE, 1801, 6);

-- view planet table
SELECT * FROM planet;

-- Add values to the moon table
INSERT INTO moon(name, discovered_by, discovery_year, planet_id)
VALUES
('Triton', 'William Lassell', 1846, 10),
('Proteus', 'Voyager 2, Stephen P. Synnott', 1989, 10),
('Larissa', 'Harold J. Reitsema, William B. Hubbard, Larry A. Lebofsky and David J. Tholen', 1981, 10),
('Galatea', 'Stephen P. Synnott and Voyager Imaging Team', 1989, 10),
('Despina', 'Stephen P. Synnott and Voyager Imaging Team', 1989, 10),
('Charon', 'James W. Christy', 1978, 11),
('Styx', 'Showalter, M.R. et al.', 2012, 11),
('Nix', 'Hal A. Weaver et al.', 2005, 11),
('Kerberos', 'Showalter, M.R. et al.', 2011, 11),
('Hydra', 'Hubble Space Telescope', 2005, 11),
('Umbriel', 'William Lassell', 1851, 9),
('Ariel', 'William Lassell', 1851, 9),
('Miranda', 'Gerard P. Kuiper', 1948, 9),
('Rhea', 'G. D. Cassini', 1672, 8),
('Titan', 'Christiaan Huygens', 1655, 8),
('Deimos', 'Asaph Hall', 1877, 6),
('Phobos', 'Asaph Hall', 1877, 6),
('Callisto', 'Galileo Galilei, Simon Marius', 1610, 7),
('Ganymede', 'Galileo Galilei, Simon Marius', 1610, 7),
('Europa', 'Galileo Galilei, Simon Marius', 1610, 7);

-- view moon table
SELECT * FROM moon;
