use classicmodels;

/*1. Write a query to display each customer’s name (as “Customer Name”) 
 *alongside the name of the employee who is responsible for that customer’s orders. 
 *The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. 
 *The output should be sorted alphabetically by customer name.*/
-- SELECT * FROM customers;
-- SELECT * FROM employees;
SELECT c.customerName as `Customer Name`, concat(e.lastName, ', ', e.firstName) as `Sales Rep`
from customers as c
join employees as e
on c.salesRepEmployeeNumber = e.employeeNumber
ORDER by c.customerName ASC;

/*2. Determine which products are most popular with our customers. 
 *For each product, list the total quantity ordered along with the total sale generated 
 *(total quantity ordered * priceEach) for that product. 
 *The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. 
 *List the products by Total Sale descending.*/
-- SELECT * FROM products;
-- SELECT * FROM orderdetails;
SELECT p.productName as `Product Name`, od.quantityOrdered as `Total # Ordered`, od.quantityOrdered * od.priceEach as `Total Sale`
from orderdetails as od
join products as p
on od.productCode = p.productCode 
ORDER by `Total Sale` desc; 

/*3. Write a query which lists order status and the # of orders with that status. 
 *Column headers should be “Order Status” and “# Orders”.
 *Sort alphabetically by status.*/
-- SELECT * FROM orderdetails;
-- SELECT * FROM orders;
SELECT status as `Order Status`, count(*) as `# Orders`
from orders
GROUP by status 
ORDER by `Order Status` ASC;

/*4. Write a query to list, for each product line, the total # of products sold from that product line.
 *The first column should be “Product Line” and the second should be “# Sold”.\
 *Order by the second column descending.*/
-- SELECT * from productlines p ;
-- SELECT * from products p2 ;
-- SELECT * from orderdetails o ;
SELECT p.productLine as `Product Line`, sum(quantityOrdered) as `# Sold`
FROM products as p 
join orderdetails as od on p.productCode = od.productCode 
GROUP by `Product Line`
ORDER by `# Sold` desc;

/*5. For each employee who represents customers, output the total # of orders that employee’s customers have placed
 *alongside the total sale amount of those orders. The employee name should be output as a single column named “Sales Rep”
 *formatted as “lastName, firstName”. The second column should be titled “# Orders” and the third should be “Total Sales”.
 *Sort the output by Total Sales descending. Only (and all) employees with the job title ‘Sales Rep’ should be included in the output, 
 *and if the employee made no sales the Total Sales should display as “0.00”.*/
-- SELECT * from customers c ;
-- SELECT * from employees e ;
-- SELECT * from orders o ;
-- SELECT * from orderdetails o ;
SELECT concat(e.lastName,', ',e.firstName) as `Sales Rep`, if(od.quantityOrdered is null, '0.00', sum(od.quantityOrdered)) as `# Orders`, if(od.quantityOrdered is null, '0.00', sum(od.quantityOrdered) * od.priceEach) as `Total Sales` -- , c.customerNumber, c.customerNumber, o.orderNumber,  
FROM employees e 
left join customers c on e.employeeNumber = c.salesRepEmployeeNumber
left join orders o on  c.customerNumber = o.customerNumber 
left join orderdetails od on o.orderNumber = od.orderNumber
where e.jobTitle = 'Sales Rep'
GROUP by e.employeeNumber  
ORDER by `Total Sales` desc;

/*6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. 
 *Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month. 
 *The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. 
 *Values in the third column should be formatted as numbers with 	two decimals – for example: 694,292.68.*/
-- SELECT * from payments p order by year(paymentDate), month(paymentDate);
SELECT monthname(paymentDate) as `Month`, year(paymentDate) as `Year`, FORMAT(sum(amount), 2) as `Payments Received`  
from payments p
group by year(paymentDate), month(paymentDate)
order by year(paymentDate), month(paymentDate);




