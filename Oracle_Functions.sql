select sysdate from dual;
select to_char(sysdate,'MM') Month from dual;
select to_char(sysdate,'Q') Quarter from dual;
select to_char(sysdate,'YYYY') Year from dual;
select to_char(sysdate,'DD Month, YYYY') from dual;
select to_char(sysdate,'fmDDth Month, YYYY') from dual;
select to_char(sysdate,'fmddth Month, YYYY') from dual;
select to_char(sysdate,'fmDay ddth Month, yyyy') from dual;
select last_day(sysdate) from dual;
select sysdate + 8 from dual;
select sysdate - 8 from dual;
pause Hit Enter
select sysdate + invterval '10' day from dual;
select add_months(sysdate, 6) from dual;
select next_day(sysdate,'Thursday') from dual;
select months_between(sysdate, '15-DEC-17') from dual;
select months_between('15-DEC-17', sysdate) from dual;
select to_char(sysdate,'"Today is the "fmddth "of" Month, YYYY') from dual;
pause Hit Enter for TRIM
--
-- trim
-- 
select '-->','       Your Name         ', '<--' from dual;
select '-->',rtrim('       Your Name         '), '<--' from dual;
select '-->',ltrim('       Your Name         '), '<--' from dual;
select '-->',rtrim(ltrim('       Your Name         ')), '<--' from dual;
select '-->',trim('       Your Name         '), '<--' from dual;
pause Hit Enter for Translate
--
-- Translate
--
select first_name from employees where employee_id = 120;
select translate(first_name, 'tw', 'lx') from employees where employee_id = 120;
pause Hit Enter for Decode 
--
-- Decode
--
select country_id from locations;
select decode(country_id,'IT','Italy', 'JP', 'Japan', 'US', 'United States', country_id) from locations
/