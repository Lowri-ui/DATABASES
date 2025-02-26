-- Part 1: Data Types, Validation Restrictions & Indexes
-- List all tables in the "world" database
SHOW TABLES;

-- Identify data types used in country, city, and countrylanguage tables
DESCRIBE country;
DESCRIBE city;
DESCRIBE countrylanguage;

-- Add new columns
ALTER TABLE city ADD COLUMN is_population_large BOOLEAN;
ALTER TABLE country ADD COLUMN region_code CHAR(3) DEFAULT 'NA';

-- Add validation constraints
ALTER TABLE city ADD CONSTRAINT chk_population CHECK (population >= 0);
ALTER TABLE country ADD CONSTRAINT unique_country_code UNIQUE (code);

-- Create indexes
CREATE INDEX idx_city_name ON city(name);





