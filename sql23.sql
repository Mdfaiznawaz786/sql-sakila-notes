-- ============================================================
-- 23 | COALESCE / IFNULL / ISNULL
-- ============================================================
-- IFNULL(expr, fallback)
--   Returns fallback if expr is NULL, else returns expr.
--   MySQL specific. Accepts exactly 2 arguments.
--
-- COALESCE(v1, v2, v3, ...)
--   Returns the FIRST non-NULL value in the list.
--   Standard SQL. Accepts multiple arguments.
--
-- ISNULL(expr)
--   Returns 1 if expr is NULL, else returns 0.
--   MySQL specific. Used for checking, not replacing.
--
-- Key difference:
--   IFNULL  = 2 args only, MySQL only
--   COALESCE = multiple args, standard SQL (preferred)
--   ISNULL  = returns 0 or 1 (boolean check only)
-- ============================================================

USE sakila;

-- Q1: IFNULL - replace NULL return_date with 'Not Returned'
SELECT
    rental_id,
    rental_date,
    IFNULL(CAST(return_date AS CHAR), 'Not Returned') AS return_status
FROM rental
LIMIT 10;

-- Q2: COALESCE - first non-NULL from multiple columns
-- original_language_id falls back to language_id if NULL
SELECT
    title,
    original_language_id,
    language_id,
    COALESCE(original_language_id, language_id) AS effective_language_id
FROM film
LIMIT 10;

-- Q3: ISNULL - returns 1 if NULL, 0 if not (useful in conditions)
SELECT
    rental_id,
    return_date,
    ISNULL(return_date) AS is_missing
FROM rental
LIMIT 10;

-- Q4: COALESCE with a hardcoded fallback string
SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(email, 'no-email@unknown.com') AS safe_email
FROM customer
LIMIT 10;
