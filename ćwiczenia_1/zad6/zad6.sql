--Zadanie 6
--Prosz� wykona� tabel� z popularno�ci� danych rodzaj�w pizzy w miesi�cu Styczniu 2015. Ma 
--ona pokazywa� ilo�� sprzedanych rodzaj�w pizz bez rozr�nienia na jej rozmiary. Tabela ma 
--zawiera� nazw� ka�dej pizzy oraz jej kategori�.

select 
	pizza_name,count(pizza_name) as ilosc_sprzedanych,pizza_category 
from 
	dbo.pizza_sales 
where 
	left(order_date,7)='2015-01' 
group by 
	pizza_name,pizza_category 
order by 
	count(pizza_name) desc
