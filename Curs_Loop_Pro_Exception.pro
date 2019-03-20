-- Anthony Capo
-- except.pro
--
create or replace procedure except (dep_num in number)
	is
	cursor my_curs is select first_name, last_name 
		from employees
		where department_id = dep_num;
	
	no12s	exception;
			
	
begin
	if dep_num = 12 then
	--	raise_application_error(-20001, 'No Dept 12');
		raise no12s;
	end if;
	
	for x in my_curs loop
		dbms_output.put_line(x.first_name || ' ' ||
				x.last_name);
	end loop;
exception
	when no12s then dbms_output.put_line('No Depts 12');
	
	when others then
		if sqlcode = -20001 then dbms_output.put_line(
					'Hold on there buddy');
		end if;
	
end;
/
sho err
