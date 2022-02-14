use Banking;

-- 1
SELECT NAME as `Product`, PRODUCT_TYPE_CD as `Type`
from product;

-- 2
-- SELECT * from branch as b ;
-- SELECT * from employee as e;
SELECT b.name as `Name`, b.city as `City`, e.last_name as `Last Name`, e.title as `Title` 
from branch as b
join employee as e
on b.BRANCH_ID = e.ASSIGNED_BRANCH_ID;

-- 3
SELECT DISTINCT title as `Title` from employee;

-- 4
-- SELECT * from employee as e;
SELECT e.last_name as `Last Name`, e.title as `Title`, s.LAST_NAME as `Supervisor Last Name`, s.title as `Supervisor Title` 
from employee as e
left join employee as s
on e.SUPERIOR_EMP_ID = s.EMP_ID;

-- 5
-- SELECT * from individual i ;
SELECT p.NAME as `Name`, a.avail_balance as `Available Balance`, i.last_name as `Customer Last Name`
from account as a
join product as p on p.PRODUCT_CD = a.product_CD 
join individual as i on a.CUST_ID = i.CUST_ID;

-- 6 
-- SELECT * from acc_transaction at2 ;
SELECT atr.*
FROM acc_transaction as atr
join account as a on a.ACCOUNT_ID = atr.ACCOUNT_ID 
join individual as i on a.CUST_ID = i.CUST_ID
where i.LAST_NAME LIKE 't%';



