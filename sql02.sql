-- ============================================================
-- 02 | OPERATORS IN SQL
-- ============================================================
-- Arithmetic : + - * / %
-- Comparison : = != <> > < >= <=
-- Logical    : AND OR NOT
-- ============================================================

USE sakila;

-- Q1: Films with rental rate greater than 2.99
SELECT title, rental_rate
FROM film
WHERE rental_rate > 2.99;

-- Q2: Films where rental duration is NOT 5 days
SELECT title, rental_duration
FROM film
WHERE rental_duration != 5;

-- Q3: Revenue potential (rental_rate * rental_duration)
SELECT title, rental_rate * rental_duration AS revenue_potential
FROM film
LIMIT 10;

-- Q4: PG or G films longer than 90 minutes
SELECT title, rating, length
FROM film
WHERE (rating = 'PG' OR rating = 'G') AND length > 90;
