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
-- Table `mydb`.`SEMINAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SEMINAR` (
  `SeminarID` INT NOT NULL,
  `SeminarDate` DATE NOT NULL,
  `SeminarTime` TIME(8) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `SeminarTitle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SeminarID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `EmailAddress` INT NOT NULL,
  `LastName` VARCHAR(25) NOT NULL,
  `FirstName` VARCHAR(25) NOT NULL,
  `Phone` INT NOT NULL,
  `StreetAddress` VARCHAR(45) NOT NULL,
  `City` VARCHAR(25) NOT NULL,
  `State` VARCHAR(25) NOT NULL,
  `ZIP` INT NOT NULL,
  PRIMARY KEY (`EmailAddress`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`SEMINAR_CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SEMINAR_CUSTOMER` (
  `SeminarID (FK)` INT NOT NULL,
  `EmailAddress (FK)` INT NOT NULL,
  PRIMARY KEY (`SeminarID (FK)`, `EmailAddress (FK)`),
  INDEX `fk_SEMINAR_CUSTOMER_CUSTOMER1_idx` (`EmailAddress (FK)` ASC),
  CONSTRAINT `fk_SEMINAR_CUSTOMER_SEMINAR1`
    FOREIGN KEY (`SeminarID (FK)`)
    REFERENCES `mydb`.`SEMINAR` (`SeminarID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SEMINAR_CUSTOMER_CUSTOMER1`
    FOREIGN KEY (`EmailAddress (FK)`)
    REFERENCES `mydb`.`CUSTOMER` (`EmailAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`CONTACT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONTACT` (
    `ContactDate` DATE NOT NULL,
    `ContactNumber` INT NOT NULL,
    `ContactType` VARCHAR(45) NOT NULL,
    `SeminarID (FK)` INT NULL,
    `EmailAddress (FK)` INT NOT NULL,
    PRIMARY KEY (`ContactDate` , `EmailAddress (FK)`),
    INDEX `fk_CONTACT_SEMINAR_idx` (`SeminarID (FK)` ASC),
    INDEX `fk_CONTACT_CUSTOMER1_idx` (`EmailAddress (FK)` ASC),
    CONSTRAINT `fk_CONTACT_SEMINAR` FOREIGN KEY (`SeminarID (FK)`)
        REFERENCES `mydb`.`SEMINAR` (`SeminarID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_CONTACT_CUSTOMER1` FOREIGN KEY (`EmailAddress (FK)`)
        REFERENCES `mydb`.`CUSTOMER` (`EmailAddress`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
