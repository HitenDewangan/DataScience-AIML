use classicmodels;

-- ====================================== WHERE, GROUP BY , HAVING =======================================
-- SQL Questions Involving WHERE, GROUP BY, and HAVING Clauses

-- 1. 1. List the total number of products and the average buyPrice for each productLine where
-- quantityInStock is less than 100. Only include productLine groups with an average buyPrice
-- greater than $30.
select productName, count(*) as total_products, avg(buyPrice) as "average_buyPrice($)", productline
from products
where quantityInStock < 100
group by productLine
having avg(buyPrice) > 30;

-- 2. 2. Find the total quantityInStock and the total MSRP for each productVendor where the
-- productScale is '1:18'. Only include productVendor groups with a total MSRP exceeding
-- $100,000.
select productVendor, sum(quantityInStock) as total_Quantity, sum(MSRP) as total_MSRP
from products
where productScale = "1:18"
group by productVendor
having sum(MSRP) > 100000;

-- 3. 3. Calculate the total number of products and the average MSRP for each productLine
-- where buyPrice is more than $20. Only include productLine groups with more than 5
-- products.
SELECT productLine, COUNT(*) AS ProductCount, AVG(MSRP) AS AverageMSRP
FROM products
WHERE buyPrice > 20
GROUP BY productLine
HAVING COUNT(*) > 5;

-- 4. 4. List the productLine and total quantityInStock for products where buyPrice is less than
-- $100. Only include productLine groups with total stock greater than 500.
SELECT productLine, SUM(quantityInStock) AS TotalQuantity
FROM products
WHERE buyPrice < 100
GROUP BY productLine
HAVING SUM(quantityInStock) > 500;

-- 5. 5. Retrieve the total number of products and the total quantityInStock for each
-- productScale where the MSRP is more than $50. Only include productScale groups with total
-- products greater than 10.
SELECT productScale, COUNT(*) AS ProductCount, SUM(quantityInStock) AS TotalQuantity
FROM products
WHERE MSRP > 50
GROUP BY productScale
HAVING COUNT(*) > 10;

-- 6. 6. List the total quantityOrdered and average priceEach for each productCode where
-- quantityOrdered is greater than 10. Only include productCode groups with average
-- priceEach over $100.
SELECT productCode, SUM(quantityOrdered) AS TotalQuantity, AVG(priceEach) AS AveragePriceEach
FROM orderdetails
WHERE quantityOrdered > 10
GROUP BY productCode
HAVING AVG(priceEach) > 100;

-- 7. 7. Find the total quantityOrdered and total priceEach for each orderNumber where
-- priceEach is greater than $20. Only include orderNumber groups with total quantityOrdered
-- greater than 5.
SELECT orderNumber, SUM(quantityOrdered) AS TotalQuantity, SUM(priceEach) AS TotalPriceEach
FROM orderdetails
WHERE priceEach > 20
GROUP BY orderNumber
HAVING SUM(quantityOrdered) > 5;

-- 8. 8. Calculate the total number of order lines and the average quantityOrdered for each
-- productCode where priceEach is less than $50. Only include productCode groups with more
-- than 10 order lines.
SELECT productCode, COUNT(*) AS OrderLineCount, AVG(quantityOrdered) AS AverageQuantityOrdered
FROM orderdetails
WHERE priceEach < 50
GROUP BY productCode
HAVING COUNT(*) > 10;

-- 9. 9. Retrieve the total quantityOrdered and total priceEach for each orderNumber where
-- quantityOrdered is more than 20. Only include orderNumber groups with total priceEach
-- exceeding $1,000.
SELECT orderNumber, SUM(quantityOrdered) AS TotalQuantity, SUM(priceEach) AS TotalPriceEach
FROM orderdetails
WHERE quantityOrdered > 20
GROUP BY orderNumber
HAVING SUM(priceEach) > 1000;

-- 10. 10. List the total number of products and the total priceEach for each productCode where
-- quantityOrdered is less than 5. Only include productCode groups with total priceEach
-- greater than $200.
SELECT productCode, COUNT(*) AS ProductCount, SUM(priceEach) AS TotalPriceEach
FROM orderdetails
WHERE quantityOrdered < 5
GROUP BY productCode
HAVING SUM(priceEach) > 200;

-- 11. 11. List the total number of customers and the average creditLimit for each country where
-- state is 'CA'. Only include country groups with more than 5 customers.
SELECT country, COUNT(*) AS CustomerCount, AVG(creditLimit) AS AverageCreditLimit
FROM customers
WHERE state = 'CA'
GROUP BY country
HAVING COUNT(*) > 5;


-- 12. 12. Find the total number of customers and the total creditLimit for each state where the
-- country is 'USA'. Only include state groups with total creditLimit over $100,000.
SELECT state, COUNT(*) AS CustomerCount, SUM(creditLimit) AS TotalCreditLimit
FROM customers
WHERE country = 'USA'
GROUP BY state
HAVING SUM(creditLimit) > 100000;


-- 13. 13. Calculate the total number of customers and the average creditLimit for each
-- salesRepEmployeeNumber where creditLimit is more than $50,000. Only include
-- salesRepEmployeeNumber groups with more than 10 customers.
SELECT salesRepEmployeeNumber, COUNT(*) AS CustomerCount, AVG(creditLimit) AS AverageCreditLimit
FROM customers
WHERE creditLimit > 50000
GROUP BY salesRepEmployeeNumber
HAVING COUNT(*) > 10;


-- 14. 14. List the total number of customers and the total creditLimit for each state where the
-- postalCode starts with '9'. Only include state groups with more than 3 customers.
SELECT state, COUNT(*) AS CustomerCount, SUM(creditLimit) AS TotalCreditLimit
FROM customers
WHERE postalCode LIKE '9%'
GROUP BY state
HAVING COUNT(*) > 3;

-- 15. 15. Retrieve the total number of customers and the average creditLimit for each country
-- where creditLimit is less than $50,000. Only include country groups with an average
-- creditLimit greater than $30,000.
SELECT country, COUNT(*) AS CustomerCount, AVG(creditLimit) AS AverageCreditLimit
FROM customers
WHERE creditLimit < 50000
GROUP BY country
HAVING AVG(creditLimit) > 30000;

-- 16. 16. List the total number of orders and the average orderDate for each customerNumber
-- where the status is 'Shipped'. Only include customerNumber groups with more than 5 orders.
SELECT customerNumber, COUNT(*) AS OrderCount, AVG(orderDate) AS AverageOrderDate
FROM orders
WHERE status = 'Shipped'
GROUP BY customerNumber
HAVING COUNT(*) > 5;
