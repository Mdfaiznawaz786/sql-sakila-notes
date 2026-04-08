-- ============================================================
-- 47 | COMMON TABLE EXPRESSIONS (CTE)
-- ============================================================
-- A CTE is a named temporary result set defined with WITH.
-- Lives only for the duration of the query.
-- Makes complex queries more readable than subqueries.
--
-- Syntax:
--   WITH cte_name AS (
--       SELECT ...
--   )
--   SELECT * FROM cte_name;
--
-- Multiple CTEs:
--   WITH cte1 AS (...), cte2 AS (...)
--   SELECT * FROM cte1 JOIN cte2 ...
--
-- Recursive CTEs also exist (for hierarchical data).
-- ============================================================

USE sakila;

-- Q1: Simple CTE — top spending customers
WITH customer_totals AS (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
)
SELECT
    c.first_name,
    c.last_name,
    ct.total_spent
FROM customer c
INNER JOIN customer_totals ct ON c.customer_id = ct.customer_id
ORDER BY ct.total_spent DESC
LIMIT 10;

-- Q2: Multiple CTEs — rental stats + payment stats joined
WITH rental_counts AS (
    SELECT customer_id, COUNT(*) AS total_rentals
    FROM rental
    GROUP BY customer_id
),
payment_totals AS (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
)
SELECT
    c.first_name,
    c.last_name,
    rc.total_rentals,
    pt.total_spent
FROM customer c
INNER JOIN rental_counts  rc ON c.customer_id = rc.customer_id
INNER JOIN payment_totals pt ON c.customer_id = pt.customer_id
ORDER BY pt.total_spent DESC
LIMIT 10;

-- Q3: CTE to find above-average rental rate films per rating
WITH avg_by_rating AS (
    SELECT rating, AVG(rental_rate) AS avg_rate
    FROM film
    GROUP BY rating
)
SELECT
    f.title,
    f.rating,
    f.rental_rate,
    a.avg_rate
FROM film f
INNER JOIN avg_by_rating a ON f.rating = a.rating
WHERE f.rental_rate > a.avg_rate
ORDER BY f.rating, f.rental_rate DESC
LIMIT 15;

-- Q4: Recursive CTE — generate a sequence of numbers 1 to 10
WITH RECURSIVE num_series AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM num_series WHERE n < 10
)
SELECT n FROM num_series;
