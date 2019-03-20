/* Anthony Capo - acapo - 7 */

/* Query 21 */
SELECT *
FROM SKU_DATA
WHERE Buyer LIKE 'Pete%';

/* Query 22 */
SELECT *
FROM SKU_DATA
WHERE SKU_Description LIKE '%Tent%';

/* Query 24 */
SELECT *
FROM SKU_DATA
WHERE SKU LIKE '%2__';

/* Query 26 */
SELECT SUM(OrderTotal) AS OrderSum
FROM RETAIL_ORDER;

/* Query 28 */
SELECT SUM(ExtendedPrice) AS Order3000Sum
FROM ORDER_ITEM
WHERE OrderNumber = 3000;

/* Query 29 */
SELECT SUM(ExtendedPrice) AS OrderItemSum,
	AVG(ExtendedPrice) AS OrderItemAVG,
    MIN(ExtendedPrice) AS OrderItemMin,
    MAX(ExtendedPrice) AS OrderItemMax
FROM ORDER_ITEM;

/* Query 30 */
SELECT COUNT(*) AS NumberOfRows
FROM ORDER_ITEM;

/* Query 31 */
SELECT COUNT(DISTINCT Department) AS DeptCount
FROM SKU_DATA;

/* Query 35 */
SELECT Quantity*Price AS EP,ExtendedPrice
FROM ORDER_ITEM;

/* Query 37 */
SELECT CONCAT(Buyer,' in ',Department) AS Sponsor
FROM SKU_DATA;

/* Query 39 */
SELECT Department, COUNT(*) AS Dept_SKU_Count
FROM SKU_DATA
GROUP BY Department;

/* Query 43 */
SELECT Department, COUNT(*) AS Dept_SKU_Count
FROM SKU_DATA
WHERE SKU <> 302000
GROUP BY Department
ORDER BY Dept_SKU_Count;

/* Query 44 */
SELECT Department, COUNT(*) AS Dept_SKU_Count
FROM SKU_DATA
WHERE SKU <> 302000
GROUP BY Department
HAVING Count(*) >1
ORDER BY Count(*);

