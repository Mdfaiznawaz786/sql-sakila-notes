-- ============================================================
-- 40 | CORRELATED SUBQUERY
-- ============================================================
-- A correlated subquery references a column from the OUTER query.
-- It is executed ONCE PER ROW of the outer query.
-- Slower than regular subqueries — use with care on large tables.
--
-- vs Regular Subquery:
--   Regular    : runs once, result reused
--   Correlated : runs once per outer row
--
-- Common use: row-by-row comparisons, finding per-group max/min
-- ============================================================

USE sakila;

-- Q1: Find customers whose total spend is above the average
--     for their own store
SELECT
    c.first_name,
    c.last_name,
    c.store_id,
    (SELECT SUM(p.amount)
     FROM payment p
     WHERE p.customer_id = c.customer_id) AS total_spent
FROM customer c
WHERE (
    SELECT SUM(p.amount)
    FROM payment p
    WHERE p.customer_id = c.customer_id
) > (
    SELECT AVG(store_total)
    FROM (
        SELECT SUM(p2.amount) AS store_total
        FROM customer c2
        INNER JOIN payment p2 ON c2.customer_id = p2.customer_id
        WHERE c2.store_id = c.store_id
        GROUP BY c2.customer_id
    ) AS store_avg
)
LIMIT 10;

-- Q2: For each film, show if it has been rented more than 20 times
SELECT
    f.title,
    (SELECT COUNT(*)
     FROM inventory i
     INNER JOIN rental r ON i.inventory_id = r.inventory_id
     WHERE i.film_id = f.film_id
    ) AS times_rented
FROM film f
WHERE (
    SELECT COUNT(*)
    FROM inventory i
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE i.film_id = f.film_id
) > 20
ORDER BY times_rented DESC
LIMIT 10;

-- Q3: Each customer's latest rental date (correlated in SELECT)
SELECT
    c.first_name,
    c.last_name,
    (SELECT MAX(r.rental_date)
     FROM rental r
     WHERE r.customer_id = c.customer_id
    ) AS last_rental_date
FROM customer c
LIMIT 10;

-- Q4: Films whose rental rate is higher than the avg for their rating
SELECT title, rating, rental_rate
FROM film f
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film f2
    WHERE f2.rating = f.rating
)
ORDER BY rating, rental_rate DESC
LIMIT 15;
