-- ============================================================
-- 12 | IN OPERATOR
-- ============================================================
-- Checks if value matches any value in a list
-- Cleaner alternative to multiple OR conditions
-- NOT IN excludes listed values
-- ============================================================

USE sakila;

-- Q1: Films rated G, PG, or PG-13
SELECT title, rating FROM film
WHERE rating IN ('G', 'PG', 'PG-13');

-- Q2: Specific actors by ID
SELECT first_name, last_name FROM actor
WHERE actor_id IN (1, 5, 10, 15, 20);

-- Q3: Films with rental duration of 3, 5, or 7 days
SELECT title, rental_duration FROM film
WHERE rental_duration IN (3, 5, 7);

-- Q4: Customers NOT from store 1
SELECT customer_id, first_name, last_name, store_id FROM customer
WHERE store_id NOT IN (1);
