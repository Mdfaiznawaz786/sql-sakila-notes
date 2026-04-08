-- ============================================================
-- 28 | RIGHT JOIN (RIGHT OUTER JOIN)
-- ============================================================
-- Returns ALL rows from the RIGHT table.
-- Matched rows from the LEFT table are included.
-- Unmatched left side columns return NULL.
--
-- Use when: you want everything from the right table
--           regardless of whether a match exists.
--
-- Note: RIGHT JOIN is less commonly used.
--       Most queries can be rewritten as LEFT JOIN
--       by swapping the table order.
-- ============================================================

USE sakila;

-- Q1: All stores and their staff (including stores with no staff)
SELECT
    st.store_id,
    s.first_name,
    s.last_name
FROM staff s
RIGHT JOIN store st ON s.store_id = st.store_id;

-- Q2: All categories and their films (including unused categories)
SELECT
    cat.name AS category,
    COUNT(fc.film_id) AS film_count
FROM film_category fc
RIGHT JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY film_count DESC;

-- Q3: All languages and films using them (including unused languages)
SELECT
    l.name AS language,
    COUNT(f.film_id) AS film_count
FROM film f
RIGHT JOIN language l ON f.language_id = l.language_id
GROUP BY l.name
ORDER BY film_count DESC;

-- Q4: Same as Q1 rewritten as LEFT JOIN (equivalent result)
-- RIGHT JOIN: staff RIGHT JOIN store
-- LEFT JOIN:  store LEFT JOIN staff
SELECT
    st.store_id,
    s.first_name,
    s.last_name
FROM store st
LEFT JOIN staff s ON st.store_id = s.store_id;
