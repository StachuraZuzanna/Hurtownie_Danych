--Zadanie 1
--Na podstawie dostarczonych danych proszê wyznaczyæ œredni¹ kwotê 
--zamówienia w dniu 18 Lutego 2015.

--jedno order_id to jedno zamówienie, powtarza siê poniewa¿ mo¿na kilka pizz zamówiæ dla jednego zamówienia
-- trzeba zsumowaæ wszystkie pizze (ich kwoty) które maj¹ takie samo order_id ¿eby dostaæ ca³¹ kwotê zamówienia


with sum_order as(
select order_id,sum(total_price) as sum_total_price from [dbo].pizza_sales where order_date='2015-02-18' group by order_id
)
--select * from sum_order
select avg(sum_total_price) as average_sum_order from sum_order

