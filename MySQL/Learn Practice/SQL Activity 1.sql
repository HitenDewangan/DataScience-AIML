create database saleDB;
use saledb;

create table productlines                 -- productlines
(productLine varchar(50) primary key,
textDescription varchar(4000),
htmlDescription mediumtext,
image mediumblob
);

CREATE TABLE products (
  productCode VARCHAR(15) PRIMARY KEY,
  productName VARCHAR(70) NOT NULL,
  productLine VARCHAR(50),
  FOREIGN KEY (productLine) REFERENCES productlines(productLine),
  productScale VARCHAR(10) NOT NULL,
  productVendor VARCHAR(50) NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock SMALLINT NOT NULL,
  buyPrice DECIMAL(10, 2) NOT NULL,
  MSRP DECIMAL(10, 2) NOT NULL
);

CREATE TABLE employees (
  employeeNumber INT PRIMARY KEY,
  lastName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  officeCode VARCHAR(10),
  FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
  reportsTo INT,
  FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber),
  jobTitle VARCHAR(50) NOT NULL
);

CREATE TABLE offices (
  officeCode VARCHAR(10) PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50) NOT NULL,
  postalCode VARCHAR(15) NOT NULL,
  territory VARCHAR(10) NOT NULL
);

CREATE TABLE customers (
  customerNumber INT PRIMARY KEY,
  customerName VARCHAR(50) NOT NULL,
  contactLastName VARCHAR(50) NOT NULL,
  contactFirstName VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50),
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50),
  postalCode VARCHAR(15),
  country VARCHAR(50) NOT NULL,
  salesRepEmployeeNumber INT,
  FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber),
  creditLimit DECIMAL(10, 2)
);

CREATE TABLE orders (
  orderNumber INT PRIMARY KEY,
  orderDate DATE NOT NULL,
  requiredDate DATE NOT NULL,
  shippedDate DATE,
  status VARCHAR(15) NOT NULL,
  comments TEXT,
  customerNumber INT,
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE orderdetails (
  orderNumber INT,
  productCode VARCHAR(15),
  quantityOrdered INT NOT NULL,
  priceEach DECIMAL(10, 2) NOT NULL,
  orderLineNumber SMALLINT NOT NULL,
  PRIMARY KEY (orderNumber, productCode),
  FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber),
  FOREIGN KEY (productCode) REFERENCES products(productCode)
);

CREATE TABLE payments (
  customerNumber INT,
  checkNumber VARCHAR(50) PRIMARY KEY,
  paymentDate DATE NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

INSERT INTO productlines (productLine, textDescription)
VALUES ('Bikes', 'Various styles'),
       ('Sports', 'Activities'),
       ('Shoes', 'Footwear needs'),
       ('Clothing', 'Apparel (not included)'),
       ('Electronics', 'Devices (not included)');

INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUES ('CA01', 'Los Angeles', '310-555-1313', '333 Ocean Boulevard', NULL, 'CA', 'USA', '90210', 'America'),
       ('NY01', 'New York', '212-555-1212', '1 Wall Street', NULL, 'NY', 'USA', '10005', 'Spain'),
       ('UK01', 'London', '020-7946-0000', '123 Oxford Street', NULL, '', 'UK', 'W1C 1AB', 'Europe'),
       ('FR01', 'Paris', '01-4567-8901', '45 Rue de Rivoli', NULL, '', 'France', '75001', 'Europe'),
       ('JP01', 'Tokyo', '81-3-1234-5678', '1-10-10 Minato-ku', NULL, '', 'Japan', '108-0070', 'Asia');

INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES ('P00001', 'Classic Bike', 'Bikes', 'Medium', 'Roadmaster', 'This classic bike is perfect for casual rides.', 15, 250.00, 350.00),
       ('P00002', 'Mountain Trail', 'Bikes', 'Medium', 'Schwinn', 'This mountain bike is ideal for off-road adventures.', 10, 300.00, 420.00),
       ('P00003', 'Tennis Racket', 'Sports', 'Small', 'Wilson', 'A high-performance tennis racket for competitive play.', 20, 75.00, 120.00),
       ('P00004', 'Running Shoes', 'Shoes', 'Medium', 'Nike', 'Lightweight running shoes for optimal performance.', 30, 60.00, 100.00),
       ('P00005', 'Baseball Bat', 'Sports', 'Medium', 'Louisville Slugger', 'A classic wooden baseball bat for serious hitters.', 12, 50.00, 80.00);

INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES (20001, 'Acme Corporation', 'Smith', 'John', '555-555-0001', '100 Main Street', 'Suite 500', 'New York', 'NY', '10001', 'USA', NULL, 50000.00),
       (20002, 'JK Tech', 'Kim', 'Soojin', '555-555-0002', '33 Elm Street', NULL, 'Los Angeles', 'CA', '90210', 'USA', NULL, 25000.00),
       (20003, 'London Supplies', 'Williams', 'David', '020-7123-4567', '22 Baker Street', NULL, 'London', '', 'W1C 1AB', 'UK', NULL, 10000.00),
       (20004, 'Parisian Delights', 'Blanc', 'Marie', '01-4456-7890', '1 Rue de la Seine', NULL, 'Paris', '', '75001', 'France', NULL, 30000.00),
       (20005, 'Tokyo Electronics', 'Tanaka', 'Shiro', '81-3-9876-5432', '4-3-2 Minato-ku', NULL, 'Tokyo', '', '108-0070', 'Japan', NULL, 40000.00);

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (10001, 'Lee', 'Susan', '1111', 'susan.lee@company.com', 'NY01', NULL, 'Sales Manager'),
       (10002, 'Johnson', 'John', '2222', 'john.johnson@company.com', 'CA01', 10001, 'Sales Representative'),
       (10003, 'Miller', 'David', '3333', 'david.miller@company.com', 'NY01', 10001, 'Sales Representative'),
       (10004, 'Williams', 'Anne', '4444', 'anne.williams@company.com', 'UK01', NULL, 'Marketing Specialist'),
       (10005, 'Jones', 'Daniel', '5555', 'daniel.jones@company.com', 'FR01', NULL, 'Customer Service Representative');

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES (1001, '2024-07-08', '2024-07-22', '2024-07-15', 'Shipped', 'Special instructions: handle with care.', 20001),
       (1002, '2024-07-09', '2024-07-25', '2024-07-18', 'Shipped', 'None', 20002),
       (1003, '2024-07-10', '2024-07-28', NULL, 'Pending', 'Customer requested expedited shipping.', 20003),
       (1004, '2024-07-11', '2024-07-29', NULL, 'Processing', 'Awaiting inventory for some items.', 20004),
       (1005, '2024-07-12', '2024-08-02', NULL, 'New', 'None', 20005);

-- Check the existing order numbers in the orders table before inserting order details.

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (1001, 'P00002', 2, 310.00, 1),  -- Order 1001 with product P00002 (assuming it exists)
       (1001, 'P00003', 1, 80.00, 2),  -- Order 1001 with product P00003 (assuming it exists)
       (1002, 'P00001', 1, 270.00, 1),  -- Order 1002 with product P00001 (assuming it exists)
       (1002, 'P00004', 3, 63.00, 2),  -- Order 1002 with product P00004 (assuming it exists)
       (1003, 'P00005', 4, 52.00, 1);  -- Order 1003 with product P00005 (assuming it exists)



INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (20001, 'CK12345', '2024-07-10', 500.00),  -- Payment from Acme Corporation
       (20002, 'JKT78901', '2024-07-11', 200.00), -- Payment from JK Tech
       (20003, 'LS34567', '2024-07-12', 150.00),  -- Payment from London Supplies
       (20004, 'PD90123', '2024-07-08', 320.00),  -- Payment from Parisian Delights
       (20005, 'TE56789', '2024-07-09', 450.00);  -- Payment from Tokyo Electronics 


show tables;

select * from productlines;
SELECT * FROM offices;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM payments;





