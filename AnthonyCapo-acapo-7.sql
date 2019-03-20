/* Anthony Capo - acapo - 7 */

/* Query 48 */
SELECT SUM(ExtendedPrice) AS Revenue
FROM ORDER_ITEM
WHERE SKU IN 
			(SELECT SKU
             FROM SKU_DATA
			 WHERE Department= 'Water Sports');
             
/* Query 49 */
SELECT Buyer
FROM SKU_DATA
WHERE SKU IN 
			(SELECT SKU 
            FROM ORDER_ITEM
            WHERE OrderNumber IN
							(SELECT OrderNumber
								FROM RETAIL_ORDER
                                WHERE OrderMonth = 'January'
                                AND OrderYear = 2011));
                                
/* Query 52 */
SELECT *
FROM RETAIL_ORDER, ORDER_ITEM
WHERE RETAIL_ORDER.OrderNumber= ORDER_ITEM.OrderNumber;

/* Query 54 */
SELECT Buyer, ExtendedPrice
FROM SKU_DATA, ORDER_ITEM
WHERE SKU_DATA.SKU= ORDER_ITEM.SKU;

/* Query 56 */
SELECT Buyer, ExtendedPrice, OrderMonth
FROM SKU_DATA, ORDER_ITEM, RETAIL_ORDER
WHERE SKU_DATA.SKU= ORDER_ITEM.SKU
AND ORDER_ITEM.OrderNumber= RETAIL_ORDER.OrderNumber;

/* Query 58 */
SELECT *
FROM RETAIL_ORDER JOIN ORDER_ITEM
ON RETAIL_ORDER.OrderNumber= ORDER_ITEM.OrderNumber;
/* WHERE OrderYear='2011'; ---59 */

/* Query 60 */
SELECT RETAIL_ORDER.OrderNumber, StoreNumber, OrderYear, 
		ORDER_ITEM.SKU,SKU_Description, Department
FROM RETAIL_ORDER JOIN ORDER_ITEM
	ON RETAIL_ORDER.OrderNumber=ORDER_ITEM.OrderNumber
		JOIN SKU_DATA
			ON ORDER_ITEM.SKU=SKU_DATA.SKU;
            
/* Query 61 */
SELECT RETAIL_ORDER.OrderNumber, StoreNumber, OrderYear, 
		ORDER_ITEM.SKU,SKU_Description, Department
FROM RETAIL_ORDER AS RO JOIN ORDER_ITEM AS OI
	ON RO.OrderNumber=OI.OrderNumber
		JOIN SKU_DATA AS SD
			ON OI.SKU=SD.SKU;
            
/* Query 68 */
SELECT OI.OrderNumber, Quantity, SD.SKU, SKU_Description,
		Buyer, Department
FROM ORDER_ITEM AS OI RIGHT OUTER JOIN SKU_DATA AS SD
ON OI.SKU=SD.SKU;
            

