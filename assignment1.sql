-- ============================================================
-- ASSIGNMENT 1 | SQL PRACTICE — SAKILA DATABASE
-- ============================================================
-- Topics Covered : SELECT, WHERE, AND/OR, LIKE, IS NULL,
--                  DISTINCT, GROUP BY, HAVING, ORDER BY,
--                  LIMIT, COUNT, AVG, JOIN, Subqueries
-- Database       : Sakila
-- Tool           : MySQL Workbench
-- ============================================================

USE sakila;

-- ============================================================
-- Q1. Get all customers whose first name starts with 'J'
--     and who are active.
-- ============================================================
-- Concepts: WHERE, LIKE, AND

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    active
FROM customer
WHERE first_name LIKE 'J%'
  AND active = 1;

-- ============================================================
-- Q2. Find all films where the title contains the word 'ACTION'
--     or the description contains 'WAR'.
-- ============================================================
-- Concepts: WHERE, LIKE, OR

SELECT
    film_id,
    title,
    description
FROM film
WHERE title LIKE '%ACTION%'
   OR description LIKE '%WAR%';

-- ============================================================
-- Q3. List all customers whose last name is not 'SMITH'
--     and whose first name ends with 'a'.
-- ============================================================
-- Concepts: WHERE, LIKE, AND, != operator

SELECT
    customer_id,
    first_name,
    last_name
FROM customer
WHERE last_name != 'SMITH'
  AND first_name LIKE '%a';

-- ============================================================
-- Q4. Get all films where the rental rate is greater than 3.0
--     and the replacement cost is not null.
-- ============================================================
-- Concepts: WHERE, IS NOT NULL, AND, comparison operators

SELECT
    film_id,
    title,
    rental_rate,
    replacement_cost
FROM film
WHERE rental_rate > 3.0
  AND replacement_cost IS NOT NULL;

-- ============================================================
-- Q5. Count how many customers exist in each store
--     who have active status = 1.
-- ============================================================
-- Concepts: WHERE, GROUP BY, COUNT

SELECT
    store_id,
    COUNT(*) AS active_customer_count
FROM customer
WHERE active = 1
GROUP BY store_id;

-- ============================================================
-- Q6. Show distinct film ratings available in the film table.
-- ============================================================
-- Concepts: SELECT DISTINCT

SELECT DISTINCT rating
FROM film
ORDER BY rating;

-- ============================================================
-- Q7. Find the number of films for each rental duration
--     where the average length is more than 100 minutes.
-- ============================================================
-- Concepts: GROUP BY, HAVING, AVG, COUNT

SELECT
    rental_duration,
    COUNT(*)        AS film_count,
    AVG(length)     AS avg_length
FROM film
GROUP BY rental_duration
HAVING AVG(length) > 100
ORDER BY rental_duration;

-- ============================================================
-- Q8. List payment dates and total amount paid per date,
--     but only include days where more than 100 payments
--     were made.
-- ============================================================
-- Concepts: DATE(), GROUP BY, HAVING, SUM, COUNT

SELECT
    DATE(payment_date)  AS payment_day,
    COUNT(*)            AS total_payments,
    SUM(amount)         AS total_amount
FROM payment
GROUP BY DATE(payment_date)
HAVING COUNT(*) > 100
ORDER BY payment_day;

-- ============================================================
-- Q9. Find customers whose email address is null
--     or ends with '.org'.
-- ============================================================
-- Concepts: IS NULL, LIKE, OR

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE email IS NULL
   OR email LIKE '%.org';

-- ============================================================
-- Q10. List all films with rating 'PG' or 'G',
--      ordered by rental rate descending.
-- ============================================================
-- Concepts: WHERE, IN, ORDER BY DESC

SELECT
    film_id,
    title,
    rating,
    rental_rate
FROM film
WHERE rating IN ('PG', 'G')
ORDER BY rental_rate DESC;

-- ============================================================
-- Q11. Count how many films exist for each length where the
--      film title starts with 'T' and the count is more than 5.
-- ============================================================
-- Concepts: WHERE, LIKE, GROUP BY, HAVING, COUNT

SELECT
    length,
    COUNT(*) AS film_count
FROM film
WHERE title LIKE 'T%'
GROUP BY length
HAVING COUNT(*) > 5
ORDER BY length;

-- ============================================================
-- Q12. List all actors who have appeared in more than 10 films.
-- ============================================================
-- Concepts: JOIN, GROUP BY, HAVING, COUNT

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 10
ORDER BY film_count DESC;

-- ============================================================
-- Q13. Find the top 5 films with the highest rental rates
--      and longest lengths combined,
--      ordering by rental rate first and length second.
-- ============================================================
-- Concepts: ORDER BY multiple columns, LIMIT

SELECT
    film_id,
    title,
    rental_rate,
    length
FROM film
ORDER BY rental_rate DESC, length DESC
LIMIT 5;

-- ============================================================
-- Q14. Show all customers along with the total number of
--      rentals they have made, ordered from most to least.
-- ============================================================
-- Concepts: LEFT JOIN, GROUP BY, COUNT, ORDER BY

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

-- ============================================================
-- Q15. List the film titles that have never been rented.
-- ============================================================
-- Concepts: LEFT JOIN, IS NULL (anti-join pattern)

SELECT
    f.film_id,
    f.title
FROM film f
LEFT JOIN inventory i  ON f.film_id      = i.film_id
LEFT JOIN rental r     ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL
ORDER BY f.title;

-- ============================================================
-- END OF ASSIGNMENT 1
-- ============================================================
