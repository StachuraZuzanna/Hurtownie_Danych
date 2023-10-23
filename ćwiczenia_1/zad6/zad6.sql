--Zadanie 6
--Proszę wykonać tabelę z popularnością danych rodzajów pizzy w miesiącu Styczniu 2015. Ma 
--ona pokazywać ilość sprzedanych rodzajów pizz bez rozróżnienia na jej rozmiary. Tabela ma 
--zawierać nazwę każdej pizzy oraz jej kategorię.

select 
	pizza_name,sum(quantity) as ilosc_sprzedanych,pizza_category 
from 
	dbo.pizza_sales 
where 
	left(order_date,7)='2015-01' 
group by 
	pizza_name,pizza_category 
order by 
	sum(quantity) desc
