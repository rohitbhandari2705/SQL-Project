--2- write a query to print highest spend month and amount spent in that month for each card type

with cte as(select card_type, sum(amount) as total, year(date) as year, datename(month,date) as month from credit_card
group by card_type, year(date) , datename(month,date))
select * from (select *,rank() over(partition by card_type order by total desc) as rn from cte) a
where rn=1;