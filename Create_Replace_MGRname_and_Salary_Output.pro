-- Anthony Capo
-- Local Module
--
create or replace procedure local(emp employees.employee_id%type)
is
	mgr_x employees.manager_id%type;
	mgr_first	employees.first_name%type;
	mgr_last	employees.last_name%type;
	out_name	varchar2(40);
	
	cursor mgr_emps(mgr varchar2) is select first_name, last_name, salary
		from employees where manager_id = mgr;
	
	function fix_names(in1 varchar2, in2 varchar2)
		return varchar2
	is
	begin
		return upper(in2) || ', ' || lower(in1);
	end;
begin	
	select manager_id into mgr_x from employees where employee_id = emp;
	
	select first_name, last_name into mgr_first, mgr_last
		from employees
		where employee_id = mgr_x;
	
	out_name := fix_names(mgr_first, mgr_last);
	dbms_output.put_line (out_name);
	dbms_output.put_line('================================');
	
	for x in mgr_emps(mgr_x) loop
		out_name := fix_names(x.first_name, x.last_name);
		dbms_output.put_line(out_name || '    ' || x.salary);
	end loop;
end;
/
sho err