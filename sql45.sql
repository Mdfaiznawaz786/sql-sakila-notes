-- ============================================================
-- 45 | PARTITION BY
-- ============================================================
-- PARTITION BY divides rows into groups (partitions) for
-- window functions. Each partition is processed independently.
--
-- vs GROUP BY:
--   GROUP BY   : collapses rows into one row per group.
--   PARTITION BY : keeps all rows, applies function per group.
--
-- Syntax:
--   FUNCTION() OVER (PARTITION BY col ORDER BY col)
--
-- Can be used with: ROW_NUMBER, RANK, DENSE_RANK,
--   SUM, AVG, COUNT, MIN, MAX, LEAD, LAG, etc.
-- ============================================================

USE sakila;

-- Q1: Total payments per customer alongside each payment row
SELECT
    customer_id,
    payment_id,
    amount,
    SUM(amount)   OVER (PARTITION BY customer_id) AS customer_total,
    COUNT(*)      OVER (PARTITION BY customer_id) AS customer_payments,
    AVG(amount)   OVER (PARTITION BY customer_id) AS customer_avg
FROM payment
WHERE customer_id IN (1, 2)
ORDER BY customer_id, payment_date;

-- Q2: Each film's rental rate vs average for its rating group
SELECT
    title,
    rating,
    rental_rate,
    AVG(rental_rate) OVER (PARTITION BY rating)               AS avg_rate_for_rating,
    rental_rate - AVG(rental_rate) OVER (PARTITION BY rating) AS diff_from_avg
FROM film
ORDER BY rating, diff_from_avg DESC
LIMIT 20;

-- Q3: Count of films per rating shown on every row
SELECT
    title,
    rating,
    length,
    COUNT(*) OVER (PARTITION BY rating) AS films_in_rating,
    MAX(length) OVER (PARTITION BY rating) AS longest_in_rating
FROM film
ORDER BY rating, length DESC
LIMIT 20;

-- Q4: Cumulative payment total per customer (running total within partition)
SELECT
    customer_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM payment
WHERE customer_id = 1;
