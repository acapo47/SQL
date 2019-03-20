-- Anthony Capo
-- PLSQL_LAB
--
set serveroutput on

create or replace procedure plsql_lab
	( emp_id	employees.employee_id%type,
	  ret_cur	out sys_refcursor)
is
	cursor try_param(dp_id number) is
		select last_name from employees where department_id = dp_id;
	emp_name	employees.last_name%type;
	dep_id		departments.department_id%type;
	dep_name	departments.department_name%type;
	
begin
	select last_name, department_name, department_id
		into emp_name, dep_name, dep_id
	from employees
	join departments using (department_id)
	where employee_id = emp_id;
	
	dbms_output.put_line('And the Winner is ' || emp_name ||
				' from department ' || dep_name);
	dbms_output.put_line('Employees in the department');
	
	for x in try_param(dep_id) loop
		dbms_output.put_line(x.last_name);
	end loop;
	
	open ret_cur for select last_name from employees
		where department_id = dep_id;
		
exception
	when no_data_found then
		dbms_output.put_line('The Employee Doesn"t Exist');
	when others then
		dbms_output.put_line('Oooops.');
			
end;
/
sho err
