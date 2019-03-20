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
-- Table `mydb`.`STUDENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STUDENTS` (
  `StudentUniversityID` INT NOT NULL,
  `StudentLastName` VARCHAR(45) NOT NULL,
  `StudentFirstName` VARCHAR(45) NOT NULL,
  `StudentEmail` VARCHAR(50) NULL,
  PRIMARY KEY (`StudentUniversityID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`MENTORS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MENTORS` (
  `MentorID` INT NOT NULL,
  `MentorLastName` VARCHAR(45) NOT NULL,
  `MentorFirstName` VARCHAR(45) NOT NULL,
  `MentorEmail` VARCHAR(50) NULL,
  `StudentUniversityID` INT NOT NULL,
  PRIMARY KEY (`MentorID`),
  INDEX `fk_MENTORS_STUDENTS1_idx` (`StudentUniversityID` ASC),
  CONSTRAINT `fk_MENTORS_STUDENTS1`
    FOREIGN KEY (`StudentUniversityID`)
    REFERENCES `mydb`.`STUDENTS` (`StudentUniversityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`FACULTY_ADVISOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FACULTY_ADVISOR` (
  `FacultyUniversityID` INT NOT NULL,
  `FacultyLastName` VARCHAR(45) NOT NULL,
  `FacultyFirstName` VARCHAR(45) NOT NULL,
  `FacultyEmail` VARCHAR(50) NULL,
  `StudentUniversityID` INT NOT NULL,
  `MentorID` INT NOT NULL,
  PRIMARY KEY (`FacultyUniversityID`, `StudentUniversityID`, `MentorID`),
  INDEX `fk_FACULTY_ADVISOR_STUDENTS1_idx` (`StudentUniversityID` ASC),
  INDEX `fk_FACULTY_ADVISOR_MENTORS1_idx` (`MentorID` ASC),
  CONSTRAINT `fk_FACULTY_ADVISOR_STUDENTS1`
    FOREIGN KEY (`StudentUniversityID`)
    REFERENCES `mydb`.`STUDENTS` (`StudentUniversityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACULTY_ADVISOR_MENTORS1`
    FOREIGN KEY (`MentorID`)
    REFERENCES `mydb`.`MENTORS` (`MentorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
