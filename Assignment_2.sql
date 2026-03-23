create database HR;

use HR;

create table emp (
	empno decimal(4, 0) not null,
    ename varchar(10) default null,
    job varchar(9) default null,
    mgr decimal(4, 0) default null,
    hiredate date default null,
    sal decimal(7, 2) default null,
    comm decimal(7, 2) default null,
    deptno decimal(2, 0) default null
);

create table dept (
	deptno decimal(2, 0) default null,
    dname varchar(14) default null,
    loc varchar(13) default null
);

create table salgrade (
	grade int not null primary key,
    losal int not null,
    hisal int not null
);

alter table emp add constraint emp_empno_pk primary key(empno);
alter table dept add constraint dept_deptno_pk primary key(deptno);
alter table emp add constraint emp_deptno_fk foreign key(deptno) references dept(deptno);

insert into salgrade values
	(1, 700, 1200),
    (2, 1201, 1400),
    (3, 1401, 2000),
    (4, 2001, 3000),
    (5, 3001, 9999);

insert into dept values
	(10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'),
    (40, 'OPERATIONS', 'BOSTON');

insert into emp values
	(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, null, 20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
    (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, null, 20),
    (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
    (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, null, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, null, 10),
    (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, null, 20),
    (7839, 'KING', 'PRESIDENT', null, '1981-11-17', 5000, null, 10),
    (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
    (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, null, 20),
	(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, null, 30),
    (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, null, 20),
    (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, null, 10);

-- 1. Display all details of employees.
select * from emp;

-- 2. Display employee name and salary.
select ename, sal from emp;

-- 3. Display employee name and department number.
select ename, deptno from emp;

-- 4. Display distinct job titles from the EMP table.
select distinct job from emp;

-- 5. Display employees who belong to department number 30.
select * from emp where deptno = 30;

-- 6. Display employees whose salary is greater than 2000.
select * from emp where sal > 2000;

-- 7. Display employees hired after 01-JAN-1981.
select * from emp where hiredate > '1981-01-01';

-- 8. Display employees whose name starts with the letter S.
select * from emp where ename like 'S%';

-- 9. Display employees who receive any commission.
select * from emp where comm is not null;

-- 10. Display employees whose department number is 10 or 20.
select * from emp where deptno = 10 or deptno = 20;

-- 11. Display all employees sorted by salary in descending order.
select * from emp order by sal desc;

-- 12. Display employee name, salary and commission sorted by name.
select ename, sal, comm from emp order by ename asc;

-- 13. Display employees who have no manager.
select * from emp where mgr is null;

-- 14. Display the location of department number 20.
select loc from dept where deptno = 20;

-- 15. Display department details sorted by department name in alphabetical order.
select * from dept order by dname asc;

-- 16. Display employees whose salary is between 1000 and 3000.
select * from emp where sal between 1000 and 3000;

-- 17. Count the total number of employees in the EMP table.
select count(*) from emp;

-- 18. Display the minimum and maximum salary from the EMP table.
select min(sal), max(sal) from emp;

-- 19. Display total number of employees for each job title.
select job, count(*) from emp group by job;

-- 20. Display the current system date in MySQL.
select curdate();

-- 21. Display employee name, salary and yearly salary (salary * 12).
select ename, sal, sal * 12 as yearly_salary from emp;

-- 22. Display employees who joined in the year 1981.
select * from emp where extract(year from hiredate) = '1981';

-- 23. Display employee details sorted by hire date in descending order.
select * from emp order by hiredate desc;

-- 24. Display the average salary of each department.
select deptno, avg(sal) from emp group by deptno;

-- 25. Display employee name along with department name using a join operation.
select ename, dname from emp join dept on emp.deptno = dept.deptno;

-- 26. Display employees earning more than the average salary of the company.
select * from emp where sal > (select avg(sal) from emp);

-- 27. Display employees who have commission in each department.
select deptno, ename from emp where comm is not null;

-- 28. Display employees whose name contains the character A (case-insensitive).
select * from emp where ename like '%a%';

-- 29. Display the highest salary of each job title.
select job, max(sal) from emp group by job;

-- 30. Display employees who work in the department located in NEW YORK.
select e.ename, d.dname from emp e join dept d on e.deptno = d.deptno where d.loc = 'NEW YORK';

-- 31. Display employees who were hired on a Monday.
select * from emp where dayname(hiredate) = 'Monday';

-- 32. Count the number of employees who do not receive commission.
select count(*) from emp where comm is null;

-- 33. Display job titles along with the total commission paid for each job.
select job, sum(comm) from emp group by job;

-- 34. Display departments having more than 3 employees.
select deptno from emp group by deptno having count(*) > 3;

-- 35. Display the employees who draw the second highest salary.
select * from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp));

-- 36. Display employees who have the same job title as SMITH.
select * from emp where job = (select job from emp where ename = 'SMITH');

-- 37. Display each employee's salary grade using the SALGRADE table.
select e.ename, s.grade from emp e, salgrade s where e.sal between s.losal and s.hisal;

-- 38. Display employee name, salary and salary grade together.
select e.ename, e.sal, s.grade from emp e, salgrade s where e.sal between s.losal and s.hisal;

-- 39. Display employees who are managers.
select * from emp where job = 'MANAGER';

-- 40. Display the employee who earns the highest salary in department 30.
select * from emp where deptno = 30 and sal = (select max(sal) from emp where deptno = 30);

-- 41. Display the employee(s) who earn the highest salary in the company.
select * from emp where sal = (select max(sal) from emp);

-- 42. Display employees who earn more than the average salary of their department.
select * from emp e where sal > (select avg(sal) from emp where deptno = e.deptno);

-- 43. Display the department having the maximum total salary paid to employees.
select deptno from emp group by deptno order by sum(sal) desc limit 1;

-- 44. Display employees who joined before their respective manager joined.
select * from emp e where hiredate < (select hiredate from emp where empno = e.mgr);

-- 45. Display department details where no employees are working.
select * from dept where deptno not in (select deptno from emp);

-- 46. Display the third highest salary using a subquery.
select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp));

-- 47. Display the count of employees hired month-wise.
select month(hiredate), count(*) from emp group by month(hiredate);

-- 48. Display employees who joined after the employee FORD joined.
select * from emp where hiredate > (select hiredate from emp where ename = 'FORD');

-- 49. Display the employees whose department number is not present in the DEPT table.
select * from emp where deptno not in (select deptno from dept);

-- 50. Display job titles along with the difference between maximum and minimum salary of that job.
select job, max(sal) - min(sal) from emp group by job;

-- 51. Display employee names along with the length of each name.
select ename, length(ename) from emp;

-- 52. Display salaries formatted to two decimal places.
select format(sal, 2) from emp;

-- 53. Display each employee name masked after the first three characters (example: SMI****).
select concat(left(ename, 3), ('****')) as masked from emp;

-- 54. Display employee name and commission, replacing NULL values with the text "No Commission".
select ename, ifnull(comm, 'No Commission') as comm from emp;

-- 55. Create a view to display employee name, salary and department name.
create view emp_details as select e.ename, e.sal, d.dname from emp e join dept d on e.deptno = d.deptno;

-- 56. Update the salary of employees in department 30 by increasing it by 10 percent.
update emp set sal = sal * 1.10 where deptno = 30;

-- 57. Delete employees who do not belong to any department.
delete from emp where deptno is null;

-- 58. Insert a new department with department number 50 and department name "HR".
insert into dept (deptno, dname, loc) values (50, 'HR', null);

-- 59. Display employees working in the same department as BLAKE.
select * from emp where deptno = (select deptno from emp where ename = 'BLAKE');

-- 60. Display employees whose job title appears more than once in the EMP table.
select * from emp where job in (select job from emp group by job having count(*) > 1);

-- 61. Display employee details whose salary is higher than the maximum salary of employees in department 10.
select * from emp where sal > (select max(sal) from emp where deptno = 10);

-- 62. Display employees who earn more than every employee in department 30.
select * from emp where sal > (select max(sal) from emp where deptno = 30);

-- 63. Display departments where all employees earn a commission.
select deptno from emp group by deptno having count(comm) = count(*);

-- 64. Display employees whose salary matches the average salary of their own department.
select * from emp e where sal = (select avg(sal) from emp where deptno = e.deptno);

-- 65. Display job title and employees whose salary is below the average salary of that job.
select ename, job, sal from emp e where sal < (select avg(sal) from emp where job = e.job);

-- 66. Display employees who have the minimum salary in their respective job.
select * from emp e where sal = (select min(sal) from emp where job = e.job);

-- 67. Display employees who work in a department located in the same city as the department of KING.
select ename, dname from emp join dept on emp.deptno = dept.deptno where loc = (select loc from dept join emp on dept.deptno = emp.deptno where ename = "KING");

-- 68. Display employees whose salary is not within any salary grade range.
select e.ename, e.sal, s.grade from emp e left join salgrade s on e.sal between s.losal and s.hisal where s.grade is null;

-- 69. Display employees who earn the second highest salary in each department.
select * from emp e where sal = (select max(sal) from emp where deptno = e.deptno and sal < (select max(sal) from emp where deptno = e.deptno));

-- 70. Display employees whose department has at least one manager working in it.
select * from emp where deptno in (select deptno from emp where job = 'MANAGER');

-- 71. Display departments where no manager is assigned based on EMP table details.
select deptno from dept where deptno not in (select deptno from emp where job = 'MANAGER');

-- 72. Display employees who earn a salary that falls into the highest grade in SALGRADE.
select e.* from emp e, salgrade s where e.sal between s.losal and s.hisal and s.grade = (select max(grade) from salgrade);

-- 73. Display employees who have the same salary as someone in a different department.
select * from emp e where sal in (select sal from emp where deptno != e.deptno);

-- 74. Display employee who has the earliest hire date in each department using a correlated subquery.
select * from emp e where hiredate = (select min(hiredate) from emp where deptno = e.deptno);

-- 75. Display all departments that have less than the average number of employees compared to all departments.
select d.deptno as emp_count, d.dname from dept d
where (select count(*) from emp e where e.deptno = d.deptno) < (select avg(emp_count) from (select count(*) as emp_count from emp group by deptno) as t);

-- 76. Display employees whose managers work in a different location than the employee.
select e.* from emp e, emp m, dept d1, dept d2 where e.mgr = m.empno and e.deptno = d1.deptno and m.deptno = d2.deptno and d1.loc != d2.loc;

-- 77. Display employees who work in a department where the total salary is greater than all other departments.
select * from emp where deptno = (select deptno from emp group by deptno order by sum(sal) desc limit 1);

-- 78. Display the name of the department and employees who earn a salary greater than the average salary of all managers.
select d.dname, e.ename from emp e, dept d where e.deptno = d.deptno and e.sal > (select avg(sal) from emp where job = 'MANAGER');

-- 79. Display the department name and employee name for employees who earn more than their manager.
select e.ename, d.dname from emp e, emp m, dept d where e.mgr = m.empno and e.deptno = d.deptno and e.sal > m.sal;

-- 80. Display employee name, salary, and department name for employees whose salary is within salary grade 3.
select e.ename, e.sal, d.dname from emp e, dept d, salgrade s where e.deptno = d.deptno and e.sal between s.losal and s.hisal and s.grade = 3;
