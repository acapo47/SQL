declare
	idx number := 1;
begin
	loop
		insert into temp_table values (idx, 'Simple');
		idx := idx + 1;
		if idx > 99 then
			exit;
		end if;
	end loop;
-- while loop
	idx := 1;
	while idx <= 99 loop
		insert into temp_table values (idx, 'while');
		idx := idx + 1;
	end loop;
end;
	
/
	
