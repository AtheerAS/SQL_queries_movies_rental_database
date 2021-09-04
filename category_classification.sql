# query that lists each movie, the film category it is classified in, and the number of times it has been rented out.

SELECT 	 category,
	SUM(rental_count)
FROM (
SELECT 	f.title movie_name,
	c.name category,
	count(*) rental_count
FROM 	category c
JOIN 	film_category fc
ON 	c.category_id = fc.category_id
JOIN 	film f
ON 	f.film_id = fc.film_id
JOIN 	inventory i
ON 	i.film_id = f.film_id
JOIN	 rental r
ON	r.inventory_id = i.inventory_id
WHERE 	c.name IN ('Animation’,  'Children, 'Classics',
	'Comedy’, 'Family’, 'Music')
GROUP BY f.title, c.name
ORDER BY count(*) DESC
) t1
GROUP BY 1
ORDER BY 1;
