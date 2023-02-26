/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

WITH us AS(
    SELECT customer_id from customer
    INNER JOIN address ON customer.address_id = address.address_id 
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON city.country_id = country.country_id
    WHERE country.country_id = 103),

rents AS(
    SELECT film.title, rental.customer_id FROM rental
    INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
    INNER JOIN film ON inventory.film_id = film.film_id),

nonusrents AS(
    SELECT * from rents 
    WHERE rents.customer_id IN (SELECT * FROM us)
)

SELECT DISTINCT(title) FROM rents
WHERE rents.title NOT IN (SELECT title FROM nonusrents)
ORDER BY title;

