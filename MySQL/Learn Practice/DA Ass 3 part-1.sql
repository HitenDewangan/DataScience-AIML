use ass3;

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	department VARCHAR(50),
	salary INT,
	hire_date date
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
	('Alice', 'Sales', 60000, '2019-06-15'),
	('Bob', 'HR', 45000, '2021-03-12'),
	('Charlie', 'Engineering', 72000, '2018-01-10'),
	('David', 'Marketing', 50000, '2020-07-20'),
	('Eve', 'Sales', 55000, '2018-09-30'),
	('Frank', 'HR', 35000, '2020-02-25'),
	('Grace', 'Design', 65000, '2017-11-05'),
	('Hank', 'Engineering', 68000, '2020-08-22'),
	('Ivy', 'Design', 70000, '2021-05-18'),
	('Jack', 'Finance', 80000, '2016-12-01'),
	('Kate', 'Sales', 50000, '2019-10-10'),
	('Leo', 'IT', 75000, '2019-01-15'),
	('Mia', 'Sales', 62000, '2022-01-01'),
	('Nina', 'HR', 40000, '2023-06-10'),
	('Oscar', 'Marketing', 58000, '2021-07-15'),
	('Paul', 'Engineering', 90000, '2017-03-18'),
	('Quinn', 'Design', 75000, '2019-04-25'),
	('Rita', 'IT', 60000, '2021-10-20'),
	('Sam', 'HR', 62000, '2022-11-30'),
	('Tina', 'Finance', 42000, '2018-08-18');

#2
select * from employees
where (department = "Sales" and salary > 500000) or (department = "HR" and hire_date > 2020-01-01);

#3
SELECT name, salary
FROM employees
WHERE salary > 50000
AND (department = 'Sales' OR department = 'HR')
ORDER BY department DESC, salary ASC;

#4
select name from employees
where salary between 40000 and 60000 and department <> "Marketing"
order by hire_date desc, salary asc;

#5
select * from employees
where department <> "Finance" OR salary < 30000
order by department asc, name desc;

#6
select * from employees
where name like "A%" and hire_date > 2015-01-01
order by name asc;

#7
SELECT *
FROM employees
WHERE (department = 'Engineering' AND salary < 70000)
   OR (department = 'Design' AND salary > 60000)
ORDER BY salary DESC;

#8
SELECT name, salary
FROM employees
WHERE hire_date < '2020-01-01'
ORDER BY salary ASC;

#9
SELECT *
FROM projects
WHERE start_date < '2022-01-01'
   OR end_date > '2022-12-31'
ORDER BY project_name DESC;

#10
SELECT *
FROM employees
WHERE name LIKE '%son'
  AND department <> 'IT'
ORDER BY salary DESC, hire_date ASC;

#11
SELECT *
FROM employees
WHERE hire_date BETWEEN '2021-01-01' AND '2021-12-31'
  AND salary > (SELECT AVG(salary) FROM employees)
ORDER BY name ASC;
