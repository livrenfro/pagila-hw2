/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

WITH feats AS(
    SELECT title, unnest(special_features) AS feats FROM film),

behind AS(
    SELECT title FROM feats 
    WHERE feats = 'Behind the Scenes'),

trailers AS(
    SELECT title from feats 
    WHERE feats = 'Trailers')

SELECT title from behind
INNER JOIN trailers USING(title)
ORDER BY title; 
