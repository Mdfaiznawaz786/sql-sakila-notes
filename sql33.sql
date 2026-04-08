-- ============================================================
-- 33 | JOINING AGGREGATED DATA
-- ============================================================
-- You can JOIN a subquery that contains aggregated results.
-- This is useful when you need to combine summary data
-- with detail data in the same query.
--
-- Pattern:
--   SELECT ...
--   FROM main_table
--   JOIN (SELECT col, AGG() FROM t GROUP BY col) AS agg
--   ON main_table.col = agg.col
-- ============================================================

USE sakila;

-- Q1: Each customer with their total spend joined back to customer info
SELECT
    c.first_name,
    c.last_name,
    c.email,
    agg.total_spent,
    agg.total_payments
FROM customer c
INNER JOIN (
    SELECT customer_id,
           SUM(amount)  AS total_spent,
           COUNT(*)     AS total_payments
    FROM payment
    GROUP BY customer_id
) AS agg ON c.customer_id = agg.customer_id
ORDER BY agg.total_spent DESC
LIMIT 10;

-- Q2: Each film with how many times it was rented
SELECT
    f.title,
    f.rating,
    f.rental_rate,
    agg.times_rented
FROM film f
INNER JOIN (
    SELECT i.film_id, COUNT(r.rental_id) AS times_rented
    FROM inventory i
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
) AS agg ON f.film_id = agg.film_id
ORDER BY agg.times_rented DESC
LIMIT 10;

-- Q3: Category with average payment per rental
SELECT
    cat.name            AS category,
    agg.avg_payment,
    agg.total_rentals
FROM category cat
INNER JOIN (
    SELECT
        fc.category_id,
        AVG(p.amount)   AS avg_payment,
        COUNT(r.rental_id) AS total_rentals
    FROM film_category fc
    INNER JOIN inventory i  ON fc.film_id      = i.film_id
    INNER JOIN rental r     ON i.inventory_id  = r.inventory_id
    INNER JOIN payment p    ON r.rental_id     = p.rental_id
    GROUP BY fc.category_id
) AS agg ON cat.category_id = agg.category_id
ORDER BY agg.avg_payment DESC;

-- Q4: Customers who spent MORE than the average customer spend
SELECT
    c.first_name,
    c.last_name,
    agg.total_spent
FROM customer c
INNER JOIN (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
) AS agg ON c.customer_id = agg.customer_id
WHERE agg.total_spent > (
    SELECT AVG(total) FROM (
        SELECT SUM(amount) AS total
        FROM payment
        GROUP BY customer_id
    ) AS avg_sub
)
ORDER BY agg.total_spent DESC;
