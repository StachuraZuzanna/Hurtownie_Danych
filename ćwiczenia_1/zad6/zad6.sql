--Zadanie 6
--Proszê wykonaæ tabelê z popularnoœci¹ danych rodzajów pizzy w miesi¹cu Styczniu 2015. Ma 
--ona pokazywaæ iloœæ sprzedanych rodzajów pizz bez rozró¿nienia na jej rozmiary. Tabela ma 
--zawieraæ nazwê ka¿dej pizzy oraz jej kategoriê.

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
