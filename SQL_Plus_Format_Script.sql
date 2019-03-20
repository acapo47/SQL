set verify off

acc dept number format 999 default 100 -
	prompt 'Enter a Deparment ID => '

select first_name, last_name, salary from employees 
	where department_id = &&dept
/

select department_name from departments where department_id = &1;

select last_name from employees where soundex(last_name) = soundex('&2')
/

set verify on