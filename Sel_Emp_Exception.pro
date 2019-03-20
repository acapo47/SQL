--
-- Stored Procedure -- Anhony Capo
--

CREATE OR REPLACE PROCEDURE FinF17(
	PARAM1	IN NUMBER,
	PARAM2  REFCURSOR	OUT RET_CUR)
	
IS
	CURSOR TRY_PARAM(DP_ID NUMBER) IS
		SELECT LAST_NAME ||','|| FIRST_NAME 
		FROM EMPLOYEES
		WHERE DEPARTMENT_ID = DP_ID;
		
		EMP_LAST_NAME	employees.last_name%type;
		EMP_FIRST_NAME	employees.first_name%type;
		JOB_ID			jobs.department_id%type;
		DEP_ID			departments.department_id%type;
		DEP_NAME		departments.department_name%type;
		
		BAD_NUMBER	EXCEPTION;	
		PRAGMA EXCEPTION_INIT(BAD_NUMBER, -01722);
	
BEGIN 

	INSERT INTO JOBS VALUES (PARAM1);
	PARAM2 :=0;
	
EXCEPTION
	WHEN BAD_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM || 'Invalid Number ' || SQLCODE);
		PARAM4 := SQLCODE;
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM || 'ORACLE ERROR ' || SQLCODE);
		PARAM4 := SQLCODE;
		
END;

/shoerr
