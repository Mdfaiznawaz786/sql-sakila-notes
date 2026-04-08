-- ============================================================
-- 32 | MULTI-TABLE JOINS
-- ============================================================
-- You can chain multiple JOINs in a single query.
-- Each JOIN adds another table to the result.
-- Always alias tables for readability.
-- Join order matters for readability but MySQL optimizer
-- will determine the actual execution order.
--
-- Tip: Follow the relationship chain logically.
--      customer -> rental -> inventory -> film -> category
-- ============================================================

USE sakila;

-- Q1: Customer + rental + film title (3 tables)
SELECT
    c.first_name,
    c.last_name,
    f.title         AS rented_film,
    r.rental_date
FROM customer c
INNER JOIN rental r      ON c.customer_id  = r.customer_id
INNER JOIN inventory i   ON r.inventory_id = i.inventory_id
INNER JOIN film f        ON i.film_id      = f.film_id
LIMIT 10;

-- Q2: Full rental chain: customer + film + category + payment (5 tables)
SELECT
    c.first_name,
    c.last_name,
    f.title,
    cat.name        AS category,
    p.amount
FROM customer c
INNER JOIN rental r      ON c.customer_id  = r.customer_id
INNER JOIN inventory i   ON r.inventory_id = i.inventory_id
INNER JOIN film f        ON i.film_id      = f.film_id
INNER JOIN film_category fc ON f.film_id   = fc.film_id
INNER JOIN category cat  ON fc.category_id = cat.category_id
INNER JOIN payment p     ON r.rental_id    = p.rental_id
LIMIT 10;

-- Q3: Actor + film + category (actor is in what genres?)
SELECT
    a.first_name,
    a.last_name,
    f.title,
    cat.name        AS genre
FROM actor a
INNER JOIN film_actor fa ON a.actor_id    = fa.actor_id
INNER JOIN film f        ON fa.film_id    = f.film_id
INNER JOIN film_category fc ON f.film_id  = fc.film_id
INNER JOIN category cat  ON fc.category_id = cat.category_id
WHERE a.actor_id = 1;

-- Q4: Customer location chain: customer + address + city + country
SELECT
    c.first_name,
    c.last_name,
    a.address,
    ci.city,
    co.country
FROM customer c
INNER JOIN address a  ON c.address_id  = a.address_id
INNER JOIN city ci    ON a.city_id     = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
LIMIT 10;
