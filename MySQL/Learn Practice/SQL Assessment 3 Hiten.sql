create database Ass3;
use ass3;
-- drop database ass3;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(45) NOT NULL
);

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(225) NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE Project (
    ProjectId INT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    Department_ID INT,
    status ENUM('active', 'inactive') NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Assignment (
    Assignment_ID INT PRIMARY KEY,
    assigning_date DATETIME NOT NULL,
    Department_ID INT,
    Project_Id INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Project_Id) REFERENCES Project(ProjectId)
);

CREATE TABLE Employee_Assignment (
    Employee_EmployeeID INT,
    Assignment_Assignment_ID INT,
    PRIMARY KEY (Employee_EmployeeID, Assignment_Assignment_ID),
    FOREIGN KEY (Employee_EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (Assignment_Assignment_ID) REFERENCES Assignment(Assignment_ID)
);

# Answer & Questions : Question 1

#1
insert into Employee values
(3, "Alice Johnson");

#================================================
select * from Employee;
select * from department;
select * from project;
#==============================================

#2
insert into Department values
(1, "HR", 3);

insert into Project(ProjectId, ProjectName, Department_ID) values
(1, "Project Alpha", 1);

insert into Assignment values
(3, "2024-07-23", 1, 1);


#3
Alter table Employee
add column Email varchar(100);

#4
Alter table Department
modify Department_Name VARCHAR(255);

#5 =============================================
insert into department values
(2, "IT", 3);

select * from department;

alter table Employee
modify column salary int default 25000;

SET SQL_SAFE_UPDATES = 0; 

update Employee
set salary = 25000
where salary is null;
#============================== C O R R E C T ======================================
UPDATE Employee
set salary = salary + (0.1*salary)
WHERE EmployeeID IN (
    select EmployeeID from Department
    where department_name = "IT"
);
#====================================================================================

select * from department;

alter table department
add column salary int default 25000;

update department
set salary = salary + (0.1*salary)
where Department_Name = "IT";

select * from employee;

#================================= updating and adding cascade
-- Step 1: Find the existing foreign key constraint name
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Department' AND COLUMN_NAME = 'EmployeeID';

-- Step 2: Drop the existing foreign key constraint
ALTER TABLE Department
DROP FOREIGN KEY department_ibfk_1;

-- Step 3: Add the new foreign key constraint with cascading actions
ALTER TABLE Department
ADD CONSTRAINT fk_department_employee
FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID)
ON DELETE CASCADE
ON UPDATE CASCADE;





