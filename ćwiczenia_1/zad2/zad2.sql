-- Zadanie 2
--Pizzeria planuje wdro�enie programu lojalno�ciowego dla klient�w kt�rzy nigdy nie zam�wili 
--pizzy z ananasem w Marcu 2015. Prosz� o stworzenie tabeli z id takich zam�wie�. (przydatna 
--funkcja string_agg)

-- Zam�wienia z ananasem w Marcu 2015
with pinapple_orders as(
select order_id,pizza_ingredients from [dbo].pizza_sales where left(order_date,7) = '2015-03' and  pizza_ingredients like '%Pineapple%'
)
-- Odczytuje order_id z zam�wie� z ananasem i ich nie bior� pod uwag� - wystarczy �e nawet jedna pizza z ananasem by�a zam�wiona dla jednego zam�wienia np. z innymi pizzami
-- np. dla order_id 3537 by�o zam�wione kilka pizz, w tym jedna z ananasem -> nie bior� pod uwag� wi�c tego numeru id

-- Z powt�rzeniami
--select order_date,string_agg(order_id,', ') as order_id_list from [dbo].pizza_sales where order_id not in (select distinct order_id from pinapple_orders) and left(order_date,7) = '2015-03' group by order_date

-- Bez powt�rze�
select 
	order_date, 
	string_agg( order_id,', ') as order_id_list
from (
	select distinct order_id,order_date 
	from [dbo].pizza_sales 
	where order_id not in (select order_id from pinapple_orders) and left(order_date,7) = '2015-03'
) as unique_orders
group by order_date
