-- ============================================================
-- 43 | RANK() / DENSE_RANK()
-- ============================================================
-- Both assign ranks to rows based on ORDER BY.
-- Difference is in how they handle TIES:
--
--   RANK()       : tied rows get the SAME rank.
--                  Next rank SKIPS numbers.
--                  e.g. 1, 2, 2, 4, 5
--
--   DENSE_RANK() : tied rows get the SAME rank.
--                  Next rank does NOT skip.
--                  e.g. 1, 2, 2, 3, 4
--
--   ROW_NUMBER() : no ties, always unique.
--                  e.g. 1, 2, 3, 4, 5
-- ============================================================

USE sakila;

-- Q1: Rank films by rental rate (shows tie behaviour)
SELECT
    title,
    rental_rate,
    RANK()       OVER (ORDER BY rental_rate DESC) AS rnk,
    DENSE_RANK() OVER (ORDER BY rental_rate DESC) AS dense_rnk,
    ROW_NUMBER() OVER (ORDER BY rental_rate DESC) AS row_num
FROM film
LIMIT 15;

-- Q2: Rank customers by total spend
SELECT
    first_name,
    last_name,
    total_spent,
    RANK()       OVER (ORDER BY total_spent DESC) AS spend_rank,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spend_dense_rank
FROM (
    SELECT
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS totals
LIMIT 15;

-- Q3: Rank films by length within each rating
SELECT
    rating,
    title,
    length,
    RANK()       OVER (PARTITION BY rating ORDER BY length DESC) AS len_rank,
    DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS len_dense_rank
FROM film
ORDER BY rating, len_rank
LIMIT 20;

-- Q4: Get only the top-ranked film per rating (using DENSE_RANK)
SELECT rating, title, length
FROM (
    SELECT
        rating,
        title,
        length,
        DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS dr
    FROM film
) AS ranked
WHERE dr = 1;
