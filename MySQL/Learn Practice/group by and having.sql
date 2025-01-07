USE CLASSICMODELS;

show tables;

select orderNumber, sum(quantityOrdered * priceEach) as total
from orderdetails
group by orderNumber;

SELECT customerNumber, COUNT(*) AS number_of_payments
FROM payments
GROUP BY customerNumber;

SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM orderdetails 
GROUP BY ordernumber 
HAVING total > 1000;

# ================================ HAVING, where, group by =========================================
#1
select productName, count(*) as total_products, avg(buyPrice) as "average_buyPrice($)", productline
from products
where quantityInStock < 100
group by productLine
having avg(buyPrice) > 30;

select productName from products;

#2
select productVendor, sum(quantityInStock) as total_Quantity, sum(MSRP) as total_MSRP
from products
where productScale = "1:18"
group by productVendor
having sum(MSRP) > 100000;

