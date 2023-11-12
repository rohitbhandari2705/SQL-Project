--4- write a query to find city which had lowest percentage spend for gold card type


with cte1 as (select city,sum(amount) as am_per_city from credit_card 
where card_type='gold'
group by city),
cte2 as (select city , sum(amount) as amt_city
from credit_card
group by city)

select top 1 c.city,am_per_city,amt_city,am_per_city*1.0/amt_city*100 as per from cte1 c inner join cte2 c1
on c.city=c1.city
order by per