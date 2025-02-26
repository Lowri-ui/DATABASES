-- Part 5: Query Optimization
-- Top 10 cities by population
SELECT * FROM city ORDER BY population DESC LIMIT 10;

-- Use EXPLAIN for performance check
EXPLAIN SELECT * FROM city ORDER BY population DESC LIMIT 10;

-- Search optimized with index
SELECT * FROM city WHERE population > 1000000 AND name LIKE 'A%';
