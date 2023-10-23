--Zadanie 4
--Proszę stworzyć tabelę która pokaże kwotę każdego zamówienia w jednej kolumnie wraz z id 
--zamówienia w drugiej, oraz średniej kwocie zamówienia dla każdego miesiąca w formacie jak 
--poniżej (w tym przypadku Common Table Expressions mogą okazać się szczególnie przydatne)

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
--select * from order_sum  --> order_id,order_amount, numer miesiąca, order_date
ma as (
select 
	miesiac, 
	format(avg(cast(order_amount as float)),'n6') as average_month_amount
from order_sum
group by miesiac 
)
--select * from month_avg  --> numer miesiąca, średnia dla miesiąca

select 
	order_sum.order_id,
	order_sum.order_amount,
	ma.average_month_amount,
	order_sum.order_date 
from 
	order_sum
inner join
	ma on order_sum.miesiac = ma.miesiac







