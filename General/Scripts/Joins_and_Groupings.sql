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
