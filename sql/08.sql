/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH G AS(
    SELECT title FROM film
    WHERE rating = 'G'),

features AS(
    SELECT title, unnest(special_features) AS feats FROM film),

trailers AS(
    SELECT * FROM features 
    WHERE feats = 'Trailers')

SELECT title FROM G 
WHERE title IN (SELECT title FROM trailers);
