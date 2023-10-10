-- Zadanie 2
--Pizzeria planuje wdro¿enie programu lojalnoœciowego dla klientów którzy nigdy nie zamówili 
--pizzy z ananasem w Marcu 2015. Proszê o stworzenie tabeli z id takich zamówieñ. (przydatna 
--funkcja string_agg)

-- Zamówienia z ananasem w Marcu 2015
with pinapple_orders as(
select order_id,pizza_ingredients from [dbo].pizza_sales where left(order_date,7) = '2015-03' and  pizza_ingredients like '%Pineapple%'
)
-- Odczytuje order_id z zamówieñ z ananasem i ich nie biorê pod uwagê - wystarczy ¿e nawet jedna pizza z ananasem by³a zamówiona dla jednego zamówienia np. z innymi pizzami
-- np. dla order_id 3537 by³o zamówione kilka pizz, w tym jedna z ananasem -> nie biorê pod uwagê wiêc tego numeru id

-- Z powtórzeniami
--select order_date,string_agg(order_id,', ') as order_id_list from [dbo].pizza_sales where order_id not in (select distinct order_id from pinapple_orders) and left(order_date,7) = '2015-03' group by order_date

-- Bez powtórzeñ
select 
	order_date, 
	string_agg( order_id,', ') as order_id_list
from (
	select distinct order_id,order_date 
	from [dbo].pizza_sales 
	where order_id not in (select order_id from pinapple_orders) and left(order_date,7) = '2015-03'
) as unique_orders
group by order_date
