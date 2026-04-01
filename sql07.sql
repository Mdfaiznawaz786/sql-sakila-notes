-- ============================================================
-- 07 | WHERE CLAUSE
-- ============================================================
-- Filters rows based on a condition
-- Only rows where condition is TRUE are returned
-- ============================================================

USE sakila;

-- Q1: Films rated PG-13
SELECT title, rating
FROM film
WHERE rating = 'PG-13';

-- Q2: Customers with ID less than 10
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id < 10;

-- Q3: Films longer than 120 minutes
SELECT title, length
FROM film
WHERE length > 120;

-- Q4: Active customers only
SELECT first_name, last_name, active
FROM customer
WHERE active = 1;
