-- ============================================================
-- 34 | JOIN CONDITIONS AND JOIN ORDER
-- ============================================================
-- Join condition: the ON clause that links two tables.
-- You can have multiple conditions in ON using AND / OR.
-- Join order affects readability but MySQL optimizer
-- usually reorders for best performance anyway.
--
-- Key rules:
-- 1. Always join on indexed columns (PKs and FKs) for speed.
-- 2. Filter with WHERE after joining, not inside ON
--    (exception: LEFT JOIN — filter on right table goes in ON).
-- 3. Alias all tables when joining 3+ tables.
-- 4. Be careful with OR in ON — can cause row explosion.
-- ============================================================

USE sakila;

-- Q1: Multiple conditions in ON clause
SELECT
    r.rental_id,
    r.customer_id,
    r.staff_id,
    s.first_name    AS staff_name
FROM rental r
INNER JOIN staff s
    ON  r.staff_id   = s.staff_id
    AND s.store_id   = 1            -- extra filter in ON
LIMIT 10;

-- Q2: Difference between filtering in ON vs WHERE (LEFT JOIN)
-- Filter in ON: keeps all left rows, NULLs non-matching right
SELECT
    c.customer_id,
    c.first_name,
    r.rental_id
FROM customer c
LEFT JOIN rental r
    ON  c.customer_id = r.customer_id
    AND r.rental_date >= '2005-07-01'  -- filter inside ON
LIMIT 10;

-- Filter in WHERE: removes left rows with no match (becomes INNER)
SELECT
    c.customer_id,
    c.first_name,
    r.rental_id
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_date >= '2005-07-01'   -- filter in WHERE
LIMIT 10;

-- Q3: Join order — start from the smallest/most filtered table
-- Bad order (starting from large table):
-- FROM rental -> customer -> inventory -> film

-- Better order (start from anchor):
SELECT
    c.first_name,
    c.last_name,
    f.title,
    p.amount
FROM customer c                          -- anchor: specific customer
INNER JOIN rental r    ON c.customer_id  = r.customer_id
INNER JOIN payment p   ON r.rental_id    = p.rental_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f      ON i.film_id      = f.film_id
WHERE c.customer_id = 1;

-- Q4: Non-equi join (joining on a range instead of equality)
-- Find films whose replacement cost is in a payment range
SELECT
    f.title,
    f.replacement_cost,
    p.amount
FROM film f
INNER JOIN payment p
    ON p.amount BETWEEN f.rental_rate AND f.rental_rate + 1
LIMIT 10;
