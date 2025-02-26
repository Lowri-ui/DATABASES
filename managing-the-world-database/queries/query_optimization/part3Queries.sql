-- Part 3: Operators, Comparators, and Logical Operators
-- Countries with population between 50M and 200M
SELECT * FROM country WHERE population BETWEEN 50000000 AND 200000000;

-- Filter cities by population and region
SELECT * FROM city WHERE population > 500000 AND region = 'Europe';

-- Retrieve countries where population > 100M or region is Europe
SELECT * FROM country WHERE population > 100000000 OR region = 'Europe';
