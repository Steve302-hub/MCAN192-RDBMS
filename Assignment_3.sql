-- 1. Write a pl/sql program Accept Number from a User and display Hello message if the entered number is Positive.
set serveroutput on;
declare
    num int;
begin
    num := &num;
    if num > 0 then
        dbms_output.put_line('Hello');
    end if;
end;
/

-- 2. Write a PL/SQL block to accept an employee's salary and determine the grade.
--     Salary >= 50,000 -> Grade A
--     Salary >= 30,000 -> Grade B
--     Salary < 30,000 -> Grade C
set serveroutput on;
declare
    sal int;
begin
    sal := &sal;
    if sal >= 50000 then
        dbms_output.put_line('Grade A');
    elsif sal >= 30000 then
        dbms_output.put_line('Grade B');
    else
        dbms_output.put_line('Grade C');
    end if;
end;
/

-- 3. Write a pl/sql program to Display Salary of a specified employee increasing by 500 if its salary is more than 3000.
set serveroutput on;
declare
    sal int;
begin
    sal := &sal;
    if sal > 3000 then
        sal := sal + 500;
        dbms_output.put_line(sal);
    end if;
end;
/

-- 4. Write a PL/SQL program using FOR loop to insert ten rows into a database table.
set serveroutput on;
create table student(
	std_id number primary key,
	std_name varchar2(100)
);
begin
    for i in 1..10 loop
        insert into student(std_id, std_name) values (i, 'Student_' || i);
    end loop;
    commit;
end;
/

-- 5. Write a PL/SQL program to generate Fibonacci series.
set serveroutput on;
declare
    n int := &n;
    a int := 0;
    b int := 1;
    c int;
begin
    dbms_output.put_line(a);
    dbms_output.put_line(b);

    for i in 3..n loop
        c := a + b;
        dbms_output.put_line(c);
        a := b;
        b := c;
    end loop;
end;
/

-- 6. Write a pl/sql program to get the name and salary of specified employee using %type attribute.
set serveroutput on;
declare
    v_emp_id emp_table.emp_id%type := &emp_id;
    v_name   emp_table.emp_name%type;
    v_salary emp_table.salary%type;
begin
    select emp_name, salary into v_name, v_salary from emp_table where emp_id = v_emp_id;
    dbms_output.put_line('Name: ' || v_name);
    dbms_output.put_line('Salary: ' || v_salary);
end;
/

-- 7. Write a PL/SQL Program to display a given number in Reverse Order.
set serveroutput on;
declare
    num int := &num;
    rev int := 0;
begin
    while num > 0 loop
        rev := rev * 10 + mod(num, 10);
        num := trunc(num / 10);
    end loop;
    dbms_output.put_line('Reversed Number: ' || rev);
end;
/

-- 8. Write a PL/SQL program to take a department ID and display the department name using CASE.
--     Example:
--     10 -> "Finance"
--     20 -> "HR"
--     30 -> "IT"
--     40 -> "Sales"
--     Others -> "Invalid Department"
set serveroutput on;
declare
	dept_id int;
begin
	dept_id := &dept_id;
	case dept_id
		when 10 then dbms_output.put_line('Finance');
		when 20 then dbms_output.put_line('HR');
		when 30 then dbms_output.put_line('IT');
		when 40 then dbms_output.put_line('Sales');
		else dbms_output.put_line('Invalid Department');
	end case;
end;
/

-- 9. Write a pl/sql program to get the name and salary of specified employee.
set serveroutput on;
declare
    v_emp_id emp_table.emp_id%type := &emp_id;
    v_name   emp_table.emp_name%type;
    v_salary emp_table.salary%type;
begin
    select emp_name, salary into v_name, v_salary from emp_table where emp_id = v_emp_id;
    dbms_output.put_line('Name: ' || v_name);
    dbms_output.put_line('Salary: ' || v_salary);
end;
/

-- 10. Write a PL/SQL block using a for loop to print the sum of the first 100 odd natural numbers.
set serveroutput on;
declare
    sum_val int := 0;
begin
    for i in 1..100 loop
        sum_val := sum_val + (2 * i - 1);
    end loop;
    dbms_output.put_line('Sum: ' || sum_val);
end;
/
