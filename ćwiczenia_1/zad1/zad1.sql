--Zadanie 1
--Na podstawie dostarczonych danych prosz� wyznaczy� �redni� kwot� 
--zam�wienia w dniu 18 Lutego 2015.

--jedno order_id to jedno zam�wienie, powtarza si� poniewa� mo�na kilka pizz zam�wi� dla jednego zam�wienia
-- trzeba zsumowa� wszystkie pizze (ich kwoty) kt�re maj� takie samo order_id �eby dosta� ca�� kwot� zam�wienia


with sum_order as(
select order_id,sum(total_price) as sum_total_price from [dbo].pizza_sales where order_date='2015-02-18' group by order_id
)
--select * from sum_order
select avg(sum_total_price) as average_sum_order from sum_order

