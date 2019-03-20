/* Anthony Capo - acapo */

/* Query A */
SELECT *
FROM ITEM;

/* Query B */
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT;

/* Query C */
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE InsuredValue > 10000.00;

/* Query D */
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE Shipper LIKE 'AB*';

/* Query E */
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber, ArrivalDate
FROM SHIPMENT
WHERE DepartureDate LIKE '12%';

/* Query F */
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber, ArrivalDate
FROM SHIPMENT
WHERE DepartureDate LIKE '_____/12%';

/* Query G */ 
SELECT MAX(InsuredValue) AS MaxInsuredValue,
			MIN(InsuredValue) AS MinInsuredValue
FROM SHIPMENT;

/* Query H */
SELECT AVG(InsuredValue) AS AvgInsuredValue
FROM SHIPMENT;

/* Query I */
SELECT COUNT(*) AS NumOfShipments
FROM SHIPMENT;

/* Query J */
SELECT Item, Store
			LocalCurrencyAmt (*) ExchangeRate As StandardCurrencyAmount
FROM ITEM;

/* Query K */
SELECT City, Store
FROM ITEM
GROUP BY City, Store;

/* Query L */
SELECT City, Store
		COUNT (*) AS CityStoreComb
FROM ITEM
GROUP BY City, Store;

/* Query P */
SELECT DISTINCT ShipperName, ShipmentID, DepartureDate
FROM SHIPMENT, SHIPMENT_ITEM, ITEM
WHERE SHIPMENT.ShipmentID = SHIPMENT_ITEM.ShipmentID
	AND SHIPMENT_ITEM.ItemID = ITEM.Item_ID
    AND City = 'SINGAPORE'
ORDER BY ShipperName ASC, DepartureDate DESC;

/* Query Q */
SELECT SHIPMENT.ShipperName, SHIPMENT_ITEM.ShipmentID,
		SHIPMENT.DepartureDate
        ITEM JOIN (SHIPMENT INNER
        ON ITEM.ItemID = SHIPMENT_ITEM.ItemID
			JOIN SHIPMENT_ITEM
            ON SHIPMENT.ShipmentID = SHIPMENT_ITEM.ShipmentID)
GROUP BY SHIPMENT.ShipperName, SHIPMENT_ITEM.ShipmentID,		
				SHIPMENT.DepartureDate, ITEM.City
HAVING ITEM.City = 'SINGAPORE'
ORDER BY ShipperName ASC, DepartureDate DESC;

