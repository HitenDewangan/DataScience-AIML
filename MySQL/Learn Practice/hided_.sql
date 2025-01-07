create database hided;
use hided;

show tables;
create table student (
id   int primary key,
name varchar(50),
age  int not null);

select * from student;

insert into student values
(001, "Sam", 19),
(002, "Nick", 17),
(003, "Noah", 17);
      
SELECT * FROM student;

create table city(
id int PRIMARY KEY,
city varchar(50),
weather varchar(30),
FOREIGN KEY (id) references student(id));

insert into city values
(001, "Paris", "cloudy"),
(002, "Los Angeles", "sunny"),
(003, "California", "Tornado");

SELECT * FROM city, student
WHERE city.id = student.id;

create table room(
id int primary key,
people int default 2,
floor_id int default 4,
foreign key (id) references student(id)
);

insert into room(id, people, floor_id) values
(001, 3),
(002, 5, 2),
(003, 2, 1);

select * from room;



