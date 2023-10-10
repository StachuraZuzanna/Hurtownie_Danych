--Zadanie 7 
--Prosz� przygotowa� tabel� kt�ra zobrazuje popularno�� ka�dego rozmiaru pizzy w miesi�cu 
--Lutym oraz Marcu 2015 w formacie zbli�onym do tego poni�szego
select 
	pizza_size,count(pizza_size) as size_count
from 
	dbo.pizza_sales 
where 
	left(order_date,7)='2015-01'  or left(order_date,7) = '2015-03'
group by 
	pizza_size
order by 
	count(pizza_size) desc
