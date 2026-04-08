-- ============================================================
-- 49 | INDEXES AND PERFORMANCE
-- ============================================================
-- An index speeds up data retrieval by creating a lookup
-- structure on one or more columns.
--
-- Types:
--   PRIMARY KEY  : unique, not null, auto-indexed
--   UNIQUE       : enforces uniqueness + creates index
--   INDEX        : general-purpose lookup index
--   FULLTEXT     : for full-text searches on text columns
--   COMPOSITE    : index on multiple columns
--
-- When to index:
--   Columns in WHERE, JOIN ON, ORDER BY, GROUP BY
--
-- When NOT to index:
--   Small tables, columns rarely queried,
--   columns with very few distinct values (e.g. boolean)
--
-- Trade-off: Faster reads, slightly slower writes.
-- ============================================================

USE sakila;

-- Q1: View existing indexes on a table
SHOW INDEX FROM film;
SHOW INDEX FROM rental;
SHOW INDEX FROM payment;

-- Q2: Create a simple index on film.title for faster title searches
CREATE INDEX idx_film_title ON film(title);

-- Verify it was created
SHOW INDEX FROM film WHERE Key_name = 'idx_film_title';

-- Q3: Create a composite index on rental(customer_id, rental_date)
-- Useful when filtering/sorting by both columns together
CREATE INDEX idx_rental_customer_date ON rental(customer_id, rental_date);

-- Q4: Use EXPLAIN to see if MySQL uses the index
EXPLAIN
SELECT * FROM film WHERE title = 'ACADEMY DINOSAUR';

EXPLAIN
SELECT * FROM rental
WHERE customer_id = 1
ORDER BY rental_date DESC;

-- Q5: Drop indexes when no longer needed
DROP INDEX idx_film_title ON film;
DROP INDEX idx_rental_customer_date ON rental;
