/* Anthony Capo - acapo - 7 */

/* Query 43 */
SELECT Department, COUNT(*) AS Dept_SKU_Count
FROM SKU_DATA
WHERE SKU <> 302000
GROUP BY Department
ORDER BY Dept_SKU_Count;

/* Query 44*/
SELECT Department, COUNT(*) AS Dept_SKU_Count
FROM SKU_DATA
WHERE SKU <> 302000
GROUP BY Department
HAVING COUNT(*) >1
ORDER BY Dept_SKU_Count;

/* Query 48*/
SELECT SUM(ExtendedPrice) AS Revenue
FROM ORDER_ITEM
WHERE SKU IN 
       (SELECT SKU 
        FROM SKU_DATA
        WHERE Department = 'Water Sports');
        	
/* Query 49*/    
SELECT Buyer
FROM SKU_DATA
WHERE SKU IN 
         (SELECT SKU
          FROM  ORDER_ITEM
          WHERE OrderNumber IN 
                (SELECT OrderNumber
                 FROM RETAIL_ORDER
                 WHERE OrderMonth = 'January'
                 AND   OrderYear = 2011));
         
/* Query 53 */      
SELECT * 
FROM RETAIL_ORDER, ORDER_ITEM
WHERE RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber;
  
/* Query 54 */  
SELECT Buyer,ExtendedPrice
FROM SKU_DATA, ORDER_ITEM
WHERE SKU_DATA.SKU= ORDER_ITEM.SKU;
  
/* Query 56 */
SELECT Buyer, ExtendedPrice, OrderMonth
FROM SKU_DATA, ORDER_ITEM, RETAIL_ORDER
WHERE SKU_DATA.SKU= ORDER_ITEM.SKU
AND   ORDER_ITEM.OrderNumber= RETAIL_ORDER.OrderNumber;
  
/* Query 58*/
SELECT * 
FROM RETAIL_ORDER JOIN ORDER_ITEM
ON RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber;
    
/* Query 68*/ 
 SELECT OI.OrderNumber,Quantity, SD.SKU,SKU_Description, Department, Buyer
 FROM ORDER_ITEM AS OI  RIGHT OUTER JOIN SKU_DATA AS SD
 ON OI.SKU=SD.SKU
 ORDER BY OI.OrderNumber, SD.SKU;
 
 