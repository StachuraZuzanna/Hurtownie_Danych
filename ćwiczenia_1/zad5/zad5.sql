--Zadanie 5
--Prosz� przygotowa� tabel� z list� pokazuj�c� liczb� zam�wie� dla danej pe�nej godziny w 
--dniu 1 Stycznia 2015 tak jak poni�ej (prosz� zaokr�gla� do pe�nych godzin w d� tj. 11:59 
--b�dzie 11):

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
