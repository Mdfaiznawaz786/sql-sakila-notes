-- ============================================================
-- 35 | REFERENTIAL INTEGRITY BASICS
-- ============================================================
-- Referential integrity ensures that relationships between
-- tables remain consistent.
--
-- PRIMARY KEY: uniquely identifies each row in a table.
-- FOREIGN KEY: a column that references a PK in another table.
--
-- Rules enforced:
-- 1. You cannot insert a FK value that doesn't exist in parent.
-- 2. You cannot delete a parent row if child rows reference it.
--
-- ON DELETE options:
--   RESTRICT    : block delete if child rows exist (default)
--   CASCADE     : delete child rows automatically
--   SET NULL    : set FK to NULL in child rows
--   NO ACTION   : same as RESTRICT
--
-- ON UPDATE options: same as above but for updates.
-- ============================================================

USE sakila;

-- Q1: View foreign key relationships in Sakila
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'sakila'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;

-- Q2: Check for orphaned records (broken referential integrity)
-- Rentals that reference a non-existent customer
SELECT r.rental_id, r.customer_id
FROM rental r
LEFT JOIN customer c ON r.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Q3: Check for payments with no matching rental
SELECT p.payment_id, p.rental_id
FROM payment p
LEFT JOIN rental r ON p.rental_id = r.rental_id
WHERE r.rental_id IS NULL;

-- Q4: Show the FK chain for the rental table
-- rental.customer_id    -> customer.customer_id
-- rental.inventory_id   -> inventory.inventory_id
-- rental.staff_id       -> staff.staff_id
SELECT
    r.rental_id,
    c.customer_id,
    i.inventory_id,
    s.staff_id
FROM rental r
INNER JOIN customer c  ON r.customer_id  = c.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN staff s     ON r.staff_id     = s.staff_id
LIMIT 10;
