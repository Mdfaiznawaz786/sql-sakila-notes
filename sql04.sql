-- ============================================================
-- 04 | ALIASES
-- ============================================================
-- Aliases give a temporary name to a column or table
-- Use AS keyword (optional but recommended)
-- Table aliases are useful in JOINs
-- ============================================================

USE sakila;

-- Q1: Rename columns for cleaner output
SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM actor;

-- Q2: Alias a calculated column
SELECT title, rental_rate * rental_duration AS 'Estimated Revenue'
FROM film
LIMIT 10;

-- Q3: Table alias
SELECT a.first_name, a.last_name
FROM actor AS a
WHERE a.actor_id <= 5;

-- Q4: Concatenated full name alias
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
LIMIT 10;
