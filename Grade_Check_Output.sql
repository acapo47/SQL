
set serveroutput on

declare
	grade varchar2(2) := 'D';
begin
--
--	Simple Case
--
	case grade
		when 'A' then dbms_output.put_line('Pretty good');
		when 'B' then	
			dbms_output.put_line('Try a little harder');
			dbms_output.put_line('You''re close to an A');
		when 'C' then dbms_output.put_line('Coming to class might help');
		else dbms_output.put_line('Your grade is '|| grade || 
									' UNACCEPTABLE');
	end case;
--
--	Search Case 
--
	case 
		when grade = 'A' then dbms_output.put_line('Pretty good');
		when grade = 'B' then
			dbms_output.put_line('Try a little harder');
				dbms_output.put_line('You''re close to an A');
		when grade = 'C' then 
			dbms_output.put_line('Coming to class might help');
		else dbms_output.put_line('Your grade is '|| grade || 
									' UNACCEPTABLE');
	end case;
end;
/
