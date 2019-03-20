declare
	i	number	:= 3;
	x	employees%rowtype;
	y	employees.first_name%type;
	z	employees.last_name%type;
	cursor my_curs is select * from employees;
	
begin
	dbms_output.put_line(i);
	
	declare
		j number := 7;
	begin
		dbms_output.put_line(j);
		dbms_output.put_line(i);
	end;
	
--	dbms_output.put_line(j);
	select * 
		into x
	from employees where employee_id = 170;
	
	dbms_output.put_line(x.first_Name);
	
	select first_name, last_name 
		into y, z
		from employees where employee_id = 170;
		
	dbms_output.put_line(y || ' ' || z);
end;
/
