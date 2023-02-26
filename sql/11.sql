/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

WITH features AS(
    SELECT title, unnest(special_features) AS feats FROM film),

actors AS(
    SELECT film.title, (actor.first_name || ' ' || actor.last_name) AS "Actor Name" from film 
    JOIN film_actor USING(film_id)
    JOIN actor USING(actor_id))

SELECT DISTINCT("Actor Name") from actors 
WHERE actors.title IN (SELECT title FROM features WHERE feats = 'Behind the Scenes')
ORDER BY "Actor Name";

