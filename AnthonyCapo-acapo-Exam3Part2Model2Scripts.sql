-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`STAFF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STAFF` (
  `StaffID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(50) NULL,
  `Username` VARCHAR(16) NOT NULL,
  `Password` VARCHAR(40) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(50) NULL,
  `CreateDate` DATETIME NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`RENTAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RENTAL` (
  `RentalID` INT NOT NULL,
  `RentalDate` DATETIME NOT NULL,
  `InventoryID` MEDIUMINT(8) NOT NULL,
  `ReturnDate` DATETIME NULL,
  `StaffID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`RentalID`),
  INDEX `fk_RENTAL_STAFF_idx` (`StaffID` ASC),
  INDEX `fk_RENTAL_CUSTOMER1_idx` (`CustomerID` ASC),
  CONSTRAINT `fk_RENTAL_STAFF`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`STAFF` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENTAL_CUSTOMER1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`CUSTOMER` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAYMENT` (
  `PaymentID` INT NOT NULL,
  `Amount` DECIMAL(5,2) NOT NULL,
  `PaymentDate` DATETIME NOT NULL,
  `CustomerID` INT NOT NULL,
  `RentalID` INT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `fk_PAYMENT_CUSTOMER1_idx` (`CustomerID` ASC),
  INDEX `fk_PAYMENT_RENTAL1_idx` (`RentalID` ASC),
  CONSTRAINT `fk_PAYMENT_CUSTOMER1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`CUSTOMER` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PAYMENT_RENTAL1`
    FOREIGN KEY (`RentalID`)
    REFERENCES `mydb`.`RENTAL` (`RentalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
