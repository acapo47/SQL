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
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ARTIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ARTIST` (
  `ArtistID` INT NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ArtistID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WORK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WORK` (
  `WorkID` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Copy` VARCHAR(45) NOT NULL,
  `ARTIST_ArtistID` INT NOT NULL,
  `ARTIST_ArtistID1` INT NOT NULL,
  PRIMARY KEY (`WorkID`),
  INDEX `fk_WORK_ARTIST1_idx` (`ARTIST_ArtistID1` ASC),
  CONSTRAINT `fk_WORK_ARTIST1`
    FOREIGN KEY (`ARTIST_ArtistID1`)
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
  `WORK_WorkID` INT NULL,
  `CUSTOMER_CustomerID1` INT NOT NULL,
  `WORK_WorkID1` INT NOT NULL,
  PRIMARY KEY (`TransactionID`),
  INDEX `fk_TRANSACTION_CUSTOMER1_idx` (`CUSTOMER_CustomerID1` ASC),
  INDEX `fk_TRANSACTION_WORK1_idx` (`WORK_WorkID1` ASC),
  CONSTRAINT `fk_TRANSACTION_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_CustomerID1`)
    REFERENCES `mydb`.`CUSTOMER` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSACTION_WORK1`
    FOREIGN KEY (`WORK_WorkID1`)
    REFERENCES `mydb`.`WORK` (`WorkID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER_has_ARTIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER_has_ARTIST` (
  `ARTIST_ArtistID` INT NULL,
  `CUSTOMER_CustomerID` INT NOT NULL,
  PRIMARY KEY (`CUSTOMER_CustomerID`),
  CONSTRAINT `ARTIST_ArtistID`
    FOREIGN KEY (`ArtistID`)
    REFERENCES `mydb`.`ARTIST` (`CUSTOMER_has_ARTIST`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMER_has_ARTIST_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_CustomerID`)
    REFERENCES `mydb`.`CUSTOMER` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
