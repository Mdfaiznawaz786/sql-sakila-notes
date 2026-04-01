-- ============================================================
-- 08 | ORDER BY
-- ============================================================
-- Sorts result set ASC (default) or DESC
-- Can sort by multiple columns
-- ============================================================

USE sakila;

-- Q1: Films sorted alphabetically
SELECT title FROM film ORDER BY title ASC;

-- Q2: Films by rental rate, highest first
SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC;

-- Q3: Customers sorted by last name then first name
SELECT first_name, last_name
FROM customer
ORDER BY last_name ASC, first_name ASC;

-- Q4: Top 10 longest films
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;
