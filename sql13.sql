-- ============================================================
-- 13 | BETWEEN OPERATOR
-- ============================================================
-- Tests if value is within an inclusive range
-- Same as col >= low AND col <= high
-- Works with numbers, dates, and strings
-- ============================================================

USE sakila;

-- Q1: Films with rental rate between 2.00 and 4.00
SELECT title, rental_rate FROM film
WHERE rental_rate BETWEEN 2.00 AND 4.00;

-- Q2: Films between 90 and 120 minutes long
SELECT title, length FROM film
WHERE length BETWEEN 90 AND 120;

-- Q3: Payments made in January 2006
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date BETWEEN '2006-01-01' AND '2006-01-31';

-- Q4: Actors with ID between 10 and 20
SELECT actor_id, first_name, last_name FROM actor
WHERE actor_id BETWEEN 10 AND 20;
