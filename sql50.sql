-- ============================================================
-- 50 | TRANSACTIONS (COMMIT / ROLLBACK)
-- ============================================================
-- A transaction is a group of SQL statements that execute
-- as a single unit. Either ALL succeed or NONE do.
--
-- ACID Properties:
--   Atomicity   : all or nothing
--   Consistency : data stays valid
--   Isolation   : transactions don't interfere
--   Durability  : committed changes are permanent
--
-- Commands:
--   START TRANSACTION  : begin a transaction
--   COMMIT             : save all changes permanently
--   ROLLBACK           : undo all changes since last commit
--   SAVEPOINT name     : create a rollback checkpoint
--   ROLLBACK TO name   : rollback to a specific savepoint
--
-- Note: MySQL auto-commits by default. Use
--   SET autocommit = 0; to disable.
-- ============================================================

USE sakila;

-- Q1: Basic transaction — commit a payment insert
START TRANSACTION;

INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (1, 1, 1, 5.99, NOW());

-- Check it was inserted
SELECT * FROM payment ORDER BY payment_id DESC LIMIT 1;

-- Confirm and save
COMMIT;

-- Q2: Transaction with ROLLBACK — undo a mistaken update
START TRANSACTION;

-- Accidentally update all rental rates to 0
UPDATE film SET rental_rate = 0.00;

-- Check the damage
SELECT AVG(rental_rate) FROM film;

-- Undo it
ROLLBACK;

-- Confirm rates are back
SELECT AVG(rental_rate) FROM film;

-- Q3: SAVEPOINT — partial rollback
START TRANSACTION;

UPDATE film SET rental_rate = 1.00 WHERE rating = 'G';
SAVEPOINT after_g_update;

UPDATE film SET rental_rate = 1.00 WHERE rating = 'PG';
-- Oops — only wanted to update G, not PG

ROLLBACK TO after_g_update;
-- PG update undone, G update preserved

COMMIT;

-- Restore original rates
UPDATE film SET rental_rate = 0.99 WHERE rating = 'G';
COMMIT;

-- Q4: autocommit demo
SET autocommit = 0;

DELETE FROM payment WHERE payment_id = 999999; -- safe: ID won't exist

ROLLBACK; -- undo delete

SET autocommit = 1; -- restore default
