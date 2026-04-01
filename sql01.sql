-- ============================================================
-- 01 | COMMENTS IN SQL
-- ============================================================
-- Single-line:  -- comment
-- Hash style:   # comment  (MySQL specific)
-- Multi-line:   /* comment */
-- ============================================================

USE sakila;

-- Q1: Single-line comment - select all actors
SELECT * FROM actor; -- returns all 200 actors

-- Q2: Multi-line comment
/*
  Selecting film titles and their rental duration
  from the film table in the Sakila database.
*/
SELECT title, rental_duration FROM film;

-- Q3: Hash comment style
# Get all customer first names
SELECT first_name FROM customer;

-- Q4: Inline comment to temporarily exclude a column
SELECT first_name /*, last_name */ FROM actor LIMIT 5;
