use classicmodels;

-- 1
SELECT productName as `Name`, productLine as `Product Line`, buyPrice as `Buy Price`
from products
Order by buyPrice desc;

-- 2
SELECT contactFirstName as `First Name`, contactLastName as `Last Name`, city as `City`
from customers
WHERE country = 'Germany'
ORDER by contactLastName ASC;

-- 3
SELECT DISTINCT status 
from orders
order by status ASC;

-- 4
SELECT * 
FROM payments
WHERE paymentDate >= '2005-01-01'
ORDER by paymentDate asc;

-- 5
-- SELECT * FROM offices ;
SELECT lastName as `Last Name`, firstName as `First Name`, email as `Email`, jobTitle as `Job Title`
FROM employees
WHERE officeCode = 1
ORDER by lastName ASC;

-- 6
SELECT SUBSTRING(productName, 6) as `Name`, productLine as `Product Line`, productScale as `Scale`, productVendor as `Vendor` 
FROM products
WHERE productLine = 'classic cars' or productLine = 'Vintage Cars'
order by productLine DESC, 
Name asc;