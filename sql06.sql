-- ============================================================
-- 06 | SELECT DISTINCT
-- ============================================================
-- Removes duplicate values from the result set
-- Applied per combination of selected columns
-- ============================================================

USE sakila;

-- Q1: All unique film ratings
SELECT DISTINCT rating FROM film;

-- Q2: Unique rental durations
SELECT DISTINCT rental_duration FROM film;

-- Q3: Unique rating + rental_duration combinations
SELECT DISTINCT rating, rental_duration
FROM film
ORDER BY rating;

-- Q4: Distinct country_ids from city table
SELECT DISTINCT country_id FROM city;
