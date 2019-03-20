declare 
	cursor myCurs is select last_name || ', ' || first_name emp,
		department_name from departments 
		join employees using (department_id) where department_id = 100;
begin
	for xcurs in myCurs loop
		dbms_output.put_line(xcurs.emp || ' ' 
			|| xcurs.department_name);
	end loop;
end;
/
