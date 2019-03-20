/* Anthony Capo - acapo - 2 */

/* Query 2.17 */
SELECT SKU, SKU_Description
FROM INVENTORY;

/* Query 2.18 */
SELECT SKU_Description, SKU
FROM INVENTORY;

/* Query 2.19 */
SELECT WarehouseID
FROM INVENTORY;

/* Query 2.20 */
SELECT DISTINCT WarehouseID
FROM INVENTORY;

/* Query 2.21 */
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM INVENTORY;

/* Query 2.22 */
SELECT *
FROM INVENTORY;

/* Query 2.23 */
SELECT *
FROM INVENTORY
WHERE QuantityOnHand > NULL;

/* Query 2.24 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0;

/* Query 2.25 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID DESC, SKU ASC;

/* Query 2.26 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;

/* Query 2.27 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC, SKU ASC;

/* Query 2.28 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

/* Query 2.29 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

/* Query 2.30 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 10;

