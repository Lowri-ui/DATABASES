-- Part 6: Transactions
-- Basic transaction with rollback
START TRANSACTION;
INSERT INTO city (name, countrycode, district, population) VALUES ('TestCity', 'USA', 'TestDistrict', 500000);
ROLLBACK;

-- Transaction with multiple operations
START TRANSACTION;
INSERT INTO city (name, countrycode, district, population) VALUES ('NewCity', 'FRA', 'NewDistrict', 700000);
UPDATE country SET population = population + 700000 WHERE code = 'FRA';
COMMIT;

-- Savepoint and rollback
START TRANSACTION;
SAVEPOINT sp1;
UPDATE country SET population = population - 500000 WHERE code = 'USA';
ROLLBACK TO sp1;
COMMIT;