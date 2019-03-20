declare 
	cursor myCurs is select last_name || ', ' || first_name emp,
		department_name from departments 
		join employees using (department_id) where department_id = 100;
	xcurs myCurs%rowtype;
begin
open myCurs;

loop
	fetch myCurs into xcurs;
		exit when myCurs%notfound;
	
	dbms_output.put_line(xcurs.emp || ' ' 
			|| xcurs.department_name);
	
end loop;
close myCurs;
end;
/
