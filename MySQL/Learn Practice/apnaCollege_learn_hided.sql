show databases;
use hided;

show tables;

select * from student;

ALTER TABLE student ALTER COLUMN age set default 17;            -- changing the column definition, setting default value

ALTER TABLE student ADD city VARCHAR(30);               -- adding a new column
ALTER TABLE student MODIFY COLUMN city VARCHAR(50);
ALTER TABLE student ALTER COLUMN city set default 'india';         -- this statement doen't change the existing data but shos when new data gets added

select * from student;

ALTER TABLE student DROP COLUMN phone_number;
select * from student;

insert into student(id, name) values
(4, "Steve"),
(5, "Pudge");

select * from student;

INSERT INTO student VALUES(6, "chip", 18, "Albama");     -- not giving columns the give value for all columns

describe student;
show columns from student;         -- same as DESCRIBE

UPDATE student
SET city = 'Paris'             -- Replace 'New City Name' with the desired city
WHERE id = 2;
