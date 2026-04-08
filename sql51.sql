-- ============================================================
-- 51 | STORED PROCEDURES
-- ============================================================
-- A stored procedure is a saved block of SQL that can be
-- called by name with optional parameters.
--
-- Benefits:
--   Reusable logic, reduced network traffic,
--   encapsulation, can include control flow (IF, LOOP)
--
-- Parameter types:
--   IN    : input value (read only)
--   OUT   : output value (write only)
--   INOUT : both input and output
--
-- Syntax:
--   DELIMITER $$
--   CREATE PROCEDURE proc_name (IN param type)
--   BEGIN
--       -- SQL statements
--   END $$
--   DELIMITER ;
--
--   CALL proc_name(value);
-- ============================================================

USE sakila;

-- Q1: Simple procedure — get all films by rating
DELIMITER $$
CREATE PROCEDURE GetFilmsByRating(IN p_rating VARCHAR(10))
BEGIN
    SELECT title, rental_rate, length
    FROM film
    WHERE rating = p_rating
    ORDER BY title;
END $$
DELIMITER ;

CALL GetFilmsByRating('PG-13');
CALL GetFilmsByRating('G');

-- Q2: Procedure with OUT parameter — count rentals for a customer
DELIMITER $$
CREATE PROCEDURE GetCustomerRentalCount(
    IN  p_customer_id INT,
    OUT p_rental_count INT
)
BEGIN
    SELECT COUNT(*) INTO p_rental_count
    FROM rental
    WHERE customer_id = p_customer_id;
END $$
DELIMITER ;

CALL GetCustomerRentalCount(1, @count);
SELECT @count AS rental_count;

-- Q3: Procedure with IF logic — classify customer by spend
DELIMITER $$
CREATE PROCEDURE ClassifyCustomer(IN p_customer_id INT)
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT SUM(amount) INTO v_total
    FROM payment
    WHERE customer_id = p_customer_id;

    IF v_total > 150 THEN
        SELECT 'VIP Customer' AS classification, v_total AS total_spent;
    ELSEIF v_total > 100 THEN
        SELECT 'Regular Customer' AS classification, v_total AS total_spent;
    ELSE
        SELECT 'Occasional Customer' AS classification, v_total AS total_spent;
    END IF;
END $$
DELIMITER ;

CALL ClassifyCustomer(1);
CALL ClassifyCustomer(50);

-- Q4: Drop procedures when done
DROP PROCEDURE IF EXISTS GetFilmsByRating;
DROP PROCEDURE IF EXISTS GetCustomerRentalCount;
DROP PROCEDURE IF EXISTS ClassifyCustomer;
