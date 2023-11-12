--5- write a query to print 3 columns:  city, highest_expense_type , lowest_expense_type (example format : Delhi , bills, Fuel)

with cte as (select city,exp_type,sum(amount) as city_per_exp from credit_card 
group by city,exp_type)
,cte2 as (select city,max(city_per_exp) as max_am,min(city_per_exp) as min_am from cte group by city)
select c.city,
max(case when max_am = city_per_exp then exp_type end) as max_exp_type , 
min(case when min_am = city_per_exp then exp_type end) as min_exp_type from cte c  join cte2 c2 on c.city=c2.city
group by c.city

