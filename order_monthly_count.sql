# This query intend to count of rental orders during every month for all the years


select 	sr.store_id Store_id,
	DATE_PART('month', rental_date) Rental_mont,
	DATE_PART('year', rental_date) Rental_year,
	count(*) Count_rentals
from 	rental r
JOIN	 staff s
ON 	r.staff_id = s.staff_id
JOIN 	store sr
ON 	s.store_id = sr.store_id
GROUP BY 1,2,3
ORDER BY 4 DESC;
