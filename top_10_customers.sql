# This query intend to find the top 10 paying customers

WITH top_ten_customers AS (
Select	 c.customer_id,
	first_name|| ' '||last_name AS Full_name,
	SUM(amount) total_paying_amount
from 	payment p
JOIN 	customer c
ON 	p.customer_id = c.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10
)

select 	DATE_TRUNC('month', payment_date) pay_month,
	t.Full_name,
	COUNT(*) pay_countpermon,
	SUM(amount) pay_amount
from 	payment p
JOIN 	top_ten_customers t
ON 	p.customer_id = t.customer_id
GROUP BY 1,2
ORDER BY 2;
