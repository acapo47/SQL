/* Anthony Capo - acapo */

/* Query 7.14 */
INSERT INTO DEPARTMENT
	VALUES (DepartmentName, BudgetCode, OfficeNumber, Phone);

/* Query 7.15 */
INSERT INTO EMPLOYEE
	VALUES (ColumnName, Type, Key, Required, Remarks);

/* Query 7.16 */
INSERT INTO PROJECT
	VALUES (ColumnName, Type, Key, Required, Remarks);

/* Query 7.17 */
INSERT INTO ASSIGNMENT
	VALUES (ColumnName, Type, Key, Required, Remarks);

/* Query 7.18 */
They were populated in this order because the table information requires surrogate keys that relate to the sequential order of the information. 

/* Query 7.20 */
UPDATE EMPLOYEE 
	SET Phone = '360-287-8810'
    WHERE EmployeeNumber = 11;

/* Query 7.21 */
UPDATE EMPLOYEE
	SET Department = 'Finance'
    WHERE EmployeeNumber = 5;

/* Query 7.22 */
UPDATE EMPLOYEE 
	SET Phone = '360-287-8420'
    WHERE EmployeeNumber = 5;

/* Query 7.23 */
UPDATE EMPLOYEE 
	SET Phone = '360-287-8420'
    WHERE EmployeeNumber = 5
    SET Department = 'Finance'
    WHERE EmployeeNumber = 5
    FROM EMPLOYEE;

/* Query 7.26 */
DELETE FROM PROJECT
WHERE ProjectName = '2011 Q3 Product Plan';

/* Query 7.27 */
DELETE FROM EMPLOYEE
WHERE EmployeeLastName = 'Smith';

/* Query 7.30 */
CREATE VIEW EmployeePhoneView AS
	SELECT LastName AS EmployeeLastName,
		   FirstName AS EmployeeFirstName,
           Phone AS EmployeePhone
	FROM EMPLOYEE;
    
/* Query 7.31 */
CREATE VIEW FinanceEmployeePhoneView AS
	SELECT LastName AS EmployeeLastName,
		   FirstName AS EmployeeFirstName,
           Phone AS EmployeePhone
	FROM EMPLOYEE
    WHERE Department = 'Finance';
	
/* Query 7.32 */
CREATE VIEW CombinedNameEmployeePhoneView AS
	SELECT LastName AS EmployeeLastName,
		   FirstName AS EmployeeFirstName,
           Phone AS EmployeePhone
           CONCAT(EmployeeFirstName, EmployeeLastName) AS EmployeeName
           FROM EMPLOYEE
           ORDER BY EmployeeName;

/* Query 7.33 */
CREATE VIEW EmployeeProjectAssignmentView AS
	SELECT LastName AS EmployeeLastName,
		   FirstName AS EmployeeFirstName,
           Phone AS EmployeePhone
           Name AS ProjectName
	FROM EMPLOYEE;

/* Query 7.34 */
CREATE VIEW EmployeeProjectAssignmentView AS
	SELECT LastName AS EmployeeLastName,
		   FirstName AS EmployeeFirstName,
           Phone AS EmployeePhone
           Name AS ProjectName
           CONCAT(DepartmentName, DepartmentPhone) AS ProjectName
	FROM EMPLOYEE;

/* Query 7.35 */
CREATE VIEW ProjectHoursToDateView AS
	SELECT ProjectID, Name AS ProjectName,
		   MaxHours AS ProjectMaxHours,
           SUM(HoursWorked) AS ProjectHoursWorkedToDate
	FROM PROJECT;
    
    