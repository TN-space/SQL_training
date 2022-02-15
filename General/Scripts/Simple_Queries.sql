use classicmodels;

/* 1. Write a query to display the name, product line, and buy price of all products.
 * The output columns should display as “Name”, “Product Line”, and “Buy Price”.
 * The output should display the most expensive items first.*/
SELECT productName as `Name`, productLine as `Product Line`, buyPrice as `Buy Price`
from products
Order by buyPrice desc;

/*2. Write a query to display the first name, last name, and city for all customers from Germany. 
 *Columns should display as “First Name”, “Last Name”, and “City”.
 *The output should be sorted by the customer’s last name (ascending).*/
SELECT contactFirstName as `First Name`, contactLastName as `Last Name`, city as `City`
from customers
WHERE country = 'Germany'
ORDER by contactLastName ASC;

/*3. Write a query to display each of the unique values of the status field in the orders table.
 *The output should be sorted alphabetically increasing.
 *Hint: the output should show exactly 6 rows.*/
SELECT DISTINCT status 
from orders
order by status ASC;

/*4. Select all fields from the payments table for payments made on or after January 1, 2005.
 *Output should be sorted by increasing payment date.*/
SELECT * 
FROM payments
WHERE paymentDate >= '2005-01-01'
ORDER by paymentDate asc;

/*5. Write a query to display all Last Name, First Name, Email and Job Title of all employees working out of the San Francisco office.
 *Output should be sorted by last name.*/
-- SELECT * FROM offices ;
SELECT lastName as `Last Name`, firstName as `First Name`, email as `Email`, jobTitle as `Job Title`
FROM employees
WHERE officeCode = 1
ORDER by lastName ASC;

/*6. Write a query to display the Name, Product Line, Scale, and Vendor of all of the car products – both classic and vintage.
 *The output should display all vintage cars first (sorted alphabetically by name),
 *and all classic cars last (also sorted alphabetically by name).*/
SELECT SUBSTRING(productName, 6) as `Name`, productLine as `Product Line`, productScale as `Scale`, productVendor as `Vendor` 
FROM products
WHERE productLine = 'classic cars' or productLine = 'Vintage Cars'
order by productLine DESC, 
Name asc;