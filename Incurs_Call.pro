-- Anthony Capo
-- try_in_curs
--
create or replace procedure try_in_curs is
	incurs	cursor;

begin
	call plsql_lab(138, incurs);
	for x in incurs loop
		insert x.last_name into name_tab;
	end loop;
end;
/
sho err