# Query to find length of rental duration of these family-friendly movies compares to the duration that all movies are rented for. 

SELECT 	 category,
	 Standard_quartile,
	 count(*)
FROM (
SELECT 	f.title movie_title,
	c.name category,
	f.rental_duration,
	NTILE (4) OVER (ORDER BY rental_duration) 	Standard_quartile
FROM 	category c
JOIN 	film_category fc
ON 	c.category_id = fc.category_id
JOIN 	film f
ON 	f.film_id = fc.film_id
WHERE 	c.name IN ('Animation', 'Children', 'Classics',
	'Comedy','Family','Music')
ORDER BY 4
) t1
GROUP BY 1,2
ORDER BY  1,2;
