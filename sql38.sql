-- ============================================================
-- 38 | SUBQUERY IN WHERE
-- ============================================================
-- A subquery inside WHERE filters rows based on the result
-- of another query.
--
-- Common patterns:
--   WHERE col = (subquery)       -- scalar
--   WHERE col IN (subquery)      -- list
--   WHERE col > (subquery)       -- comparison
--   WHERE EXISTS (subquery)      -- existence check
--   WHERE col > ALL (subquery)   -- compare against all values
--   WHERE col > ANY (subquery)   -- compare against any value
-- ============================================================

USE sakila;

-- Q1: Films that have never been rented (not in inventory rentals)
SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT i.film_id
    FROM inventory i
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
)
LIMIT 10;

-- Q2: Customers who have rented more than the average number of rentals
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > (
        SELECT AVG(rental_count)
        FROM (
            SELECT COUNT(*) AS rental_count
            FROM rental
            GROUP BY customer_id
        ) AS avg_sub
    )
)
LIMIT 10;

-- Q3: Films with a replacement cost higher than ALL PG-13 films
SELECT title, rating, replacement_cost
FROM film
WHERE replacement_cost > ALL (
    SELECT replacement_cost
    FROM film
    WHERE rating = 'PG-13'
)
LIMIT 10;

-- Q4: Customers who made at least one payment over $9
SELECT DISTINCT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 9.00
);
