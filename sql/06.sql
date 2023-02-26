/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * HINT:
 * This can be done by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 */

WITH films AS (
    SELECT title, film_id FROM film),

inv AS (
    SELECT film_id FROM inventory)

SELECT title FROM films
WHERE films.film_id NOT IN (SELECT inv.film_id FROM inv);
