-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Esami
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Esami
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Esami` DEFAULT CHARACTER SET utf8 ;
USE `Esami` ;

-- -----------------------------------------------------
-- Table `Esami`.`Corsi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Esami`.`Corsi` (
  `codice` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `oreLezione` INT NOT NULL,
  `crediti_lezione` INT NOT NULL,
  `crediti_esercitazione` INT NOT NULL,
  `oreEsercitazione` INT NOT NULL,
  PRIMARY KEY (`codice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Esami`.`Corso di Laurea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Esami`.`Corso di Laurea` (
  `codice` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `tipologia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Esami`.`Studenti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Esami`.`Studenti` (
  `matricola` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  `iscritto` INT NOT NULL,
  PRIMARY KEY (`matricola`, `iscritto`),
  INDEX `fk_Studenti_Corso di Laurea1_idx` (`iscritto` ASC) VISIBLE,
  CONSTRAINT `fk_Studenti_Corso di Laurea1`
    FOREIGN KEY (`iscritto`)
    REFERENCES `Esami`.`Corso di Laurea` (`codice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Esami`.`Esame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Esami`.`Esame` (
  `codice` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Voto` INT NULL,
  `sostiene` INT NOT NULL,
  `relativo_a` INT NOT NULL,
  PRIMARY KEY (`codice`, `sostiene`, `relativo_a`),
  INDEX `fk_Esame_Studenti_idx` (`sostiene` ASC) VISIBLE,
  INDEX `fk_Esame_Corsi1_idx` (`relativo_a` ASC) VISIBLE,
  CONSTRAINT `fk_Esame_Studenti`
    FOREIGN KEY (`sostiene`)
    REFERENCES `Esami`.`Studenti` (`matricola`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Esame_Corsi1`
    FOREIGN KEY (`relativo_a`)
    REFERENCES `Esami`.`Corsi` (`codice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Esami`.`Afferisce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Esami`.`Afferisce` (
  `Corso di Laurea_codice` INT NOT NULL,
  `Corsi_codice` INT NOT NULL,
  PRIMARY KEY (`Corso di Laurea_codice`, `Corsi_codice`),
  INDEX `fk_Corso di Laurea_has_Corsi_Corso di Laurea1_idx` (`Corso di Laurea_codice` ASC) VISIBLE,
  INDEX `fk_Corso di Laurea_has_Corsi_Corsi1_idx` (`Corsi_codice` ASC) VISIBLE,
  CONSTRAINT `fk_Corso di Laurea_has_Corsi_Corso di Laurea1`
    FOREIGN KEY (`Corso di Laurea_codice`)
    REFERENCES `Esami`.`Corso di Laurea` (`codice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Corso di Laurea_has_Corsi_Corsi1`
    FOREIGN KEY (`Corsi_codice`)
    REFERENCES `Esami`.`Corsi` (`codice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
