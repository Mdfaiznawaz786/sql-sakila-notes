-- ============================================================
-- 22 | CONVERSION / CAST / CONVERT
-- ============================================================
-- CAST(value AS type)        : standard SQL type conversion
-- CONVERT(value, type)       : MySQL specific conversion
-- CONVERT(value USING charset): convert character set
--
-- Common target types:
--   CHAR / VARCHAR   : string
--   UNSIGNED         : positive integer
--   SIGNED           : integer (positive or negative)
--   DECIMAL(p, s)    : fixed point number
--   DATE             : date only
--   DATETIME         : date and time
--   TIME             : time only
--   JSON             : JSON format
-- ============================================================

USE sakila;

-- Q1: CAST rental_rate (decimal) to different types
SELECT
    title,
    rental_rate,
    CAST(rental_rate AS UNSIGNED)      AS as_integer,
    CAST(rental_rate AS CHAR)          AS as_string,
    CAST(rental_rate AS DECIMAL(10,4)) AS as_decimal
FROM film
LIMIT 10;

-- Q2: CONVERT payment amount to integer and char
SELECT
    payment_id,
    amount,
    CONVERT(amount, UNSIGNED)          AS as_integer,
    CONVERT(amount, CHAR)              AS as_string
FROM payment
LIMIT 10;

-- Q3: Cast string date to DATE type
SELECT
    CAST('2006-01-15' AS DATE)         AS casted_date,
    CAST('2006-01-15 10:30:00' AS DATETIME) AS casted_datetime,
    CAST('10:30:00' AS TIME)           AS casted_time;

-- Q4: Combine CAST with calculation - total as formatted string
SELECT
    customer_id,
    SUM(amount)                                          AS total_spent,
    CONCAT('$', CAST(SUM(amount) AS DECIMAL(10,2)))     AS formatted_total
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
