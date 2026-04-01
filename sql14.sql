-- ============================================================
-- 14 | IS NULL / IS NOT NULL
-- ============================================================
-- Used to check for NULL values
-- Never use = NULL, always use IS NULL
-- ============================================================

USE sakila;

-- Q1: Films with no original language set
SELECT title, language_id, original_language_id FROM film
WHERE original_language_id IS NULL;

-- Q2: Films that have an original language
SELECT title, original_language_id FROM film
WHERE original_language_id IS NOT NULL;

-- Q3: Staff with no picture
SELECT staff_id, first_name, last_name FROM staff
WHERE picture IS NULL;

-- Q4: Rentals not yet returned
SELECT rental_id, customer_id, rental_date, return_date FROM rental
WHERE return_date IS NULL
LIMIT 10;
