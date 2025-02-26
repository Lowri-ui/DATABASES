-- Part 4: Internal and External Composition of Data
-- Subquery for countries with more than 5 cities over 1M population
SELECT countrycode FROM city WHERE population > 1000000 GROUP BY countrycode HAVING COUNT(*) > 5;

-- Join city, country, and countrylanguage excluding English
SELECT city.name, country.name, countrylanguage.language 
FROM city 
JOIN country ON city.countrycode = country.code
JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode
WHERE countrylanguage.language <> 'English';
