 --3- write a query to print the transaction details(all columns from the table) for each card type when
--it reaches a cumulative of 1000000 total spends(We should have 4 rows in the o/p one for each card type)
EXEC sp_rename 'credit_card.index', 'index_no','column';

with cte as (select *,sum(amount) over(partition by card_type order by date,index_no) as total_spend
from credit_card)
,cte2 as (select *, dense_rank() over(partition by card_type order by total_spend) as rn from cte
where total_spend > 1000000)
select * from cte2
where rn=1


