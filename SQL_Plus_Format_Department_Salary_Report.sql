--Anthony Capo
--test M/D report 
-- 
store set %homepath%\mySets replace
set pagesize 40
set linesize 65
set newpage 0
set feedback off

col department_name new_v dept noprint
-- col department_name new_v dept print
col uline new_val xline
col today new_value now

break on department_name  skip page on blnk

compute sum of salary label 'Total' on blnk

set termout off
select lpad(' ',65,'=') uline from dual;
select to_char(sysdate, 'fmDay dd Month yyyy') today from dual;
set termout on

ttitle center dept skip 1 -  
	 right now skip 1 -
	xline skip 2
	
btitle xline skip center sql.pno right sql.user
	
col salary format $9,999,999.99 heading Salary
col last_name format a20 heading Last|Name
col first_name like last_name heading 'First Name'
col blnk heading ' '

spool %homepath%\DeptReport

select '     ' blnk, department_name, last_name, first_name, salary from employees
join departments using (department_id)
order by department_name;

spool off

undef dept xline now
clear col
clear break
clear compute
clear buffer

@%homepath%\mySets

