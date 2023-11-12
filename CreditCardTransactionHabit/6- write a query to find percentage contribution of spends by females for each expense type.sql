--6- write a query to find percentage contribution of spends by females for each expense type

with cte as (select exp_type,Sum(amount) as total_am from credit_card
group by exp_type)
, cte2 as (select exp_type,Sum(amount) as total_F from credit_card
where gender='F'
group by exp_type)
select c.exp_type,total_am, total_F, total_F*1.0/total_am*100 from cte c join cte2 c2
on
c.exp_type=c2.exp_type

