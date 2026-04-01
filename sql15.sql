-- ============================================================
-- 15 | AGGREGATE FUNCTIONS
-- ============================================================
-- COUNT(*) : number of rows
-- SUM(col) : total
-- AVG(col) : average
-- MIN(col) : smallest value
-- MAX(col) : largest value
-- All aggregates except COUNT(*) ignore NULLs
-- ============================================================

USE sakila;

-- Q1: Total number of films
SELECT COUNT(*) AS total_films FROM film;

-- Q2: Average rental rate and total replacement cost
SELECT
    AVG(rental_rate)      AS avg_rental_rate,
    SUM(replacement_cost) AS total_replacement_cost
FROM film;

-- Q3: Shortest and longest films
SELECT
    MIN(length) AS shortest_film,
    MAX(length) AS longest_film
FROM film;

-- Q4: Payment totals
SELECT
    COUNT(*)    AS total_payments,
    SUM(amount) AS total_revenue,
    AVG(amount) AS avg_payment
FROM payment;
