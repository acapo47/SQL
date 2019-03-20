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
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `AreaCode` INT NOT NULL,
  `LocalNumber` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `ZipPostalCode` INT NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Email (AK1.1)` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ARTIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ARTIST` (
  `ArtistID` INT NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `Nationality` VARCHAR(45) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
  `DateDeceassed` DATE NOT NULL,
  PRIMARY KEY (`ArtistID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WORK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WORK` (
  `WorkID` INT NOT NULL,
  `Title (AK1.1)` VARCHAR(45) NOT NULL,
  `Copy` VARCHAR(45) NOT NULL,
  `ArtistID` INT NOT NULL,
  `Medium` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `ARTIST_ArtistID` INT NOT NULL,
  PRIMARY KEY (`WorkID`),
  INDEX `fk_WORK_ARTIST1_idx` (`ARTIST_ArtistID` ASC),
  CONSTRAINT `fk_WORK_ARTIST1`
    FOREIGN KEY (`ARTIST_ArtistID`)
    REFERENCES `mydb`.`ARTIST` (`ArtistID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TRANSACTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TRANSACTION` (
  `TransactionID` INT NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `SalePrice` VARCHAR(45) NOT NULL,
  `CustomerID` INT NULL,
  `WorkID` INT NOT NULL,
  `DateSold` DATE NOT NULL,
  `AskingPrice` INT NOT NULL,
  PRIMARY KEY (`TransactionID`),
  INDEX `fk_TRANSACTION_CUSTOMER1_idx` (`CustomerID` ASC),
  INDEX `fk_TRANSACTION_WORK1_idx` (`WorkID` ASC),
  CONSTRAINT `fk_TRANSACTION_CUSTOMER1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`CUSTOMER` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSACTION_WORK1`
    FOREIGN KEY (`WorkID`)
    REFERENCES `mydb`.`WORK` (`WorkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER_ARTIST_INT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER_ARTIST_INT` (
  `ArtistID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `ArtistID`),
  CONSTRAINT `ARTIST_ArtistID`
    FOREIGN KEY (`ArtistID`)
    REFERENCES `mydb`.`ARTIST` (`CUSTOMER_ARTIST_INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMER_has_ARTIST_CUSTOMER1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`CUSTOMER` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
