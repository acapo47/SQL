/* Query 1 */
SELECT *
FROM CUSTOMER, INVOICE, INVOICE_ITEM;

/* Query 2 */
SELECT LastName, FirstName, Phone
FROM CUSTOMER;

/* Query 3 */
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = 'Nikki';

/* # LastName, FirstName, Phone
'Kaccaton', 'Nikki', '723-543-1233'
*/

/* Query 4 */
SELECT LastName, FirstName, Phone, DateIn, DateOut
FROM CUSTOMER, INVOICE
WHERE TotalAmount < 100;

/* # LastName, FirstName, Phone, DateIn, DateOut
'Kaccaton', 'Nikki', '723-543-1233', '2011-10-04', '2011-10-06'
'Kaccaton', 'Nikki', '723-543-1233', '2011-10-06', '2011-10-08'
'Kaccaton', 'Nikki', '723-543-1233', '2011-10-06', '2011-10-08'
'Kaccaton', 'Nikki', '723-543-1233', '2011-10-07', '2011-10-11'
'Kaccaton', 'Nikki', '723-543-1233', '2011-10-11', '2011-10-13'
'Kaccaton', 'Nikki', '723-543-1233', '2011-10-12', '2011-10-14'
'Catnazaro', 'Brenda', '723-543-2344', '2011-10-04', '2011-10-06'
'Catnazaro', 'Brenda', '723-543-2344', '2011-10-06', '2011-10-08'
'Catnazaro', 'Brenda', '723-543-2344', '2011-10-06', '2011-10-08'
'Catnazaro', 'Brenda', '723-543-2344', '2011-10-07', '2011-10-11'
'Catnazaro', 'Brenda', '723-543-2344', '2011-10-11', '2011-10-13'
'Catnazaro', 'Brenda', '723-543-2344', '2011-10-12', '2011-10-14'
'LeCat', 'Bruce', '723-543-3455', '2011-10-04', '2011-10-06'
'LeCat', 'Bruce', '723-543-3455', '2011-10-06', '2011-10-08'
'LeCat', 'Bruce', '723-543-3455', '2011-10-06', '2011-10-08'
'LeCat', 'Bruce', '723-543-3455', '2011-10-07', '2011-10-11'
'LeCat', 'Bruce', '723-543-3455', '2011-10-11', '2011-10-13'
'LeCat', 'Bruce', '723-543-3455', '2011-10-12', '2011-10-14'
'Miller', 'Betsy', '725-654-3211', '2011-10-04', '2011-10-06'
'Miller', 'Betsy', '725-654-3211', '2011-10-06', '2011-10-08'
'Miller', 'Betsy', '725-654-3211', '2011-10-06', '2011-10-08'
'Miller', 'Betsy', '725-654-3211', '2011-10-07', '2011-10-11'
'Miller', 'Betsy', '725-654-3211', '2011-10-11', '2011-10-13'
'Miller', 'Betsy', '725-654-3211', '2011-10-12', '2011-10-14'
'Miller', 'George', '725-654-4322', '2011-10-04', '2011-10-06'
'Miller', 'George', '725-654-4322', '2011-10-06', '2011-10-08'
'Miller', 'George', '725-654-4322', '2011-10-06', '2011-10-08'
'Miller', 'George', '725-654-4322', '2011-10-07', '2011-10-11'
'Miller', 'George', '725-654-4322', '2011-10-11', '2011-10-13'
'Miller', 'George', '725-654-4322', '2011-10-12', '2011-10-14'
'Miller', 'Kathy', '723-514-9877', '2011-10-04', '2011-10-06'
'Miller', 'Kathy', '723-514-9877', '2011-10-06', '2011-10-08'
'Miller', 'Kathy', '723-514-9877', '2011-10-06', '2011-10-08'
'Miller', 'Kathy', '723-514-9877', '2011-10-07', '2011-10-11'
'Miller', 'Kathy', '723-514-9877', '2011-10-11', '2011-10-13'
'Miller', 'Kathy', '723-514-9877', '2011-10-12', '2011-10-14'
'Miller', 'Betsy', '723-514-8766', '2011-10-04', '2011-10-06'
'Miller', 'Betsy', '723-514-8766', '2011-10-06', '2011-10-08'
'Miller', 'Betsy', '723-514-8766', '2011-10-06', '2011-10-08'
'Miller', 'Betsy', '723-514-8766', '2011-10-07', '2011-10-11'
'Miller', 'Betsy', '723-514-8766', '2011-10-11', '2011-10-13'
'Miller', 'Betsy', '723-514-8766', '2011-10-12', '2011-10-14'
*/

/* Query 5 */
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE LastName LIKE '%cat%';

/*
# LastName, FirstName, Phone
'Kaccaton', 'Nikki', '723-543-1233'
'Catnazaro', 'Brenda', '723-543-2344'
'LeCat', 'Bruce', '723-543-3455'
*/

/* Query 6 */
SELECT MAX(TotalAmount), MIN(TotalAmount)
FROM INVOICE;

/*
# MAX(TotalAmount), MIN(TotalAmount)
'158.50', '7.00'
*/

/* Query 7 */
SELECT DISTINCT LastName, FirstName, Phone
FROM CUSTOMER, INVOICE_ITEM
WHERE Item = 'Dress Shirt'
ORDER BY LastName ASC, FirstName DESC;

/* # LastName, FirstName, Phone
'Catnazaro', 'Brenda', '723-543-2344'
'Kaccaton', 'Nikki', '723-543-1233'
'LeCat', 'Bruce', '723-543-3455'
'Miller', 'Kathy', '723-514-9877'
'Miller', 'George', '725-654-4322'
'Miller', 'Betsy', '723-514-8766'
'Miller', 'Betsy', '725-654-3211'

*/

/* Query 8 */
SELECT DISTINCT FirstName, LastName, Phone
FROM CUSTOMER, SEMINAR
WHERE Location = 'Kitchen' 
	AND SeminarTitle = 'Big D Budget'
ORDER BY LastName DESC, FirstName ASC;

/* Query 9 */
CREATE VIEW EmployeePhoneView (
SELECT  EMPLOYEE.LastName AS EmployeeLastName,
		EMPLOYEE.FirstName AS EmployeeFirstName,
        EMPLOYEE.Phone AS EmployeePhone
FROM EMPLOYEE
);

/* Query 10 */
CREATE VIEW FinanceEmployeePhoneView (
SELECT  EMPLOYEE.LastName AS EmployeeLastName,
		EMPLOYEE.FirstName AS EmployeeFirstName,
        EMPLOYEE.Phone AS EmployeePhone
FROM EMPLOYEE
WHERE Department = 'Finance'
);
