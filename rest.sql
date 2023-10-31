#Number of rest per type

SELECT restaurant_type, count(restaurant_name) as N_of_rest
FROM restaurants r
LEFT JOIN  restaurant_types t
	ON r.restaurant_type_id = t.id
group by restaurant_type;

#Number of restaurants per type in each city
SELECT city, restaurant_type, count(restaurant_name) as N_of_rest
FROM restaurants r
JOIN  restaurant_types t
	ON r.restaurant_type_id = t.id
JOIN cities c
	On r.city_id = c.id
group by restaurant_type, city
ORDER BY 1,2;

# Memebrs with the larget budget
SELECT concat(first_name, ' ', surname) as name, monthly_budget
from members
WHERE monthly_budget = (SELECT MAX(monthly_budget)
FROM members);

#How many memebers from each city?
SELECT city, count(first_name) as num_members
FROM members r
JOIN  cities c
	ON city_id = c.id
group by city
ORDER BY 2 DESC;

#Who is the person who order the most starter?
SELECT concat(first_name, ' ', surname) as name, count(s.id) as num_star
FROM serve_types s
JOIN meals m
ON m.serve_type_id = s.id
JOIN order_details od
On od.meal_id = m.id
JOIN orders o
on o.id = od.order_id
JOIN members e
ON e.id = o.member_id
WHERE serve_type = 'starter'
group by concat(first_name, ' ', surname)
ORDER BY num_star DESC LIMIT 1;

