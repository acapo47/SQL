CREATE TABLE SHIPMENT (
    ShipmentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ShipperName CHAR(35) NOT NULL,
    ShipperInvoiceNumber INT(11) NOT NULL,
    DepartureDate DATE NULL,
    ArrivalDate DATE NULL,
    InsuredValue DECIMAL(12 , 2 ) NOT NULL
);
 
CREATE TABLE ITEM (
    ItemID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Description VARCHAR(25) NOT NULL,
    PurchaseDate DATE NOT NULL,
    Store CHAR(50) NOT NULL,
    City CHAR(35) NOT NULL,
    Quantity INT(11) NOT NULL,
    LocalCurrencyAmount DECIMAL(18 , 2 ) NOT NULL,
    ExchangeRate DECIMAL(12 , 6 )
);
  
 CREATE TABLE SHIPMENT_ITEM (
 ShipmentItemID	INT				NOT NULL PRIMARY KEY auto_increment,
 ShipmentID		INT(11)			NOT NULL,
 ItemID			INT	(11)		NOT NULL,
 Value			DECIMAL(12,2)	NOT NULL
 CONSTRAINT		Shipment_PK		PRIMARY KEY(ShipmentID)
 );
 
