-- ============================================================
-- 19 | STRING FUNCTIONS
-- ============================================================
-- UPPER(str)            : converts to uppercase
-- LOWER(str)            : converts to lowercase
-- LENGTH(str)           : number of characters
-- SUBSTRING(str, pos, len) : extract part of string
-- REPLACE(str, from, to)   : replace occurrences
-- TRIM(str)             : remove leading/trailing spaces
-- CONCAT(s1, s2, ...)   : join strings together
-- LEFT(str, n)          : first n characters
-- RIGHT(str, n)         : last n characters
-- INSTR(str, substr)    : position of substring
-- REVERSE(str)          : reverse a string
-- LPAD / RPAD           : pad string to a length
-- ============================================================

USE sakila;

-- Q1: Full name in uppercase and lowercase
SELECT
    UPPER(CONCAT(first_name, ' ', last_name)) AS upper_name,
    LOWER(CONCAT(first_name, ' ', last_name)) AS lower_name
FROM actor
LIMIT 10;

-- Q2: Length of each film title + first 10 and last 10 characters
SELECT
    title,
    LENGTH(title)          AS title_length,
    LEFT(title, 10)        AS first_10,
    RIGHT(title, 10)       AS last_10
FROM film
LIMIT 10;

-- Q3: Replace word in description + trim whitespace demo
SELECT
    title,
    REPLACE(description, 'Brilliant', 'Amazing') AS updated_description
FROM film
WHERE description LIKE '%Brilliant%'
LIMIT 5;

-- Q4: Extract domain from customer email + reverse last name
SELECT
    email,
    SUBSTRING(email, INSTR(email, '@') + 1) AS domain,
    REVERSE(last_name)                       AS reversed_last
FROM customer
LIMIT 10;
