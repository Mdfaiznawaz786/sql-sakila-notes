-- ============================================================
-- 03 | NULL VALUES
-- ============================================================
-- NULL = missing or unknown data
-- Never use = NULL, always use IS NULL or IS NOT NULL
-- Any arithmetic with NULL returns NULL
-- ============================================================

USE sakila;

-- Q1: Customers with no email address
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE email IS NULL;

-- Q2: Staff with no picture uploaded
SELECT staff_id, first_name, last_name
FROM staff
WHERE picture IS NULL;

-- Q3: Films with no original language set
SELECT title, language_id, original_language_id
FROM film
WHERE original_language_id IS NULL;

-- Q4: Staff who have a picture (IS NOT NULL)
SELECT staff_id, first_name, last_name
FROM staff
WHERE picture IS NOT NULL;
