-- ============================================================
-- 36 | MANY-TO-MANY RELATIONSHIPS
-- ============================================================
-- A many-to-many relationship exists when:
--   One row in Table A relates to MANY rows in Table B
--   AND one row in Table B relates to MANY rows in Table A
--
-- Example in Sakila:
--   film <-> actor  (one film has many actors, one actor in many films)
--   film <-> category (one film in many categories, one category has many films)
--
-- Implemented using a JUNCTION TABLE (bridge/pivot table):
--   film_actor (film_id, actor_id)
--   film_category (film_id, category_id)
--
-- To query: JOIN through the junction table.
-- ============================================================

USE sakila;

-- Q1: All actors in a specific film (film -> film_actor -> actor)
SELECT
    f.title,
    a.first_name,
    a.last_name
FROM film f
INNER JOIN film_actor fa ON f.film_id   = fa.film_id
INNER JOIN actor a       ON fa.actor_id = a.actor_id
WHERE f.title = 'ACADEMY DINOSAUR';

-- Q2: All films a specific actor has appeared in (actor -> film_actor -> film)
SELECT
    a.first_name,
    a.last_name,
    f.title,
    f.release_year
FROM actor a
INNER JOIN film_actor fa ON a.actor_id  = fa.actor_id
INNER JOIN film f        ON fa.film_id  = f.film_id
WHERE a.actor_id = 1
ORDER BY f.title;

-- Q3: Films with their categories (many-to-many via film_category)
SELECT
    f.title,
    GROUP_CONCAT(cat.name ORDER BY cat.name SEPARATOR ', ') AS categories
FROM film f
INNER JOIN film_category fc ON f.film_id      = fc.film_id
INNER JOIN category cat     ON fc.category_id  = cat.category_id
GROUP BY f.film_id, f.title
LIMIT 10;

-- Q4: Count actors per film and films per actor (both sides of M:M)
-- Actors per film
SELECT
    f.title,
    COUNT(fa.actor_id) AS actor_count
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY actor_count DESC
LIMIT 10;

-- Films per actor
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC
LIMIT 10;
