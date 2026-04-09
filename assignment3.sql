#1. display all customer details who have made more than 5 payments.
select c.first_name, c.last_name, count(payment_id) from customer c 
INNER JOIN payment p ON c.customer_id = p.customer_id
group by c.customer_id
having count(payment_id) > 5;

#view:
create VIEW view_customer_payment_summary AS
SELECT c.customer_id,c.first_name,c.last_name,
    COUNT(p.payment_id) AS total_payments,
    SUM(p.amount) AS total_amount_paid
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
#----> querying the view:
select *
FROM view_customer_payment_summary
WHERE total_payments > 5
ORDER BY total_payments DESC;

#2. Find the names of actors who have acted in more than 10 films.
select a.first_name, a.last_name, actor_id from actor a
Inner join film_actor fa on a.actor_id = fa.actor_id
group by actor_id, a.first_name, a.last_name
having count(fa.film_id) > 10;

#Temp Table:
create TEMPORARY TABLE temp_actor_film_counts AS
SELECT actor_id,
    COUNT(film_id) AS total_films
FROM film_actor
GROUP BY actor_id;

select a.actor_id, a.first_name, a.last_name
FROM actor a
INNER JOIN temp_actor_film_counts t ON a.actor_id = t.actor_id
WHERE t.total_films > 10
ORDER BY t.total_films DESC;


#3. Find the names of customers who never made a payment.

SELECT c.customer_id, c.first_name,c.last_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL
#################################################################
#Subqery:
SELECT * FROM customer;
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM payment
    WHERE customer_id IS NOT NULL
)
ORDER BY first_name, last_name;

#4. List all films whose rental rate is higher than the average rental rate of all films.
#(i) avg rental rate of all films
# (ii) all films whose rental rate is higher than (i)
#subquery:
select film_id, title, rating, rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
)
ORDER BY rental_rate DESC;

#5. List the titles of films that were never rented.
#subquery:
select film_id,title,rating
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT i.film_id
    FROM inventory i
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
)
ORDER BY title;

#6. Display the customers who rented films in the same month as customer with ID 5.
#subquery:
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
WHERE c.customer_id != 5
  AND (YEAR(r.rental_date), MONTH(r.rental_date)) IN (
      SELECT YEAR(rental_date), MONTH(rental_date)
      FROM rental
      WHERE customer_id = 5
  )
ORDER BY c.last_name, c.first_name;

#7. Find all staff members who handled a payment greater than the average payment amount.
#CTE:
with avg_payment AS (
    SELECT ROUND(AVG(amount), 2) AS avg_amount
    FROM payment
)
SELECT DISTINCT s.staff_id, s.first_name,s.last_name, a.avg_amount
FROM staff s
INNER JOIN payment p  ON s.staff_id = p.staff_id
CROSS JOIN avg_payment a
WHERE p.amount > a.avg_amount
ORDER BY s.first_name;

#8. Show the title and rental duration of films whose rental duration is greater than the average.
#CTE:
with avg_duration AS (
    SELECT ROUND(AVG(rental_duration), 2) AS avg_rental_duration
    FROM film
)
SELECT f.film_id,f.title,f.rental_duration,a.avg_rental_duration
FROM film f
CROSS JOIN avg_duration a
WHERE f.rental_duration > a.avg_rental_duration
ORDER BY f.rental_duration DESC, f.title;

#9. Find all customers who have the same address as customer with ID 1.
#CTE:
with customer1_address AS (
    SELECT address_id
    FROM customer
    WHERE customer_id = 1
)
select c.customer_id,c.first_name,c.last_name,c.email,a.address,ci.city,co.country
FROM customer c
INNER JOIN customer1_address ca ON c.address_id  = ca.address_id
INNER JOIN address a            ON c.address_id  = a.address_id
INNER JOIN city ci              ON a.city_id     = ci.city_id
INNER JOIN country co           ON ci.country_id = co.country_id
WHERE c.customer_id != 1
ORDER BY c.last_name;

#10. List all payments that are greater than the average of all payments.
#subquery:
select payment_id, customer_id, amount
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
)
ORDER BY amount DESC;
