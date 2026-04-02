-- ============================================================
-- 21 | DATE AND TIME FUNCTIONS
-- ============================================================
-- NOW()                    : current date and time
-- CURDATE()                : current date only
-- CURTIME()                : current time only
-- YEAR(date)               : extract year
-- MONTH(date)              : extract month number
-- DAY(date)                : extract day number
-- MONTHNAME(date)          : extract month name
-- DAYNAME(date)            : extract day name
-- DATEDIFF(d1, d2)         : difference in days
-- DATE_ADD(date, INTERVAL) : add time to a date
-- DATE_SUB(date, INTERVAL) : subtract time from a date
-- DATE_FORMAT(date, fmt)   : format a date as string
-- TIMESTAMPDIFF(unit,d1,d2): difference in given unit
-- ============================================================

USE sakila;

-- Q1: Extract year, month, day and day name from rental date
SELECT
    rental_id,
    rental_date,
    YEAR(rental_date)      AS rental_year,
    MONTHNAME(rental_date) AS rental_month,
    DAY(rental_date)       AS rental_day,
    DAYNAME(rental_date)   AS day_name
FROM rental
LIMIT 10;

-- Q2: How many days was each rental (return_date - rental_date)
SELECT
    rental_id,
    rental_date,
    return_date,
    DATEDIFF(return_date, rental_date) AS days_rented
FROM rental
WHERE return_date IS NOT NULL
LIMIT 10;

-- Q3: Format payment date nicely + add 30 days to it
SELECT
    payment_id,
    payment_date,
    DATE_FORMAT(payment_date, '%D %M %Y')       AS formatted_date,
    DATE_ADD(payment_date, INTERVAL 30 DAY)     AS due_date
FROM payment
LIMIT 10;

-- Q4: Rentals duration in hours using TIMESTAMPDIFF
SELECT
    rental_id,
    rental_date,
    return_date,
    TIMESTAMPDIFF(HOUR, rental_date, return_date) AS hours_rented
FROM rental
WHERE return_date IS NOT NULL
ORDER BY hours_rented DESC
LIMIT 10;
