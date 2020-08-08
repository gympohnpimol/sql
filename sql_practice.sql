SELECT
	(SELECT COUNT(*) FROM film) AS films,
	(SELECT COUNT(*) FROM actor) AS actors
;

SELECT COUNT(*)
FROM address
WHERE postal_code IS NULL;

SELECT first_name
FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%' OR  first_name LIKE 'A%';

SELECT first_name,
	last_name,
	COUNT(*) AS count_no
FROM actor 
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY 1, 2
ORDER BY count_no DESC 
LIMIT 10;

SELECT DISTINCT rating FROM film;

WITH t AS(
	SELECT rating, 
		COUNT(*) AS count_rating,
		(SELECT COUNT(*) FROM film) AS total
	FROM film
	GROUP BY rating
)

SELECT rating, 
	count_rating,
	count_rating/ CAST(total AS REAL) AS ratingPercentage
FROM t ; 
