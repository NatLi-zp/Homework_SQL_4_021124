-- homework 021124
-- 1 уровень сложности: Создать БД Shop, используя следующие данные: https://github.com/NelliEfr/MySQL_databases/blob/main/shop.txt

use shop;
select * from customers;
select * from orders;
select * from sellers;

-- Определить какие из покупок были совершены в июне
select * from orders
where month(ODATE)=6;

-- Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года
select * from orders
where ODATE between '2022-04-10' and '2022-05-10';

-- Определить сколько покупок было совершено в марте
select count(*) 
from orders
where month(ODATE)=3;

-- Определить среднюю стоимость покупок в марте
select avg(amt) 
from orders
where month(ODATE)=3;

-- Выведите минимальный рейтинг(rating) покупателя среди сделавших заказ в апреле 2022 года.
select min(RATING)
from orders t1
left join customers t2
on t1.CUST_ID = t2.CUST_ID
where month(ODATE)=4 and year(ODATE)=2022; 

-- Выведите продавцов, которые оформили заказ на наибольшую сумму в период с 1 марта по 1 май 2022 года.
-- Вывести : sell_id, amt
select t1.SELL_ID, t1.amt, t1.ODATE, T2.SNAME
from orders t1
left join sellers t2
on t1.SELL_ID = t2.SELL_ID
where t1.ODATE between '2022-03-01' and '2022-05-01' and t1.amt = 
(select max(amt) from orders where ODATE between '2022-03-01' and '2022-05-01');

-- Определить какие покупки были совершены во вторник
select * , dayofweek(ODATE) , dayname(ODATE)
from orders
where dayofweek(ODATE) = 3;