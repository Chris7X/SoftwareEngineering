-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Rilevazione_Presenze
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Rilevazione_Presenze
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Rilevazione_Presenze` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Rilevazione_Presenze` ;

-- -----------------------------------------------------
-- Table `Rilevazione_Presenze`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rilevazione_Presenze`.`Role` (
  `ID_Role` INT NOT NULL COMMENT '',
  `Name_Role` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`ID_Role`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rilevazione_Presenze`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rilevazione_Presenze`.`User` (
  `ID_User` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Name` VARCHAR(15) NOT NULL COMMENT '',
  `Surname` VARCHAR(15) NOT NULL COMMENT '',
  `Username` VARCHAR(25) NOT NULL COMMENT '',
  `Password` VARCHAR(25) NOT NULL COMMENT '',
  `Role_ID` INT NOT NULL COMMENT '',
  `Telephone` VARCHAR(10) NULL COMMENT '',
  `Email` VARCHAR(25) NULL COMMENT '',
  PRIMARY KEY (`ID_User`)  COMMENT '',
  INDEX `Role_ID_idx` (`Role_ID` ASC)  COMMENT '',
  CONSTRAINT `Role_ID`
    FOREIGN KEY (`Role_ID`)
    REFERENCES `Rilevazione_Presenze`.`Role` (`ID_Role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rilevazione_Presenze`.`Event_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rilevazione_Presenze`.`Event_Type` (
  `ID_Type` INT NOT NULL COMMENT '',
  `Name_Type` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`ID_Type`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rilevazione_Presenze`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rilevazione_Presenze`.`Event` (
  `ID_Event` INT NOT NULL COMMENT '',
  `Hour` DATETIME NOT NULL COMMENT '',
  `Date` DATE NOT NULL COMMENT '',
  `Type_ID` INT NOT NULL COMMENT '',
  `User_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`ID_Event`)  COMMENT '',
  INDEX `Type_ID_idx` (`Type_ID` ASC, `User_ID` ASC)  COMMENT '',
  CONSTRAINT `User_ID`
    FOREIGN KEY (`Type_ID` , `User_ID`)
    REFERENCES `Rilevazione_Presenze`.`User` (`ID_User` , `ID_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Type_ID`
    FOREIGN KEY (`Type_ID` , `User_ID`)
    REFERENCES `Rilevazione_Presenze`.`Event_Type` (`ID_Type` , `ID_Type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
