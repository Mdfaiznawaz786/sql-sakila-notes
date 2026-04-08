-- ============================================================
-- 25 | TEMPORARY TABLES
-- ============================================================
-- Temporary tables exist only for the current session.
-- Automatically dropped when session ends.
-- Created with CREATE TEMPORARY TABLE
-- Useful for storing intermediate results
-- Cannot be shared across sessions
-- Can be manually dropped with DROP TEMPORARY TABLE
-- ============================================================

USE sakila;

-- Q1: Create a temp table of active customers
CREATE TEMPORARY TABLE temp_active_customers AS
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE active = 1;

SELECT * FROM temp_active_customers LIMIT 10;

-- Q2: Create a temp table of high value payments (amount > 5)
CREATE TEMPORARY TABLE temp_high_payments AS
SELECT payment_id, customer_id, amount, payment_date
FROM payment
WHERE amount > 5.00;

SELECT COUNT(*) AS high_value_count FROM temp_high_payments;

-- Q3: Create temp table with aggregated data per customer
CREATE TEMPORARY TABLE temp_customer_totals AS
SELECT
    customer_id,
    COUNT(*)        AS total_rentals,
    SUM(amount)     AS total_spent
FROM payment
GROUP BY customer_id;

SELECT * FROM temp_customer_totals
ORDER BY total_spent DESC
LIMIT 10;

-- Q4: Drop temporary tables when done
DROP TEMPORARY TABLE IF EXISTS temp_active_customers;
DROP TEMPORARY TABLE IF EXISTS temp_high_payments;
DROP TEMPORARY TABLE IF EXISTS temp_customer_totals;
