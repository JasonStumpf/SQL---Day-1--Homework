-- 1. How many actors are there with the last name ‘Wahlberg’? 
SELECT * FROM actor;
SELECT last_name From actor;
SELECT last_name FROM actor WHERE last_name = 'Wahlberg';
-- There are 2 actors with the last name 'Wahlberg'.

-- 2. How many payments were made between $3.99 and $5.99?
SELECT * FROM payment;
SELECT amount FROM payment;
SELECT amount FROM payment WHERE amount > 3.99;
SELECT amount FROM payment WHERE amount < 5.99;
SELECT amount FROM payment WHERE amount between 3.99 and 5.99; 
-- There are 0 payments made between $3.99 and $5.99.

-- 3. What film does the store have the most of? (search in inventory)
SELECT * FROM inventory;
SELECT film_id FROM inventory;
SELECT film_id, COUNT(film_id) FROM inventory GROUP BY film_id;
SELECT film_id, COUNT(film_id) FROM inventory GROUP BY film_id ORDER BY COUNT(film_id) DESC;
SELECT * FROM film;
SELECT film_id, title FROM film;
SELECT film_id, title FROM film WHERE film_id = '193';
-- The film that the store has the most of is CROSSROADS CASUALTIES.

-- 4. How many customers have the last name ‘William’?
SELECT * FROM customer;
SELECT last_name FROM customer;
SELECT last_name FROM customer WHERE last_name = 'William';
-- There are 0 customers with the last name 'William'

-- 5. What store employee (get the id) sold the most rentals?
SELECT * FROM payment;
SELECT staff_id, amount FROM payment;
SELECT staff_id, SUM(amount) FROM payment WHERE staff_id = '1' GROUP BY staff_id;
SELECT staff_id, SUM(amount) FROM payment WHERE staff_id = '2' GROUP BY staff_id;
SELECT * FROM staff;
SELECT first_name, last_name FROM staff WHERE staff_id = '1';
-- MIKE HILLYER sold the most rentals.

-- 6. How many different district names are there?
SELECT * FROM address;
SELECT district FROM address;
SELECT district, count(district) FROM address GROUP BY district;
-- There are 378 different district names.

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT * FROM film_actor;
SELECT film_id, actor_id FROM film_actor;
SELECT film_id, COUNT(actor_id) FROM film_actor GROUP BY film_id;
SELECT film_id, COUNT(actor_id) FROM film_actor GROUP BY film_id ORDER BY COUNT(actor_id) DESC;
SELECT * FROM film;
SELECT film_id, title FROM film;
SELECT film_id, title FROM film WHERE film_id = '508';
-- The film with the most actors in it is LAMBS CINCINATTI.

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT * FROM customer;
SELECT store_id, last_name FROM customer;
SELECT store_id, last_name FROM customer WHERE store_id = '1';
SELECT store_id, last_name FROM customer WHERE last_name LIKE '%es';
SELECT store_id, last_name FROM customer WHERE store_id = '1' AND last_name LIKE '%es';
-- Fom store_id 1, there are 13 customers with a last name ending in 'es'.

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT * FROM payment;
SELECT customer_id, amount FROM payment;
SELECT customer_id, amount FROM payment WHERE customer_id BETWEEN 380 and 430;
SELECT COUNT(customer_id), amount FROM payment WHERE customer_id BETWEEN 380 and 430 GROUP BY amount;
SELECT COUNT(customer_id), amount FROM payment WHERE customer_id BETWEEN 380 and 430 GROUP BY amount HAVING COUNT(customer_id) > 250;
-- There are 3 payments (-423.01, -425.01, -427.01) that have a number of rentals above 250 for customers_ids between 380 and 430

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT * FROM film;
SELECT rating FROM film;
SELECT rating, COUNT(rating) FROM film GROUP BY rating;
SELECT rating, COUNT(rating) FROM film GROUP BY rating ORDER BY COUNT(rating) DESC;
-- There are FIVE rating categories and PG-13 has the most movies total.
