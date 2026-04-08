-- ============================================================
-- 41 | EXISTS / NOT EXISTS
-- ============================================================
-- EXISTS returns TRUE if the subquery returns ANY rows.
-- NOT EXISTS returns TRUE if the subquery returns NO rows.
--
-- EXISTS vs IN:
--   EXISTS stops as soon as it finds a match (faster).
--   IN evaluates all values in the list.
--   EXISTS handles NULLs more safely than NOT IN.
--
-- Syntax:
--   WHERE EXISTS (SELECT 1 FROM table WHERE condition)
--   WHERE NOT EXISTS (SELECT 1 FROM table WHERE condition)
--
-- Tip: Use SELECT 1 inside EXISTS — the actual column
--      doesn't matter, only whether rows are returned.
-- ============================================================

USE sakila;

-- Q1: Customers who have made at least one rental
SELECT first_name, last_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM rental r
    WHERE r.customer_id = c.customer_id
)
LIMIT 10;

-- Q2: Customers who have NEVER made a rental (NOT EXISTS)
SELECT first_name, last_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM rental r
    WHERE r.customer_id = c.customer_id
);

-- Q3: Films that are currently available in inventory
SELECT title
FROM film f
WHERE EXISTS (
    SELECT 1
    FROM inventory i
    WHERE i.film_id = f.film_id
)
LIMIT 10;

-- Q4: Films that have NO inventory copies at all
SELECT title
FROM film f
WHERE NOT EXISTS (
    SELECT 1
    FROM inventory i
    WHERE i.film_id = f.film_id
)
LIMIT 10;
