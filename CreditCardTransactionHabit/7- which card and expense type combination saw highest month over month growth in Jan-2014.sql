--7- which card and expense type combination saw highest month over month growth in Jan-2014

with cte as (
select card_type,Exp_type, datepart(year,date) yt,datepart(month,date) as mt, sum(amount) as am from credit_card
group by card_type,Exp_type,datepart(year,date),datepart(month,date) )
select top 1 *, (am-prev_mont_spend) as mom_growth 
from (
select *, lag(am,1) over(partition by card_type,exp_type order by yt, mt asc)  as prev_mont_spend 
from cte) A
where prev_mont_spend is not null and yt=2014 and mt=1
order by mom_growth desc;


