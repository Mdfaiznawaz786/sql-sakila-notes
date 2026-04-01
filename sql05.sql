-- ============================================================
-- 05 | SELECT STATEMENT
-- ============================================================
-- Retrieves data from one or more tables
-- SELECT * returns all columns
-- ============================================================

USE sakila;

-- Q1: Specific columns from film
SELECT title, release_year, rating
FROM film;

-- Q2: All columns from actor
SELECT * FROM actor;

-- Q3: Customer names and emails
SELECT first_name, last_name, email
FROM customer;

-- Q4: Film title, length and rental rate with aliases
SELECT title, length AS duration_mins, rental_rate AS price
FROM film;
