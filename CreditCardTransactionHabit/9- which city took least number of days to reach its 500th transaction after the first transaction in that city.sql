--9- which city took least number of days to reach its 500th transaction after the first transaction in that city
with cte as (select city,min(date) as mindate,max(date) as maxdate from (select *, row_number() over(partition by city order by date asc) as trans_no from credit_card) as a
where trans_no in (1,500)
group by city
having count(*)=2)
select city,datediff(day,mindate,maxdate) as tran500 from cte
order by tran500 asc 