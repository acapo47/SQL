-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema AnthonyCapo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AnthonyCapo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AnthonyCapo` DEFAULT CHARACTER SET utf8;
USE `AnthonyCapo`;

-- -----------------------------------------------------
-- Table `AnthonyCapo`.`STORE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`STORE` (
  `StoreID` INT NOT NULL,
  `StoreName` CHAR(50) NOT NULL,
  `City` CHAR(50) NOT NULL,
  `Country` CHAR(50) NOT NULL,
  `Phone` CHAR(16) NOT NULL,
  `Fax` CHAR(16) NOT NULL,
  `EmailAddress` VARCHAR(100) NULL,
  `Contact` VARCHAR(50) NULL,
  PRIMARY KEY (`StoreID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnthonyCapo`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`EMPLOYEE` (
  `EmployeeID` INT NOT NULL,
  `LastName` CHAR(35) NOT NULL,
  `FirstName` CHAR(35) NOT NULL,
  `Phone` CHAR(16) NOT NULL,
  `Department` CHAR(35) NOT NULL,
  `Fax` CHAR(16) NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnthonyCapo`.`ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`ITEM` (
  `ItemID` INT NOT NULL,
  `PurchaseDate` DATE NOT NULL,
  `ItemDescription` VARCHAR(100) NOT NULL,
  `Category` CHAR(25) NULL,
  `PriceUSD` DECIMAL(12,2) NOT NULL,
  `StoreID` INT NOT NULL,
  `PurchasingAgentID` INT NOT NULL,
  PRIMARY KEY (`ItemID`),
  INDEX `fk_ITEM_STORE_idx` (`StoreID` ASC),
  INDEX `fk_ITEM_EMPLOYEE1_idx` (`PurchasingAgentID` ASC),
  CONSTRAINT `fk_ITEM_STORE`
    FOREIGN KEY (`StoreID`)
    REFERENCES `AnthonyCapo`.`STORE` (`StoreID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ITEM_EMPLOYEE1`
    FOREIGN KEY (`PurchasingAgentID`)
    REFERENCES `AnthonyCapo`.`EMPLOYEE` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnthonyCapo`.`SHIPPER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`SHIPPER` (
  `ShipperID` INT NOT NULL,
  `ShipperName` CHAR(50) NOT NULL,
  `Phone` CHAR(12) NOT NULL,
  `Fax` CHAR(16) NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  `Contact` CHAR(50) NOT NULL,
  PRIMARY KEY (`ShipperID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnthonyCapo`.`SHIPMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`SHIPMENT` (
  `ShipmentID` INT NOT NULL,
  `ShipperInvoiceNumber` CHAR(45) NOT NULL,
  `Origin` CHAR(35) NOT NULL,
  `Destination` CHAR(35) NOT NULL,
  `ScheduledDepartureDate` DATE NULL,
  `ActualDepartureDate` DATE NULL,
  `EstimatedArrivalDate` DATE NULL,
  `ShipperID` INT NOT NULL,
  `PurchasingAgentID` INT NOT NULL,
  PRIMARY KEY (`ShipmentID`),
  INDEX `fk_SHIPMENT_SHIPPER1_idx` (`ShipperID` ASC),
  INDEX `fk_SHIPMENT_EMPLOYEE1_idx` (`PurchasingAgentID` ASC),
  CONSTRAINT `fk_SHIPMENT_SHIPPER1`
    FOREIGN KEY (`ShipperID`)
    REFERENCES `AnthonyCapo`.`SHIPPER` (`ShipperID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_EMPLOYEE1`
    FOREIGN KEY (`PurchasingAgentID`)
    REFERENCES `AnthonyCapo`.`EMPLOYEE` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnthonyCapo`.`SHIPMENT_ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`SHIPMENT_ITEM` (
  `ShipperID` INT NOT NULL,
  `PurchaseItemID` VARCHAR(45) NOT NULL,
  `InsuredValue` DECIMAL(12,2) NULL,
  `ItemID` INT NOT NULL,
  `ShipmentID` INT NOT NULL,
  PRIMARY KEY (`ShipperID`, `ShipmentID`),
  INDEX `fk_SHIPMENT_ITEM_ITEM1_idx` (`ItemID` ASC),
  INDEX `fk_SHIPMENT_ITEM_SHIPMENT1_idx` (`ShipmentID` ASC),
  CONSTRAINT `fk_SHIPMENT_ITEM_ITEM1`
    FOREIGN KEY (`ItemID`)
    REFERENCES `AnthonyCapo`.`ITEM` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_ITEM_SHIPMENT1`
    FOREIGN KEY (`ShipmentID`)
    REFERENCES `AnthonyCapo`.`SHIPMENT` (`ShipmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnthonyCapo`.`SHIPMENT_RECEIPT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnthonyCapo`.`SHIPMENT_RECEIPT` (
  `ReceiptNumber` INT NOT NULL,
  `ReceiptDate` DATE NOT NULL,
  `ReceiptTime` TIME NOT NULL,
  `ReceiptQuantity` INT NOT NULL,
  `isReceivedUndamged` TINYINT(1) NOT NULL,
  `DamageNotes` VARCHAR(255) NULL,
  `RecevingAgentID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `ShipmentID` INT NOT NULL,
  PRIMARY KEY (`ReceiptNumber`),
  INDEX `fk_SHIPMENT_RECEIPT_EMPLOYEE1_idx` (`RecevingAgentID` ASC),
  INDEX `fk_SHIPMENT_RECEIPT_ITEM1_idx` (`ItemID` ASC),
  INDEX `fk_SHIPMENT_RECEIPT_SHIPMENT1_idx` (`ShipmentID` ASC),
  CONSTRAINT `fk_SHIPMENT_RECEIPT_EMPLOYEE1`
    FOREIGN KEY (`RecevingAgentID`)
    REFERENCES `AnthonyCapo`.`EMPLOYEE` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_RECEIPT_ITEM1`
    FOREIGN KEY (`ItemID`)
    REFERENCES `AnthonyCapo`.`ITEM` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SHIPMENT_RECEIPT_SHIPMENT1`
    FOREIGN KEY (`ShipmentID`)
    REFERENCES `AnthonyCapo`.`SHIPMENT` (`ShipmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
