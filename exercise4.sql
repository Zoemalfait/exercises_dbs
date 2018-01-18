-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise4` DEFAULT CHARACTER SET utf8 ;
USE `exercise4` ;

-- -----------------------------------------------------
-- Table `exercise4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Doctor` (
  `idDoctor` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(150) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Salary` DECIMAL(20,2) NULL,
  PRIMARY KEY (`idDoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Medical` (
  `Overtime_rate` DECIMAL NULL,
  `idDoctor` INT NULL,
  INDEX `idDoctor_idx` (`idDoctor` ASC),
  CONSTRAINT `idDoctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Specialist` (
  `Field_area` VARCHAR(45) NULL,
  `idDoctor` INT NULL,
  INDEX `idDoctor_idx` (`idDoctor` ASC),
  CONSTRAINT `idDoctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Patiënt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Patiënt` (
  `idPatiënt` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(150) NULL,
  `Phone_number` VARCHAR(20) NULL,
  `Date_of_birth` DATE NULL,
  PRIMARY KEY (`idPatiënt`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `Date` DATE NULL,
  `Time` TIME NULL,
  `idDoctor` INT NULL,
  `idPatiënt` INT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `idDoctor_idx` (`idDoctor` ASC),
  INDEX `idPatiënt_idx` (`idPatiënt` ASC),
  CONSTRAINT `idDoctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatiënt`
    FOREIGN KEY (`idPatiënt`)
    REFERENCES `exercise4`.`Patiënt` (`idPatiënt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Payment` (
  `idPayment` INT NOT NULL,
  `Details` VARCHAR(155) NULL,
  `Method` VARCHAR(45) NULL,
  `idPatiënt` INT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `idPatiënt_idx` (`idPatiënt` ASC),
  CONSTRAINT `idPatiënt`
    FOREIGN KEY (`idPatiënt`)
    REFERENCES `exercise4`.`Patiënt` (`idPatiënt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Bill` (
  `idBill` INT NOT NULL,
  `Total` VARCHAR(45) NULL,
  `idDoctor` INT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `idDoctor_idx` (`idDoctor` ASC),
  CONSTRAINT `idDoctor`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Paymentbill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Paymentbill` (
  `idPayment` INT NULL,
  `idBill` INT NULL,
  INDEX `idPayment_idx` (`idPayment` ASC),
  INDEX `idBill_idx` (`idBill` ASC),
  CONSTRAINT `idPayment`
    FOREIGN KEY (`idPayment`)
    REFERENCES `exercise4`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idBill`
    FOREIGN KEY (`idBill`)
    REFERENCES `exercise4`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
