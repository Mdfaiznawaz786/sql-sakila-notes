-- ============================================================
-- 52 | TRIGGERS
-- ============================================================
-- A trigger automatically executes SQL when a specific
-- event occurs on a table.
--
-- Trigger events : INSERT, UPDATE, DELETE
-- Trigger timing : BEFORE, AFTER
--
-- Syntax:
--   CREATE TRIGGER trigger_name
--   {BEFORE | AFTER} {INSERT | UPDATE | DELETE}
--   ON table_name FOR EACH ROW
--   BEGIN
--       -- SQL logic
--   END;
--
-- Special row references:
--   NEW.col : new value (INSERT / UPDATE)
--   OLD.col : old value (UPDATE / DELETE)
--
-- Use cases:
--   Audit logging, auto-updating fields,
--   enforcing business rules, cascading changes.
-- ============================================================

USE sakila;

-- Q1: Create an audit log table first
CREATE TABLE IF NOT EXISTS payment_audit_log (
    log_id       INT AUTO_INCREMENT PRIMARY KEY,
    payment_id   INT,
    old_amount   DECIMAL(5,2),
    new_amount   DECIMAL(5,2),
    changed_at   DATETIME DEFAULT NOW(),
    action_type  VARCHAR(10)
);

-- Q2: AFTER UPDATE trigger — log payment amount changes
DELIMITER $$
CREATE TRIGGER trg_after_payment_update
AFTER UPDATE ON payment
FOR EACH ROW
BEGIN
    IF OLD.amount <> NEW.amount THEN
        INSERT INTO payment_audit_log
            (payment_id, old_amount, new_amount, action_type)
        VALUES
            (OLD.payment_id, OLD.amount, NEW.amount, 'UPDATE');
    END IF;
END $$
DELIMITER ;

-- Test it
UPDATE payment SET amount = 9.99 WHERE payment_id = 1;
SELECT * FROM payment_audit_log;

-- Restore
UPDATE payment SET amount = 2.99 WHERE payment_id = 1;

-- Q3: BEFORE INSERT trigger — ensure payment amount is positive
DELIMITER $$
CREATE TRIGGER trg_before_payment_insert
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than 0';
    END IF;
END $$
DELIMITER ;

-- Test valid insert (will succeed)
-- INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
-- VALUES (1, 1, 1, 5.99, NOW());

-- Test invalid insert (will raise error)
-- INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
-- VALUES (1, 1, 1, -1.00, NOW());

-- Q4: View all triggers on the sakila database
SELECT
    TRIGGER_NAME,
    EVENT_MANIPULATION,
    EVENT_OBJECT_TABLE,
    ACTION_TIMING
FROM INFORMATION_SCHEMA.TRIGGERS
WHERE TRIGGER_SCHEMA = 'sakila';

-- Cleanup
DROP TRIGGER IF EXISTS trg_after_payment_update;
DROP TRIGGER IF EXISTS trg_before_payment_insert;
DROP TABLE  IF EXISTS payment_audit_log;
