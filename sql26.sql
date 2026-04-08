-- ============================================================
-- 26 | INNER JOIN
-- ============================================================
-- Returns only rows where there is a MATCH in BOTH tables.
-- Rows with no match on either side are excluded.
-- Most common type of join.
--
-- Syntax:
--   SELECT cols
--   FROM table1
--   INNER JOIN table2 ON table1.col = table2.col
--
-- INNER keyword is optional — JOIN alone = INNER JOIN
-- ============================================================

USE sakila;

-- Q1: Get film titles with their language names
SELECT
    f.title,
    l.name AS language
FROM film f
INNER JOIN language l ON f.language_id = l.language_id
LIMIT 10;

-- Q2: Get customer full name with their rental info
SELECT
    c.first_name,
    c.last_name,
    r.rental_date,
    r.return_date
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
LIMIT 10;

-- Q3: Film titles with their category names
SELECT
    f.title,
    cat.name AS category
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category cat ON fc.category_id = cat.category_id
LIMIT 10;

-- Q4: Staff names with their store address
SELECT
    s.first_name,
    s.last_name,
    a.address,
    ci.city
FROM staff s
INNER JOIN store st ON s.store_id = st.store_id
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id;
