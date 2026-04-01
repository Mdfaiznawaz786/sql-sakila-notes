-- ============================================================
-- 09 | LIMIT
-- ============================================================
-- Restricts the number of rows returned
-- LIMIT n OFFSET m skips m rows then returns n
-- ============================================================

USE sakila;

-- Q1: First 10 films
SELECT title FROM film LIMIT 10;

-- Q2: Top 5 highest rental rate films
SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC
LIMIT 5;

-- Q3: Films 11 to 20 using OFFSET
SELECT title FROM film
LIMIT 10 OFFSET 10;

-- Q4: 3 most recently added customers
SELECT customer_id, first_name, last_name, create_date
FROM customer
ORDER BY create_date DESC
LIMIT 3;
