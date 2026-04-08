-- ============================================================
-- ASSIGNMENT 2 | JOINS PRACTICE — SAKILA DATABASE
-- ============================================================
-- Topics Covered : INNER JOIN, LEFT JOIN, RIGHT JOIN,
--                  FULL OUTER JOIN (simulated), UNION,
--                  GROUP BY, HAVING, COUNT
-- Database       : Sakila
-- Tool           : MySQL Workbench
-- ============================================================

USE sakila;

-- ============================================================
-- Q1. List all customers along with the films they have rented.
-- ============================================================
-- Concepts : INNER JOIN (customer -> rental -> inventory -> film)
-- Only customers who have rented at least one film appear.
-- Each row = one rental transaction.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    f.title          AS film_title,
    r.rental_date
FROM customer c
INNER JOIN rental r      ON c.customer_id  = r.customer_id
INNER JOIN inventory i   ON r.inventory_id = i.inventory_id
INNER JOIN film f        ON i.film_id      = f.film_id
ORDER BY c.last_name, c.first_name, r.rental_date
LIMIT 20;

-- ============================================================
-- Q2. List all customers and show their rental count,
--     including those who haven't rented any films.
-- ============================================================
-- Concepts : LEFT JOIN, GROUP BY, COUNT
-- LEFT JOIN ensures customers with 0 rentals are included.
-- COUNT(r.rental_id) returns 0 for customers with no rentals
-- (unlike COUNT(*) which would return 1).

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
-- Q3. Show all films along with their category.
--     Include films that don't have a category assigned.
-- ============================================================
-- Concepts : LEFT JOIN (film -> film_category -> category)
-- LEFT JOIN keeps all films even if no category row exists
-- in film_category. Those films show NULL for category.

SELECT
    f.film_id,
    f.title,
    f.rating,
    c.name           AS category
FROM film f
LEFT JOIN film_category fc ON f.film_id      = fc.film_id
LEFT JOIN category c       ON fc.category_id = c.category_id
ORDER BY f.title;

-- ============================================================
-- Q4. Show all customers and staff emails from both tables
--     using a FULL OUTER JOIN simulation
--     (LEFT JOIN + RIGHT JOIN + UNION).
-- ============================================================
-- Concepts : LEFT JOIN, RIGHT JOIN, UNION
-- MySQL doesn't support FULL OUTER JOIN natively.
-- Workaround: LEFT JOIN + UNION + RIGHT JOIN.
-- UNION removes duplicates. UNION ALL keeps them.

-- All customers (left side)
SELECT
    c.customer_id   AS id,
    'customer'      AS source,
    c.first_name,
    c.last_name,
    c.email
FROM customer c
LEFT JOIN staff s ON c.email = s.email

UNION

-- All staff (right side)
SELECT
    s.staff_id      AS id,
    'staff'         AS source,
    s.first_name,
    s.last_name,
    s.email
FROM customer c
RIGHT JOIN staff s ON c.email = s.email

ORDER BY source, last_name;

-- ============================================================
-- Q5. Find all actors who acted in the film "ACADEMY DINOSAUR".
-- ============================================================
-- Concepts : INNER JOIN (film -> film_actor -> actor), WHERE

SELECT
    a.actor_id,
    a.first_name,
    a.last_name
FROM film f
INNER JOIN film_actor fa ON f.film_id   = fa.film_id
INNER JOIN actor a       ON fa.actor_id = a.actor_id
WHERE f.title = 'ACADEMY DINOSAUR'
ORDER BY a.last_name, a.first_name;

-- ============================================================
-- Q6. List all stores and the total number of staff members
--     working in each store, even if a store has no staff.
-- ============================================================
-- Concepts : LEFT JOIN, GROUP BY, COUNT
-- LEFT JOIN ensures stores with no staff still appear.
-- COUNT(s.staff_id) returns 0 if no staff rows match.

SELECT
    st.store_id,
    a.address        AS store_address,
    ci.city,
    COUNT(s.staff_id) AS total_staff
FROM store st
LEFT JOIN staff s   ON st.store_id   = s.store_id
LEFT JOIN address a ON st.address_id = a.address_id
LEFT JOIN city ci   ON a.city_id     = ci.city_id
GROUP BY st.store_id, a.address, ci.city
ORDER BY st.store_id;

-- ============================================================
-- Q7. List customers who have rented films more than 5 times.
--     Include their name and total rental count.
-- ============================================================
-- Concepts : INNER JOIN, GROUP BY, HAVING, COUNT

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 5
ORDER BY total_rentals DESC;

-- ============================================================
-- END OF ASSIGNMENT 2
-- ============================================================
