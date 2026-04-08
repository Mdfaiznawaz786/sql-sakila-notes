-- ============================================================
-- 44 | LEAD() / LAG()
-- ============================================================
-- Access values from OTHER rows relative to the current row.
--
--   LAG(col, n, default)  : value from n rows BEFORE current
--   LEAD(col, n, default) : value from n rows AFTER current
--
-- Parameters:
--   col     : column to read from
--   n       : how many rows to look back/ahead (default 1)
--   default : value to return if no row exists (default NULL)
--
-- Use cases:
--   Month-over-month comparisons, previous/next event,
--   time between events, trend detection.
-- ============================================================

USE sakila;

-- Q1: For each payment, show the previous payment amount (LAG)
SELECT
    payment_id,
    customer_id,
    amount,
    payment_date,
    LAG(amount)  OVER (PARTITION BY customer_id ORDER BY payment_date) AS prev_payment,
    LEAD(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS next_payment
FROM payment
WHERE customer_id = 1;

-- Q2: Difference between current and previous payment
SELECT
    payment_id,
    customer_id,
    amount,
    LAG(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS prev_amount,
    amount - LAG(amount) OVER (
        PARTITION BY customer_id ORDER BY payment_date
    ) AS change_from_prev
FROM payment
WHERE customer_id IN (1, 2)
ORDER BY customer_id, payment_date;

-- Q3: Days between consecutive rentals per customer
SELECT
    customer_id,
    rental_date,
    LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS prev_rental,
    DATEDIFF(
        rental_date,
        LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date)
    ) AS days_since_last_rental
FROM rental
WHERE customer_id = 1;

-- Q4: Show the next film title alphabetically (LEAD)
SELECT
    title,
    rental_rate,
    LEAD(title, 1, 'END OF LIST') OVER (ORDER BY title) AS next_film
FROM film
LIMIT 10;
