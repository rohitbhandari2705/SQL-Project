--1- write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends 

with cte1 as (
select top 5 city,sum(amount) as city_wise 
from credit_card
group by city
order by city_wise desc),
cte2 as (
select sum(cast(amount as bigint)) as total_sum
from credit_card)
select city,city_wise,round(city_wise*1.0/total_sum*100,2) 
from cte1
join cte2
on 1=1