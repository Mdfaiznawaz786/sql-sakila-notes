-- ============================================================
-- 37 | SCALAR SUBQUERY
-- ============================================================
-- A scalar subquery returns exactly ONE row and ONE column.
-- It can be used anywhere a single value is expected:
--   SELECT clause, WHERE clause, HAVING clause.
--
-- Rules:
--   Must return exactly 1 row and 1 column.
--   If it returns more than 1 row -> ERROR.
--   If it returns no rows -> returns NULL.
-- ============================================================

USE sakila;

-- Q1: Find films with a rental rate above the overall average
SELECT title, rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate) FROM film
)
ORDER BY rental_rate
LIMIT 10;

-- Q2: Show each film's rental rate vs the overall average
SELECT
    title,
    rental_rate,
    (SELECT AVG(rental_rate) FROM film) AS avg_rate,
    rental_rate - (SELECT AVG(rental_rate) FROM film) AS diff_from_avg
FROM film
LIMIT 10;

-- Q3: Customer who made the single highest payment
SELECT first_name, last_name
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM payment
    ORDER BY amount DESC
    LIMIT 1
);

-- Q4: Film with the longest runtime
SELECT title, length
FROM film
WHERE length = (
    SELECT MAX(length) FROM film
);
