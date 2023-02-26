/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

WITH featstable AS(
    SELECT title, unnest(special_features) AS feats FROM film),

movieprofit AS(
    SELECT film.title, sum(payment.amount) AS profit FROM film
    INNER JOIN inventory ON film.film_id = inventory.film_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
    INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.title
ORDER BY sum(payment.amount) DESC)

SELECT featstable.feats AS special_feature, sum(movieprofit.profit) AS profit from featstable
LEFT JOIN movieprofit USING(title)
GROUP BY featstable.feats
ORDER BY featstable.feats;








