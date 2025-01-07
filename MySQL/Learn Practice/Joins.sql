create database test_joins;

use test_joins;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES
    (1, 'John', 101),
    (2, 'Alice', 102),
    (3, 'Bob', 103),
    (4, 'Carol', NULL);
    
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (101, 'HR'),
    (102, 'IT'),
    (104, 'Finance');
    
-- ================================= INNER JOIN =====================================
select e.employeeID, e.employeeName, d.departmentID, d.DepartmentName
from employees e
inner join departments d
on
e.departmentID = d.departmentID;

-- ============= INNER JOIN and JOIN is interchangable, does the same work
select *
from employees e
join departments d 
on e.DepartmentID = D.DepartmentID;

-- ================================= LEFT JOIN =================================
select *
from employees e
left join departments d
on e.departmentID = d.DepartmentID;

select * from employees;
select * from departments;

-- ================================= RIGHT JOIN ================================
select *
from employees e
right join departments d on e.DepartmentID = D.DepartmentID;

-- ==================================== INNER JOIN Clause Question =================================
use classicmodels;

-- 1
select c.customerName, o.orderNumber
from customers c
inner join orders o
on c.customerNumber = o.customerNumber;

-- 2
select concat(e.firstName,' ',e.lastName) as employee_name, f.city
from employees e
inner join offices f
on e.officeCode = f.officeCode;
