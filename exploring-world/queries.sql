# BASIC QUERIES
-- 1. Retrieve all country names and their official languages.
SELECT country.Name, countrylanguage.Language
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';

-- 2.	List all cities in Germany along with their population.
SELECT city.Name, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Germany';

-- 3.	Find the five smallest countries by surface area.
SELECT Name, SurfaceArea
FROM country
ORDER BY SurfaceArea ASC
LIMIT 5;


#FILTERING AGGREGATION
-- 1. Find all countries with a population greater than 50 million and sort them in descending order of population.
SELECT Name, Population
FROM country
WHERE Population > 50000000
ORDER BY Population DESC;

-- 2.	Retrieve the average life expectancy per continent.
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM country
GROUP BY Continent;

-- 3.	Calculate the total population per region.
SELECT Region, SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region;

-- 4.	Count the number of cities in each country and sort by the highest count.
SELECT country.Name, COUNT(city.ID) AS CityCount
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name
ORDER BY CityCount DESC;


#JOINS SUBQUERIES
-- 1. Display the top 10 largest cities along with their country name.
SELECT city.Name AS City, city.Population, country.Name AS Country
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 10;

-- 2. Retrieve the names of all countries that have an official language of French.
SELECT DISTINCT country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- 3. Find all countries where English is spoken, but it is not the official language.
SELECT DISTINCT country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F';


#ADVANCED QUERIES
-- 1. Find countries where the population tripled in the past 50 years (if historical data is available).
DESC country;
SELECT Name, Population, 
       ROUND(Population / POW(1.02, 50)) AS Estimated_Population_50Y_Ago
FROM country
WHERE Population >= 3 * ROUND(Population / POW(1.02, 50));

-- 2. List the richest and poorest countries in each continent based on GNP (Gross National Product).
SELECT c.Continent, c.Name, c.GNP
FROM country c
WHERE c.GNP = (
    SELECT MAX(GNP) FROM country WHERE Continent = c.Continent
) 
OR c.GNP = (
    SELECT MIN(GNP) FROM country WHERE Continent = c.Continent AND GNP > 0
);

-- 3. Identify countries with a life expectancy below the global average.
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
AND LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country WHERE LifeExpectancy IS NOT NULL);

-- 4. Retrieve the capital cities of countries with a population above 100 million
SELECT city.Name AS Capital, country.Name AS Country
FROM city
JOIN country ON city.ID = country.Capital
WHERE country.Population > 100000000;

-- 5.	Find the continent with the highest number of countries.
SELECT Continent, COUNT(Name) AS CountryCount
FROM country
GROUP BY Continent
ORDER BY CountryCount DESC
LIMIT 1;
