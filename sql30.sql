-- ============================================================
-- 30 | CROSS JOIN
-- ============================================================
-- Returns the CARTESIAN PRODUCT of two tables.
-- Every row from table1 is combined with every row of table2.
-- Result rows = rows in table1 * rows in table2
--
-- No ON condition is needed.
-- Use with caution — large tables produce huge result sets.
-- Useful for: generating combinations, test data, calendars.
-- ============================================================

USE sakila;

-- Q1: Every store paired with every language (2 stores x 6 languages = 12 rows)
SELECT
    st.store_id,
    l.name AS language
FROM store st
CROSS JOIN language l;

-- Q2: Every staff member paired with every store
SELECT
    s.first_name,
    s.last_name,
    st.store_id
FROM staff s
CROSS JOIN store st;

-- Q3: Generate all combinations of ratings and rental durations
SELECT DISTINCT
    f1.rating,
    f2.rental_duration
FROM film f1
CROSS JOIN film f2
GROUP BY f1.rating, f2.rental_duration
ORDER BY f1.rating, f2.rental_duration;

-- Q4: Practical use - pair each category with each store
SELECT
    cat.name AS category,
    st.store_id
FROM category cat
CROSS JOIN store st
ORDER BY cat.name;
