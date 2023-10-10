-- Zadanie 3
--Pizzeria planuje nagrodziæ klientów o najwy¿szych zamówieniach bonami kwotowymi. Proszê 
--przygotowaæ tabelê z id 10 najwiêkszych zamówieñ dla lutego wraz z ich kwot¹ przy u¿yciu funkcji rank () over.

with sum_order as(
select order_id, sum(total_price) as total_amount from [dbo].pizza_sales where left(order_date,7) = '2015-02' group by order_id
)
select 
TOP 10
rank() over (
order by total_amount desc ) rn,order_id,total_amount from sum_order