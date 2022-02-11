use classicmodels;
select * from employees;
SELECT * from customers;
SELECT count(*) from orders;

select * from offices;

INSERT into offices values('8', 'Plano', '1231331111', '123 street', null,'MA','USA','01232','NA');

SELECT * from offices where officeCode = '8';

DELETE from offices where officeCode = '8';

INSERT into offices (`officeCode`,`city`, `phone`, `addressLine1`,`country`, `postalCode`, `territory`)
values('8', 'TUn', '1231331111', '123 street','USA','01232','NA');
