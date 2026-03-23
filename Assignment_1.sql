create database company;
use company;

-- 1. Create a table employee having emp_id (varchar), emp_name (varchar), dept (varchar), address (varchar) and salary (numeric), mobile_no (varchar), where emp_id is the primary key and rest all the attributes are not null.
create table employee (
	emp_id varchar(10) primary key,
    emp_name varchar(200) not null,
    dept varchar(200) not null,
    address varchar(1000) not null,
    salary numeric(10, 2) not null,
    mobile_no varchar(10) not null
);

-- 2. Insert at least ten rows into the table, display all of them.
insert into employee (emp_id, emp_name, dept, address, salary, mobile_no) values
	('e101', 'Raj', 'IT', 'Alipurduar', 55000, '9876543210'),
	('e102', 'Steve', 'HR', 'Dhupguri', 48000, '9123456780'),
	('e103', 'Aditya', 'Finance', 'Siliguri', 62000, '9988776655'),
	('e104', 'Rajatava', 'Marketing', 'Siliguri', 53000, '9871234567'),
	('e105', 'Afroj', 'IT', 'Bagdogra', 60000, '9012345678'),
	('e106', 'Neha', 'HR', 'Kolkata', 47000, '9098765432'),
	('e107', 'Arjun', 'Finance', 'New Delhi', 65000, '9345678123'),
	('e108', 'Jagmeet', 'Marketing', 'Amritsar', 52000, '9765432109'),
	('e109', 'Alexa', 'IT', 'New York', 58000, '9654321870'),
	('e110', 'Satoshi', 'HR', 'Tokyo', 49000, '9876501234');
select * from employee;

-- 3. Select the particular using emp_id.
select * from employee where emp_id = 'e104';

-- 4. Add a column emp_dob.
alter table employee add emp_dob date;

-- 5. Update a particular data, say mobile no. of emp id = e105.
update employee set mobile_no = '0000000000' where emp_id = 'e105';
