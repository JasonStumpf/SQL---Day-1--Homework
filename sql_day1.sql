-- Hellow world!

SELECT * 
FROM actor;

-- A note on single vs double quotes - use singles!!!
-- single quotes represent strings, doubles represent DB identifiers

SELECT first_name, last_name
FROM actor;

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Wildcards! use these with LIKE: _  and %
-- % is a true wildcard, that means any number  of characters!
-- _ is a one character wildcard

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'N%';

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'W%';

-- Comparison operators:
-- = and LIKE (see above)
-- Greater > and less than <
-- Greater/equal  to >= and less than/equal to <=
-- Not equal <>
-- We also have the word BETWEEN, which is inclusive

SELECT *
FROM payment;

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.98 AND 6.00;

SELECT customer_id, amount
FROM payment
WHERE amount < -420
ORDER BY amount DESC;

--default is ASC for ORDER BY
-- select
-- from
-- where
-- order by

SELECT * FROM payment WHERE amount > 70

SELECT *
FROM customer;

SELECT first_name, last_name
FROM customer
WHERE customer_id = 341;

-- SQL aggregators: SUM(), AVG(), MIN(), MAX(), COUNT()

SELECT * FROM payment;

SELECT AVG(amount)
from payment
WHERE amount < -420

-- let's think about the average of amounts under 0

SELECT COUNT(amount)
from payment
WHERE amount > 0;

-- What about DISTINCT amounts?

SELECT COUNT(DISTINCT amount)
from payment
WHERE amount > 0;

SELECT MIN(amount) as Biggest_payout
FROM payment
WHERE amount < 0;

GROUP BY:
-- have to use this when mixing aggregates and reg coulums to sort it out

SELECT amount, COUNT(amount), SUM(amount)
FROM payment
WHERE amount = -426.01
GROUP BY amount
ORDER BY amount;

SELECT * FROM customer

SELECT COUNT(customer_id), email
from customer
WHERE email LIKE 'jas%'
GROUP BY email
HAVING COUNT(customer_id) > 0

-- Some General Rules:

SELECT customer_id, SUM(amount) -- what (columns) we want to see
FROM payment                    -- from where?
-- these  two are the basic building blocks/foundation

WHERE customer_id BETWEEN 0 and 150 -- how?
GROUP BY customer_id -- using aggregates
HAVING SUM(amount) > 100 -- just like where but for aggregates. . . optional?
            -- DOES NOT come before group by
ORDER BY customer_id 
LIMIT 2 -- always towards end and limits results
OFFSET 3 -- not super helpful or very common

select * from payment LIMIT 5 OFFSET 2

-- BASIC STRUCTURE/ORDER:
-- select <colums> <aggregates>
-- from <table>
-- where <conditional>
-- group by <colums>
-- having <conditional>
-- order by <column>