-- ============================================================
-- 31 | SELF JOIN
-- ============================================================
-- A table joined with ITSELF.
-- Must use table aliases to distinguish the two instances.
-- Useful for: hierarchical data, comparing rows in same table,
--             finding duplicates, manager-employee relationships.
--
-- Syntax:
--   SELECT a.col, b.col
--   FROM table a
--   JOIN table b ON a.col = b.col
-- ============================================================

USE sakila;

-- Q1: Find pairs of actors with the same last name
SELECT
    a1.first_name   AS actor_1_first,
    a1.last_name    AS shared_last_name,
    a2.first_name   AS actor_2_first
FROM actor a1
INNER JOIN actor a2
    ON  a1.last_name  = a2.last_name
    AND a1.actor_id   < a2.actor_id
ORDER BY a1.last_name;

-- Q2: Find customers from the same city (same address city_id)
SELECT
    c1.first_name   AS customer_1,
    c2.first_name   AS customer_2,
    a1.city_id      AS shared_city
FROM customer c1
INNER JOIN customer c2
    ON  c1.customer_id < c2.customer_id
INNER JOIN address a1 ON c1.address_id = a1.address_id
INNER JOIN address a2 ON c2.address_id = a2.address_id
WHERE a1.city_id = a2.city_id
LIMIT 10;

-- Q3: Find films with the same rental rate
SELECT
    f1.title        AS film_1,
    f2.title        AS film_2,
    f1.rental_rate  AS shared_rate
FROM film f1
INNER JOIN film f2
    ON  f1.rental_rate = f2.rental_rate
    AND f1.film_id     < f2.film_id
LIMIT 10;

-- Q4: Find films with same rating and same length
SELECT
    f1.title    AS film_1,
    f2.title    AS film_2,
    f1.rating,
    f1.length
FROM film f1
INNER JOIN film f2
    ON  f1.rating  = f2.rating
    AND f1.length  = f2.length
    AND f1.film_id < f2.film_id
ORDER BY f1.rating, f1.length
LIMIT 10;
