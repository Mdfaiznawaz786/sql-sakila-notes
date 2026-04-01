-- ============================================================
-- 10 | PATTERN MATCHING WITH LIKE
-- ============================================================
-- % matches zero or more characters
-- _ matches exactly one character
-- NOT LIKE = does not match pattern
-- ============================================================

USE sakila;

-- Q1: Films starting with A
SELECT title FROM film
WHERE title LIKE 'A%';

-- Q2: Actors whose last name ends with SON
SELECT first_name, last_name FROM actor
WHERE last_name LIKE '%SON';

-- Q3: Films containing LOVE in the title
SELECT title FROM film
WHERE title LIKE '%LOVE%';

-- Q4: Emails from sakilacustomer.org
SELECT first_name, last_name, email FROM customer
WHERE email LIKE '%sakilacustomer.org';
