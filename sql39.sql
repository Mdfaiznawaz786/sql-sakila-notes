-- ============================================================
-- 39 | SUBQUERY IN FROM (DERIVED TABLE)
-- ============================================================
-- A subquery in the FROM clause is called a DERIVED TABLE.
-- It acts like a temporary table for the outer query.
-- Must always be given an alias.
--
-- Syntax:
--   SELECT ...
--   FROM (SELECT ... FROM table) AS alias
--   WHERE ...
--
-- Use when:
--   You need to filter/aggregate AFTER a first aggregation.
--   You want to reuse a computed result in SELECT and WHERE.
-- ============================================================

USE sakila;

-- Q1: Average of customer totals (avg of sums)
SELECT AVG(total_spent) AS avg_customer_spend
FROM (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
) AS customer_totals;

-- Q2: Top spending customers with their rank info
SELECT
    customer_id,
    total_spent,
    total_payments
FROM (
    SELECT
        customer_id,
        SUM(amount)  AS total_spent,
        COUNT(*)     AS total_payments
    FROM payment
    GROUP BY customer_id
) AS summary
WHERE total_spent > 150
ORDER BY total_spent DESC;

-- Q3: Category rental counts — filtered after aggregation
SELECT category, rental_count
FROM (
    SELECT
        cat.name            AS category,
        COUNT(r.rental_id)  AS rental_count
    FROM category cat
    INNER JOIN film_category fc ON cat.category_id  = fc.category_id
    INNER JOIN inventory i      ON fc.film_id       = i.film_id
    INNER JOIN rental r         ON i.inventory_id   = r.inventory_id
    GROUP BY cat.name
) AS cat_summary
WHERE rental_count > 1000
ORDER BY rental_count DESC;

-- Q4: Films rented more than the average rentals per film
SELECT title, times_rented
FROM (
    SELECT
        f.title,
        COUNT(r.rental_id) AS times_rented
    FROM film f
    INNER JOIN inventory i ON f.film_id      = i.film_id
    INNER JOIN rental r    ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title
) AS film_rentals
WHERE times_rented > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(r.rental_id) AS cnt
        FROM inventory i
        INNER JOIN rental r ON i.inventory_id = r.inventory_id
        GROUP BY i.film_id
    ) AS avg_sub
)
ORDER BY times_rented DESC
LIMIT 10;
