-- ============================================================
-- 20 | NUMERIC FUNCTIONS
-- ============================================================
-- ROUND(n, d)    : round to d decimal places
-- CEIL(n)        : round up to nearest integer
-- FLOOR(n)       : round down to nearest integer
-- ABS(n)         : absolute value
-- MOD(n, d)      : remainder (same as n % d)
-- POWER(n, p)    : n raised to power p
-- SQRT(n)        : square root
-- TRUNCATE(n, d) : truncate to d decimal places (no rounding)
-- RAND()         : random float between 0 and 1
-- ============================================================

USE sakila;

-- Q1: Round, ceil, and floor on rental rates
SELECT
    title,
    rental_rate,
    ROUND(rental_rate, 0)    AS rounded,
    CEIL(rental_rate)        AS ceiled,
    FLOOR(rental_rate)       AS floored
FROM film
LIMIT 10;

-- Q2: ABS, MOD, and POWER demos on film data
SELECT
    film_id,
    length,
    MOD(length, 60)          AS remaining_mins,
    POWER(rental_rate, 2)    AS rate_squared,
    SQRT(length)             AS sqrt_length
FROM film
LIMIT 10;

-- Q3: TRUNCATE vs ROUND on payment amounts
SELECT
    amount,
    ROUND(amount, 1)         AS rounded_1dp,
    TRUNCATE(amount, 1)      AS truncated_1dp
FROM payment
LIMIT 10;

-- Q4: Random sampling - get 5 random films
SELECT title, rental_rate
FROM film
ORDER BY RAND()
LIMIT 5;
