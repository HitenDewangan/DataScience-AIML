use classicmodels;

show tables;

-- ============================ GROUP BY QUESTIONs =======================================
-- 1 Product Lines: How many products are there in each product line?
select productLine , count(productCode) as no_of_products
from products
group by productLine;

-- 2 Product Scale: What is the average quantity in stock for each product scale?
select productscale, avg(quantityInStock) as avg_quantity 
from products
group by productscale;

-- 3 Product Vendors: What is the total value of products (buyPrice * quantityInStock) for each product
-- vendor?
select productVendor, (buyPrice*quantityInStock) as total_value_of_product
from products
group by productVendor;

-- 4 Offices: How many employees are there in each office?
select officeCode, count(employeeNumber) as no_of_employees
from employees
group by officeCode;

-- 5 Employees' Job Titles: How many employees hold each job title?
select jobTitle, count(employeeNumber)
from employees
group by jobTitle;

-- 6 Customers by Country: How many customers are there in each country?
select country, count(customerNumber)
from customers
group by country;

-- 7 Payments: What is the total payment amount made by each customer?
select customerNumber, sum(amount) as total_payment
from payments
group by customerNumber;

-- 8 Orders: How many orders have been placed in each status?
select status, count(orderNumber)
from orders
group by status;

-- 9 Order Dates: How many orders were placed on each date?
select orderDate, count(orderNumber)
from orders
group by orderDate;

-- 10 Order Details: What is the total quantity ordered for each product code?
SELECT Productcode, SUM(quantityOrdered) AS TotalQuantity
FROM orderdetails
GROUP BY Productcode;

-- 11 Products by Name: What is the highest price (buyPrice) of each product name?
select productName, max(buyPrice)
from products
group by productName;

-- 12. Product Lines: What is the average buy price of products in each product line?
select productLine, avg(buyPrice) 
from products
group by productLine;

-- 13. Product Description Length: What is the average length of the product description for each
-- product scale
select productScale, avg(length(productDescription)) as avgDescriptionLength
from products
group by productScale;

-- 14. Quantity in Stock: What is the maximum quantity in stock for each product line?
select productLine, max(quantityInStock) as MaxQuantityInStock
from products
group by productLine;

-- 15. Product Vendor: What is the average MSRP for products from each vendor?
select productVendor, avg(msrp)
from products
group by productVendor;

-- 16. Offices by Country: How many offices are there in each country?
select country, count(officeCode) as NumberOfOffices
from offices
group by country;

-- 17. Office Postal Code: How many offices have the same postal code?
select postalCode, count(officeCode)
from offices
group by postalCode;

-- 18. Employees by Office Code: What is the average length of the last names of employees in each
-- office?
select officeCode, avg(length(lastName)) as AverageLastnameLength
from employees
group by officeCode;

-- 19. Employee Job Title: What is the average number of characters in job titles for each office?
select officeCode, avg(length(jobTitle)) as avg_character_Jobtitle
from employees
group by  officeCode;

-- 20. Employees by Email Domain: How many employees share the same email domain?
select SUBSTRING_INDEX(Email, '@', -1) as Email_Domain, count(employeeNumber)
from employees
group by Email_Domain;

-- 21. Customer City: How many customers are there in each city?
select city, count(customerNumber) as noOfCustomers
from customers
group by city;

-- 22. Customer State: What is the total credit limit for customers in each state?
SELECT state, SUM(creditLimit) AS TotalCreditLimit
FROM customers
GROUP BY state;

-- 23. Customer Sales Rep: What is the average credit limit for customers of each sales
-- representative?
SELECT salesRepEmployeeNumber, AVG(creditLimit) AS AverageCreditLimit
FROM customers
GROUP BY salesRepEmployeeNumber;

-- 24. Customer Phone Prefix: How many customers have phone numbers starting with the same
-- prefix?
SELECT LEFT(phone, 4) AS PhonePrefix, COUNT(*) AS CustomerCount
FROM customers
GROUP BY LEFT(phone, 4);

-- 25. Payments by Date: What is the total payment amount made on each payment date?
SELECT paymentDate, SUM(amount) AS TotalPayment
FROM payments
GROUP BY paymentDate;

-- 26. Payments by Amount Range: How many payments fall into specific amount ranges (e.g., 0-100,
-- 101-500, etc.)?
SELECT 
  CASE
    WHEN amount BETWEEN 0 AND 10000 THEN '0-10000'
    WHEN amount BETWEEN 10001 AND 50000 THEN '10001-50000'
    when amount BETWEEN 50001 AND 100000 THEN '50001-100000'
    ELSE '100001-130000'
  END AS AmountRange,
  COUNT(*) AS PaymentCount
FROM payments
GROUP BY AmountRange
order by amount;

-- 27. Orders by Month: How many orders were placed in each month?
select month(orderDate) as month, count(*) as no_of_orders_placed
from orders
group by month(orderDate);

-- 28. Orders by Year: How many orders were placed in each year?
select year(orderDate) as Year, count(*) as no_of_orders_placed
from orders
group by year(orderDate);

-- 29. Orders by Shipped Date: How many orders were shipped on each date?
select shippedDate, count(*) as orderCount
from orders
where shippedDate is not NULL
group by shippedDate;

-- 30. Orders by Comments Length: What is the average length of comments in orders by status?
select status, avg(length(comments))
from orders
group by status;

-- 31. OrderDetails by Quantity Ordered: What is the average price each for different ranges of
-- quantity ordered (e.g., 1-10, 11-50, etc.)?
SELECT 
  CASE
    WHEN quantityOrdered BETWEEN 1 AND 10 THEN '1-10'
    WHEN quantityOrdered BETWEEN 11 AND 50 THEN '11-50'
    WHEN quantityOrdered BETWEEN 51 AND 100 THEN '51-100'
    ELSE '>100'
  END AS QuantityRange,
  AVG(priceEach) AS AveragePrice
FROM orderdetails
GROUP BY QuantityRange;

-- 32. OrderDetails by Order Line Number: What is the total quantity ordered for each order line
-- number?
select  orderLineNumber, sum(quantityOrdered) as totalQuantityOrdered
from orderdetails
group by orderLineNumber;

-- 33. OrderDetails by Price Range: How many order details have prices falling into specific ranges
-- (e.g., 0-50, 51-100, etc.)?
SELECT 
  CASE
    WHEN priceEach BETWEEN 0 AND 50 THEN '0-50'
    WHEN priceEach BETWEEN 51 AND 100 THEN '51-100'
    ELSE '>100'
  END AS PriceRange,
  COUNT(*) AS OrderDetailCount
FROM orderdetails
GROUP BY PriceRange;

-- 34. OrderDetails by Product Line: What is the average quantity ordered for products in each product
-- line?
SELECT p.productLine, AVG(od.quantityOrdered) AS AverageQuantity
FROM orderdetails od
INNER JOIN products p ON od.productCode = p.productCode
GROUP BY p.productLine;

-- 35. OrderDetails by Order Date: What is the total price for each order date?
SELECT o.orderDate, SUM(od.priceEach * od.quantityOrdered) AS TotalPrice
FROM orderdetails od
INNER JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY o.orderDate;

-- 36. Product Description: How many products have descriptions of different length ranges (e.g.,
-- 0-100 characters, 101-500 characters, etc.)?
SELECT
  CASE
    WHEN LENGTH(productDescription) BETWEEN 0 AND 100 THEN '0-100 characters'
    WHEN LENGTH(productDescription) BETWEEN 101 AND 500 THEN '101-500 characters'
    ELSE '>500'
  END AS DescriptionLengthRange,
  COUNT(*) AS ProductCount
FROM products
GROUP BY DescriptionLengthRange;


-- 37. Product Scale and Vendor: What is the average buy price of products for each combination of
-- product scale and vendor?
SELECT productScale, productVendor, AVG(buyPrice) AS AverageBuyPrice
FROM products
GROUP BY productScale, productVendor;

-- 38. Employee Extension: How many employees share the same extension?
SELECT extension, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY extension
HAVING COUNT(*) > 1;

-- 39. Office Territory: How many offices are there in each territory?
SELECT territory, COUNT(*) AS OfficeCount
FROM offices
GROUP BY territory;

-- 40. Customer Postal Code: How many customers have the same postal code?
SELECT postalCode, COUNT(*) AS CustomerCount
FROM customers
GROUP BY postalCode;
