/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH featstable AS(
    SELECT title, unnest(special_features) AS feats FROM film)

SELECT feats as special_features, count(feats) from featstable
GROUP BY special_features
ORDER BY special_features;

