-- ============================================================
-- 18 | CASE EXPRESSION
-- ============================================================
-- Conditional logic in SQL, like if/else
-- Simple:   CASE col WHEN val THEN result END
-- Searched: CASE WHEN condition THEN result END
-- ============================================================

USE sakila;

-- Q1: Label films by rating
SELECT title, rating,
    CASE rating
        WHEN 'G'     THEN 'General Audience'
        WHEN 'PG'    THEN 'Parental Guidance'
        WHEN 'PG-13' THEN 'Teens and Above'
        WHEN 'R'     THEN 'Restricted'
        WHEN 'NC-17' THEN 'Adults Only'
        ELSE 'Unknown'
    END AS rating_description
FROM film;

-- Q2: Categorize films by length
SELECT title, length,
    CASE
        WHEN length < 60  THEN 'Short'
        WHEN length < 120 THEN 'Medium'
        WHEN length < 180 THEN 'Long'
        ELSE 'Epic'
    END AS length_category
FROM film;

-- Q3: Classify rental rate as Budget, Standard, or Premium
SELECT title, rental_rate,
    CASE
        WHEN rental_rate < 2.00 THEN 'Budget'
        WHEN rental_rate < 4.00 THEN 'Standard'
        ELSE 'Premium'
    END AS price_tier
FROM film;

-- Q4: Categorize customers as Active or Inactive
SELECT first_name, last_name,
    CASE active
        WHEN 1 THEN 'Active'
        ELSE 'Inactive'
    END AS status
FROM customer;
