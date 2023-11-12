--8- during weekends which city has highest total spend to total no of transcations ratio 
select top 1 city, sum(amount)*1.0/count(*) as ratio from credit_card
where datepart(weekday,date) in (1,7)
group by city
order by ratio desc


