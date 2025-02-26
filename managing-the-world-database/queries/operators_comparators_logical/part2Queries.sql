-- Part 2: Views, Users, and Privileges
-- Create views
CREATE VIEW high_population_cities AS
SELECT * FROM city WHERE population > 1000000;

CREATE VIEW countries_with_languages AS
SELECT c.*, cl.* FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode;

-- Create user and assign privileges
CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'password';
GRANT INSERT, UPDATE ON world.city TO 'db_user'@'localhost';
REVOKE INSERT, UPDATE ON world.country FROM 'db_user'@'localhost';
GRANT SELECT ON world.high_population_cities TO 'db_user'@'localhost';

