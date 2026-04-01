-- ============================================================
-- 11 | WILDCARDS
-- ============================================================
-- % = zero or more characters
-- _ = exactly one character
-- ============================================================

USE sakila;

-- Q1: Film titles that are exactly 4 characters long
SELECT title FROM film
WHERE title LIKE '____';

-- Q2: Actors with a 5-letter first name starting with J
SELECT first_name, last_name FROM actor
WHERE first_name LIKE 'J____';

-- Q3: Films where second character is A
SELECT title FROM film
WHERE title LIKE '_A%';

-- Q4: Customers with AR as 2nd and 3rd characters in last name
SELECT first_name, last_name FROM customer
WHERE last_name LIKE '_AR%';
