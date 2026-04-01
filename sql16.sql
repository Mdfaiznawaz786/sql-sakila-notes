-- ============================================================
-- 16 | GROUP BY
-- ============================================================
-- Groups rows so aggregate functions apply per group
-- Every non-aggregated SELECT column must be in GROUP BY
-- Use HAVING (not WHERE) to filter groups
-- ============================================================

USE sakila;

-- Q1: Film count per rating
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

-- Q2: Total revenue per customer (top 10)
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Q3: Average film length per rating
SELECT rating, AVG(length) AS avg_length
FROM film
GROUP BY rating;

-- Q4: Rentals processed per staff member
SELECT staff_id, COUNT(*) AS rentals_processed
FROM rental
GROUP BY staff_id;
