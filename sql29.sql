-- ============================================================
-- 29 | FULL OUTER JOIN
-- ============================================================
-- Returns ALL rows from BOTH tables.
-- Matched rows are combined.
-- Unmatched rows from either side return NULL on the other.
--
-- IMPORTANT: MySQL does NOT support FULL OUTER JOIN directly.
-- Workaround: Use LEFT JOIN + UNION + RIGHT JOIN
--
-- Syntax (standard SQL):
--   SELECT cols FROM t1 FULL OUTER JOIN t2 ON t1.col = t2.col
--
-- MySQL workaround:
--   SELECT cols FROM t1 LEFT JOIN t2 ON t1.col = t2.col
--   UNION
--   SELECT cols FROM t1 RIGHT JOIN t2 ON t1.col = t2.col
-- ============================================================

USE sakila;

-- Q1: All films and all inventory — full outer join simulation
SELECT
    f.film_id,
    f.title,
    i.inventory_id,
    i.store_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
UNION
SELECT
    f.film_id,
    f.title,
    i.inventory_id,
    i.store_id
FROM film f
RIGHT JOIN inventory i ON f.film_id = i.film_id
LIMIT 20;

-- Q2: All customers and all payments — unmatched on either side
SELECT
    c.customer_id,
    c.first_name,
    p.payment_id,
    p.amount
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
UNION
SELECT
    c.customer_id,
    c.first_name,
    p.payment_id,
    p.amount
FROM customer c
RIGHT JOIN payment p ON c.customer_id = p.customer_id
LIMIT 20;

-- Q3: All actors and all films — full coverage
SELECT
    a.actor_id,
    a.first_name,
    fa.film_id
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
UNION
SELECT
    a.actor_id,
    a.first_name,
    fa.film_id
FROM actor a
RIGHT JOIN film_actor fa ON a.actor_id = fa.actor_id
LIMIT 20;

-- Q4: Show only UNMATCHED rows from both sides
SELECT
    f.film_id,
    f.title,
    i.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL
UNION
SELECT
    f.film_id,
    f.title,
    i.inventory_id
FROM film f
RIGHT JOIN inventory i ON f.film_id = i.film_id
WHERE f.film_id IS NULL;
