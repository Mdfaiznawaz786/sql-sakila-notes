-- ============================================================
-- 42 | ROW_NUMBER()
-- ============================================================
-- Assigns a unique sequential integer to each row.
-- Numbering restarts for each partition (if PARTITION BY used).
-- No ties — every row gets a unique number.
--
-- Syntax:
--   ROW_NUMBER() OVER (
--       [PARTITION BY col]
--       ORDER BY col
--   )
--
-- Use cases:
--   Pagination, picking top-N per group, deduplication.
-- ============================================================

USE sakila;

-- Q1: Number all films ordered by title
SELECT
    ROW_NUMBER() OVER (ORDER BY title) AS row_num,
    title,
    rental_rate
FROM film
LIMIT 10;

-- Q2: Number films within each rating group
SELECT
    ROW_NUMBER() OVER (PARTITION BY rating ORDER BY title) AS row_within_rating,
    rating,
    title
FROM film
LIMIT 20;

-- Q3: Pick the top 3 highest paying customers per store
SELECT *
FROM (
    SELECT
        c.store_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent,
        ROW_NUMBER() OVER (
            PARTITION BY c.store_id
            ORDER BY SUM(p.amount) DESC
        ) AS rn
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.store_id, c.customer_id, c.first_name, c.last_name
) AS ranked
WHERE rn <= 3;

-- Q4: Pagination — get page 2 (rows 11 to 20) of films by title
SELECT title, rental_rate
FROM (
    SELECT
        title,
        rental_rate,
        ROW_NUMBER() OVER (ORDER BY title) AS rn
    FROM film
) AS numbered
WHERE rn BETWEEN 11 AND 20;
