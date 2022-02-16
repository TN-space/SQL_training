-- subqueries 

-- find all customers located in USA and has average credit limit greater or equals average in USA
-- show highest purchase order (quantityordered*priceeach) and product name

use classicmodels ;
select * from customers as c ;

-- average credit limit in usa
select avg(creditLimit) from customers where country = 'USA';  

-- first problem 
select customername , creditlimit
from customers
where country = 'USA' 
and creditlimit >= 
(
select avg(creditLimit) from customers where country = 'USA'
);


-- second problem 


select * from orderdetails;
select * from orders;
select * from products;
select * from customers;

-- cust id, product name, sum qxp 
-- step three highest purchase order (quantityordered*priceeach) and product name

select o.customernumber, o.ordernumber, sum(od.quantityordered*od.priceeach) as `highest purchase`
from orderdetails as od
join products as p on od.productcode = p.productcode 
join orders as o on od.ordernumber = o.ordernumber 
group by od.ordernumber
order by `highest purchase` desc;


-- combine 

select c.customernumber as `ID`, c.customername as `Customer`,sss.productname as `Product Name`, max(sss.`highest purchase`) as `Highest Purchase`
from customers as c 
join 
(
select o.customernumber,p.productname, o.ordernumber, sum(od.quantityordered*od.priceeach) as `highest purchase`
from orderdetails as od
join products as p on od.productcode = p.productcode 
join orders as o on od.ordernumber = o.ordernumber 
group by od.ordernumber
order by `highest purchase` desc
) as sss on c.customernumber = sss.customernumber 
where c.creditlimit >= 
(
select avg(creditLimit) from customers where country = 'USA'
) and c.country = 'USA'
group by c.customernumber 
order by `highest purchase` desc