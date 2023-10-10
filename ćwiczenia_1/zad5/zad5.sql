--Zadanie 5
--Proszê przygotowaæ tabelê z list¹ pokazuj¹c¹ liczbê zamówieñ dla danej pe³nej godziny w 
--dniu 1 Stycznia 2015 tak jak poni¿ej (proszê zaokr¹glaæ do pe³nych godzin w dó³ tj. 11:59 
--bêdzie 11):

with sum_order as(
select order_id,total_price,order_date,order_time from [dbo].pizza_sales where left(order_date,10) = '2015-01-01' group by order_id,total_price,order_date,order_time
)
--select * from sum_order

select
	count(order_id) as order_count,
	order_date,
    datepart(hour, order_time) as hour
from
    sum_order
group by
    datepart(hour, order_time),order_date
order by
    hour;
