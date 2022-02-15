use Banking;

/*1. For each product, show the product name "Product" and the product type name "Type".*/
SELECT NAME as `Product`, PRODUCT_TYPE_CD as `Type`
from product;

/*2. For each branch, list the branch name and city, 
 *plus the last name and title of each employee who works in that branch.*/
-- SELECT * from branch as b ;
-- SELECT * from employee as e;
SELECT b.name as `Name`, b.city as `City`, e.last_name as `Last Name`, e.title as `Title` 
from branch as b
join employee as e
on b.BRANCH_ID = e.ASSIGNED_BRANCH_ID;

-- 3. Show a list of each unique employee title.
SELECT DISTINCT title as `Title` from employee;

/*4. Show the last name and title of each employee, 
 *along with the last name and title of that employee's boss.*/
-- SELECT * from employee as e;
SELECT e.last_name as `Last Name`, e.title as `Title`, s.LAST_NAME as `Supervisor Last Name`, s.title as `Supervisor Title` 
from employee as e
left join employee as s
on e.SUPERIOR_EMP_ID = s.EMP_ID;

/*5. For each account, show the name of the account's product,
 *the available balance, and the customer's last name.*/
-- SELECT * from individual i ;
SELECT p.NAME as `Name`, a.avail_balance as `Available Balance`, i.last_name as `Customer Last Name`
from account as a
join product as p on p.PRODUCT_CD = a.product_CD 
join individual as i on a.CUST_ID = i.CUST_ID;

/*6. List all account transaction details for individual customers whose last name starts with 'T'.*/
-- SELECT * from acc_transaction at2 ;
SELECT atr.*
FROM acc_transaction as atr
join account as a on a.ACCOUNT_ID = atr.ACCOUNT_ID 
join individual as i on a.CUST_ID = i.CUST_ID
where i.LAST_NAME LIKE 't%';



