-- ============================================================
-- 24 | CONDITIONAL LOGIC — CASE / IF / IIF
-- ============================================================
-- CASE (standard SQL)
--   Simple:   CASE col WHEN val THEN result END
--   Searched: CASE WHEN condition THEN result END
--   Most flexible. Works everywhere. Preferred.
--
-- IF(condition, true_val, false_val)
--   MySQL specific shorthand. 3 arguments only.
--   Good for simple true/false logic.
--
-- IIF(condition, true_val, false_val)
--   NOT available in MySQL.
--   Used in SQL Server / MS Access.
--   In MySQL use IF() instead.
--
-- Nesting:
--   IF can be nested: IF(c1, v1, IF(c2, v2, v3))
--   CASE is cleaner for multi-branch logic.
-- ============================================================

USE sakila;

-- Q1: CASE - categorize films by rental rate tier
SELECT
    title,
    rental_rate,
    CASE
        WHEN rental_rate < 2.00 THEN 'Budget'
        WHEN rental_rate < 4.00 THEN 'Standard'
        ELSE 'Premium'
    END AS price_tier
FROM film
LIMIT 10;

-- Q2: IF - simple active/inactive label for customers
SELECT
    first_name,
    last_name,
    active,
    IF(active = 1, 'Active', 'Inactive') AS status
FROM customer
LIMIT 10;

-- Q3: Nested IF - classify film length into 3 categories
SELECT
    title,
    length,
    IF(length < 60, 'Short',
        IF(length < 120, 'Medium', 'Long')
    ) AS length_category
FROM film
LIMIT 10;

-- Q4: CASE inside aggregate - count films per price tier
SELECT
    CASE
        WHEN rental_rate < 2.00 THEN 'Budget'
        WHEN rental_rate < 4.00 THEN 'Standard'
        ELSE 'Premium'
    END                  AS price_tier,
    COUNT(*)             AS total_films,
    AVG(length)          AS avg_length
FROM film
GROUP BY price_tier
ORDER BY total_films DESC;
