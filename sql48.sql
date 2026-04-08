-- ============================================================
-- 48 | VIEWS
-- ============================================================
-- A VIEW is a saved SQL query that behaves like a table.
-- It does NOT store data — it runs the query on access.
--
-- Benefits:
--   Simplify complex queries
--   Reuse logic across queries
--   Security: expose only specific columns to users
--
-- Syntax:
--   CREATE VIEW view_name AS SELECT ...;
--   SELECT * FROM view_name;
--   DROP VIEW view_name;
--   CREATE OR REPLACE VIEW view_name AS SELECT ...;
--
-- Note: Views in MySQL are not materialized (no caching).
-- ============================================================

USE sakila;

-- Q1: Create a view of active customers with location
CREATE OR REPLACE VIEW view_active_customers AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    ci.city,
    co.country
FROM customer c
INNER JOIN address a  ON c.address_id  = a.address_id
INNER JOIN city ci    ON a.city_id     = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
WHERE c.active = 1;

-- Use the view
SELECT * FROM view_active_customers LIMIT 10;

-- Q2: Create a view for film rental summary
CREATE OR REPLACE VIEW view_film_rental_summary AS
SELECT
    f.film_id,
    f.title,
    f.rating,
    f.rental_rate,
    COUNT(r.rental_id) AS times_rented
FROM film f
LEFT JOIN inventory i ON f.film_id      = i.film_id
LEFT JOIN rental r    ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, f.rating, f.rental_rate;

-- Use the view
SELECT * FROM view_film_rental_summary
ORDER BY times_rented DESC
LIMIT 10;

-- Q3: Query a view with additional filters (views are composable)
SELECT title, times_rented
FROM view_film_rental_summary
WHERE rating = 'PG-13'
  AND times_rented > 20
ORDER BY times_rented DESC;

-- Q4: Drop views when done
DROP VIEW IF EXISTS view_active_customers;
DROP VIEW IF EXISTS view_film_rental_summary;
