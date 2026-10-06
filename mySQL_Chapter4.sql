/********************************************************
Date: 2026-10-01
Name: Suna Aregay
Chapter 4 Assignment
Github URL: https://github.com/suna2km/MySQL_Chapter4
*********************************************************/
/********************************************************************
Query 1: Inner Join
• write a query that produces the following output displaying the film’s language
• tables: film, language
• sort by title
• only display the first 10 rows (records)
*****************************************************************************************/
SELECT film_id, title, description, f.language_id, name
FROM film f INNER JOIN language l
	ON f.language_id = l.language_id
ORDER BY title
LIMIT 10;
/********************************************************************
Query 2: Compound Join Condition
• write a query that produces the following output displaying customers with an actor name
• tables: customer, actor
• sort by customer name
*****************************************************************************************/
SELECT CONCAT(c.last_name,  ', ', c.first_name) as customer_name,
	CONCAT(a.last_name,  ', ', a.first_name) as actor_name
FROM customer c JOIN actor a
	ON c.first_name = a.first_name
    AND c.last_name = a.last_name
ORDER BY customer_name;
/********************************************************************
Query 3: Self-Join
• write a query that produces the following output for customers with the same first name
• tables: customer
• sort by first name and last name
*****************************************************************************************/
SELECT DISTINCT c1.customer_id, c1.store_id, c1.first_name, c1.last_name
FROM customer c1 JOIN customer c2
	ON c1.first_name = c2.first_name AND
       c1.last_name <> c2.last_name
ORDER BY first_name, last_name;
/********************************************************************
Query 4: More than two tables
• Write a query that produces the following output displaying the staff’s address
• tables: staff, address, city, country
• sort by last name and first name
*****************************************************************************************/
SELECT staff_id, CONCAT(last_name,  ', ', first_name) AS staff_name, email, store_id, district, city, country
FROM staff s 
	JOIN address a 
		ON s.address_id = a.address_id
	JOIN city c
		ON c.city_id = a.city_id
	JOIN country co
		ON co.country_id = c.country_id
ORDER BY last_name, first_name;
/********************************************************************
Query 5: Implicit Inner Join
• Convert query 4 from an explicit join to an implicit join.
• Result set will be the same.
*****************************************************************************************/
SELECT staff_id, CONCAT(last_name,  ', ', first_name) AS staff_name, email, store_id, district, city, country
FROM staff s, address a, city c, country co 
WHERE s.address_id = a.address_id
	AND c.city_id = a.city_id
    AND co.country_id = c.country_id
ORDER BY last_name, first_name;
