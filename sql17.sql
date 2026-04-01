-- ============================================================
-- 17 | HAVING
-- ============================================================
-- Filters groups after GROUP BY
-- WHERE  filters rows   (before grouping)
-- HAVING filters groups (after grouping)
-- ============================================================

USE sakila;

-- Q1: Ratings with more than 200 films
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;

-- Q2: Customers who spent more than $150
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150
ORDER BY total_spent DESC;

-- Q3: Film lengths where average rental rate exceeds 3.00
SELECT length, AVG(rental_rate) AS avg_rate
FROM film
GROUP BY length
HAVING AVG(rental_rate) > 3.00
ORDER BY avg_rate DESC
LIMIT 10;

-- Q4: Actors appearing in more than 30 films
SELECT actor_id, COUNT(*) AS film_count
FROM film_actor
GROUP BY actor_id
HAVING COUNT(*) > 30
ORDER BY film_count DESC;
