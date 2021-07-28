use project;

/*Trigger 1 verification*/
insert into `order_details` (ORDER_DETAILS_ID, ORDER_ID, PRODUCT_ID, ORDER_QTY, UNIT_PRICE, SUB_TOTAL) values
(91, 30, 1212, 1, 666, 666);
select product_qty from product
where product_id=1212;

/*Trigger 2 verification*/

update product p
set p.unit_price = 252
where p.product_id = 1322;

Select * from product_log;

/*EXERCISE G 1*/

select c.First_name,c.Last_name,o.Order_date,p.Product_name
from customer as c, `order` as o, product as p
where c.customer_id = o.customer_id
AND o.order_date between '2019-01-01' and '2020-04-01'
order by o.order_date;

/*EXERCISE G 2*/

SELECT 
    c.Customer_id,
    c.First_name,
	c.Last_name, 
    round(sum(o.Total)) AS Total_amount
FROM customer as c, `order` as o
where c.customer_id = o.customer_id
GROUP BY c.customer_id 
ORDER BY Total_amount DESC
LIMIT 3;

/*EXERCISE G 3*/
select min(o.order_date) as Initial_Data, max(o.order_date) as Last_Data, round(sum(o.total),2) as `total_sales (euros)`, round(sum(o.total)/ (timestampdiff(year,min(o.order_date), max(o.order_date))+1),2) as `yearly_avg_sales (euros)`, round(sum(o.total)/ (timestampdiff(month,min(o.order_date), max(o.order_date))+1),2) as `monthly_avg_sales (euros)`
from `order` o;

/*EXERCISE G 4*/
select o.city_s as city, round(sum(o.total),2) as `total_sales (euros)`
from `order`o
group by o.city_s;

select o.country_s as country, round(sum(o.total),2) as `total_sales (euros)`
from `order`o
group by o.country_s;

/*Exercise G 5*/
SELECT CITY_S AS sales_location
FROM `order` AS o
LEFT JOIN `order_details` AS od ON od.order_id = o.order_id
LEFT JOIN `product` AS p ON p.product_id = od.product_id
LEFT JOIN `review` AS r ON r.product_id = p.product_id
GROUP BY sales_location;

/*Extra queries */
/*Most frequent costumer*/    
SELECT `customer_id`, COUNT(customer_id) AS most_frequent
FROM `order`
GROUP BY `customer_id`
ORDER BY most_frequent DESC
LIMIT 10;

/*Higher order*/
select MAX(TOTAL) as higher_order from `order`;

/*Avg product ratings*/
select product_id, AVG(REVIEW_RATING) as average_performance 
from `review`
group by product_id
order by average_performance desc;

/*EXERCISE H Invoice head and totals- Verification*/
select * from `invoice_total`;

/*EXERCISE H Invoice with details* - Verification*/
select * from `invoice_details`;



 
