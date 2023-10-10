--Zadanie 4
--Proszê stworzyæ tabelê która poka¿e kwotê ka¿dego zamówienia w jednej kolumnie wraz z id 
--zamówienia w drugiej, oraz œredniej kwocie zamówienia dla ka¿dego miesi¹ca w formacie jak 
--poni¿ej (w tym przypadku Common Table Expressions mog¹ okazaæ siê szczególnie przydatne)

with order_sum as (
    select 
		order_id,
		format(sum(total_price),'n2') as order_amount,
		month(order_date) as miesiac,
		min(order_date) as order_date
	from 
		[dbo].pizza_sales 
	group by 
		order_id,month(order_date)
),
--select * from order_sum  --> order_id,order_amount, numer miesi¹ca, order_date

ma as (select  --month average
       month(order_date) as miesiac,
	   format(avg(total_price),'n6') as average_month_amount
from [dbo].pizza_sales
group by month(order_date)
)
--select * from month_avg  --> numer miesi¹ca, œrednia dla miesi¹ca

select 
	order_sum.order_id,
	order_sum.order_amount,
	ma.average_month_amount,
	order_sum.order_date 
from 
	order_sum
inner join
	ma on order_sum.miesiac = ma.miesiac
order by 
	order_sum.order_amount








