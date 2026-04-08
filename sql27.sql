-- ============================================================
-- 27 | LEFT JOIN (LEFT OUTER JOIN)
-- ============================================================
-- Returns ALL rows from the LEFT table.
-- Matched rows from the RIGHT table are included.
-- Unmatched right side columns return NULL.
--
-- Use when: you want everything from the left table
--           regardless of whether a match exists.
--
-- Syntax:
--   SELECT cols
--   FROM table1
--   LEFT JOIN table2 ON table1.col = table2.col
-- ============================================================

USE sakila;

-- Q1: All customers and their rentals (including customers with no rentals)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    r.rental_id,
    r.rental_date
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LIMIT 15;

-- Q2: Find customers who have NEVER made a rental
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;

-- Q3: All films and their inventory (films with no inventory copies)
SELECT
    f.film_id,
    f.title,
    i.inventory_id,
    i.store_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL
LIMIT 10;

-- Q4: All actors and how many films they appear in (including 0)
SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count ASC
LIMIT 10;
