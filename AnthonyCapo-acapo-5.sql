/* Anthony Capo - acapo - 5 */

/* Query 1*/
SELECT Department, Buyer
FROM SKU_DATA;

/* Query 2 */
SELECT Buyer, Department
FROM SKU_DATA;

/* Query 3 */
SELECT distinct buyer, department
FROM SKU_DATA;

/* Query 4 */
SELECT SKU, SKU_DESCRIPTION, DEPARTMENT, BUYER
FROM SKU_DATA;

/* Query 5 */
SELECT *
From sku_data;

/* Query 6 */
Select *
From sku_data
WHERE DEPARTMENT= 'WATER SPORTS';

/* Query 7 */
SELECT *
FROM SKU_DATA
WHERE SKU > 200000;

/*Query 8 */
select SKU_Description, Department
FROM SKU_DATA
WHERE Department= 'Climbing';

/* Query 10 */
SELECT *
FROM ORDER_ITEM
ORDER BY OrderNumber, Price;

/* Query 11 */
SELECT *
FROM ORDER_ITEM
ORDER BY ORDERNUMBER;

/* Query 13 */
SELECT *
FROM ORDER_ITEM
ORDER BY Price DESC, OrderNumber;

/* Query 15 */
SELECT * 
FROM SKU_DATA
WHERE Department= 'Water Sports'
AND Buyer = 'Nancy Meyers';

/*Query 16 */
SELECT * 
FROM SKU_DATA
WHERE Departments='Climbing'
OR Department= 'Camping';

/* Query 17 */
SELECT *
FROM SKU_DATA
WHERE Buyer IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

/* Query 18 */
SELECT *
FROM SKU_DATA
WHERE Buyer NOT IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

/* Query 19 */
SELECT *
FROM ORDER_ITEM
WHERE ExtendedPrice BETWEEN 100 AND 200;

/* Query 20 */
SELECT *
FROM ORDER_ITEM
WHERE ExtendedPrice >= 100
