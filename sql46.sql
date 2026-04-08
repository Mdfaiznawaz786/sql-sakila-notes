-- ============================================================
-- 46 | RUNNING TOTALS WITH SUM OVER
-- ============================================================
-- A running total accumulates values row by row.
-- Uses SUM() as a window function with ORDER BY.
--
-- Frame clause controls which rows are included:
--   ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--     -> from first row up to current (standard running total)
--   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
--     -> rolling window of last 3 rows
--   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
--     -> all rows (same as total, no running)
--
-- Also works with: AVG (rolling average), COUNT (running count)
-- ============================================================

USE sakila;

-- Q1: Running total of payments for customer 1
SELECT
    payment_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        ORDER BY payment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM payment
WHERE customer_id = 1;

-- Q2: Running count of rentals over time (all customers)
SELECT
    DATE(rental_date)   AS rental_day,
    COUNT(*)            AS rentals_that_day,
    SUM(COUNT(*)) OVER (
        ORDER BY DATE(rental_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_rentals
FROM rental
GROUP BY DATE(rental_date)
ORDER BY rental_day
LIMIT 20;

-- Q3: Rolling 3-payment average per customer
SELECT
    customer_id,
    payment_id,
    payment_date,
    amount,
    AVG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_avg
FROM payment
WHERE customer_id = 1;

-- Q4: Cumulative revenue by payment date across all customers
SELECT
    DATE(payment_date)  AS pay_day,
    SUM(amount)         AS daily_revenue,
    SUM(SUM(amount)) OVER (
        ORDER BY DATE(payment_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM payment
GROUP BY DATE(payment_date)
ORDER BY pay_day
LIMIT 20;
