--1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name, amount
HAVING amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175;

--4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, city
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';

--5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(rental_date)
FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY first_name, last_name;
--Answer: Mike Hillyer

--6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;
--Answer: R - 196, PG - 194, PG13 - 223, G - 178, NC17 - 209

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT payment.customer_id
    FROM payment
    WHERE amount > 6.99
);

--8. How many free rentals did our stores give away?
SELECT amount
FROM payment
WHERE amount = 0;
--Answer: none