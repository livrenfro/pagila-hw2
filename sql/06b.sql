/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

WITH films AS (
    SELECT title, film_id FROM film),

inv AS (
    SELECT film_id FROM inventory)

SELECT DISTINCT(title) from films
LEFT JOIN inv USING(film_id)
WHERE inv.film_id IS NULL
ORDER BY title;
