use classicmodels;

-- 1. Products by Vendor: Which product vendors have an average MSRP greater than $100?
select productVendor, avg(msrp) as average_msrp from products
group by ProductVendor
having avg(msrp) > 100;

-- 2. Products by Scale: Which product scales have a total quantity in stock of more than 500 units?
select productScale, sum(quantityINStock) as total_quantity
from products
GROUP BY productScale
HAVING SUM(quantityInStock) > 500;

-- 3. Product Lines: Which product lines have an average buy price greater than $50?
select productline, avg(buyPrice) as average_buyprice 
from products
group by productline
having avg(buyPrice) > 50;

-- 4. Offices by Country: Which countries have more than 3 offices?
select country, count(*) as no_of_offices
from offices
group by country
having count(*) > 3;

-- 5. Employees by Job Title: Which job titles have more than 5 employees?
select jobTitle, count(*) as no_of_employees 
from employees
group by jobTitle
having count(*) > 5;

-- 6. Customers by Country: Which countries have a total credit limit exceeding $500,000?
select country, sum(creditlimit) as total_creditLimit
from customers
group by country
having sum(creditlimit) > 500000;

-- 7. Payments by Customer: Which customers have made total payments exceeding $10,000?
select customerNumber,sum(amount) as TotalPayment from payments
group by customerNumber
having sum(amount) > 10000;

-- 8. Orders by Status: Which order statuses have more than 100 orders?
SELECT status, COUNT(*) AS OrderCount
FROM orders
GROUP BY status
HAVING COUNT(*) > 100;

-- 9. Orders by Date: Which order dates have more than 10 orders?
SELECT orderDate, COUNT(*) AS OrderCount
FROM orders
GROUP BY orderDate
HAVING COUNT(*) > 10;

-- 10. OrderDetails by Product: Which products have a total quantity ordered of more than 200 units?
SELECT productCode
FROM orderdetails
GROUP BY productCode
HAVING SUM(quantityOrdered) > 200;

-- 11. Employees by Office: Which offices have more than 10 employees?
SELECT officeCode, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY officeCode
HAVING COUNT(*) > 10;

-- 12. Customers by State: Which states have a total number of customers greater than 50?
SELECT state, COUNT(*) AS CustomerCount
FROM customers
GROUP BY state
HAVING COUNT(*) > 50;

-- 13. Orders by Customer: Which customers have placed more than 20 orders?
SELECT customerNumber, COUNT(*) AS OrderCount
FROM orders
GROUP BY customerNumber
HAVING COUNT(*) > 20;

-- 14. OrderDetails by Order: Which orders have a total quantity ordered greater than 100 units?
SELECT orderNumber, SUM(quantityOrdered) AS TotalQuantity
FROM orderdetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered) > 100;

-- 15. Payments by Date: Which payment dates have a total amount paid exceeding $5,000?
SELECT paymentDate, SUM(amount) AS TotalPayment
FROM payments
GROUP BY paymentDate
HAVING SUM(amount) > 5000;

-- 16. Product Lines by Description Length: Which product lines have an average product description
-- length greater than 200 characters?
SELECT productLine, AVG(LENGTH(textDescription)) AS AverageDescriptionLength
FROM productlines
GROUP BY productLine
HAVING AVG(LENGTH(textDescription)) > 200;

-- 17. Product Vendors by Buy Price: Which product vendors have an average buy price greater than
-- $75?
SELECT productVendor, AVG(buyPrice) AS AverageBuyPrice
FROM products
GROUP BY productVendor
HAVING AVG(buyPrice) > 75;

-- 18. Customers by City: Which cities have more than 20 customers?
SELECT city, COUNT(*) AS CustomerCount
FROM customers
GROUP BY city
HAVING COUNT(*) > 20;

-- 19. Employees by Supervisor: Which supervisors (reportsTo) have more than 5 direct reports?
SELECT reportsTo, COUNT(*) AS ReportCount
FROM employees
WHERE reportsTo IS NOT NULL
GROUP BY reportsTo
HAVING COUNT(*) > 5;

-- 20. Products by Quantity in Stock: Which products have an average quantity in stock greater than 
-- 100 units?
SELECT productCode, AVG(quantityInStock) AS AverageQuantityInStock
FROM products
GROUP BY productCode
HAVING AVG(quantityInStock) > 100;
