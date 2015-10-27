-- TO USE THIS FILE IN Cloud9
-- Run this command inside the MySQL command line client:
--
-- source ~/workspace/basic-database-enabled-php-app/db/db-init.sql
--
-- Be careful! This file will DROP the existing library database.

-- Drop the existing library database.
DROP DATABASE `library`;

-- Create a new, empty library database.
CREATE DATABASE `library`;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`patron`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`patron` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `firstname` VARCHAR(45) NOT NULL COMMENT '',
  `lastname` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`patron_has_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`patron_has_book` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `patron_id` INT NOT NULL COMMENT '',
  `book_id` INT NOT NULL COMMENT '',
  `borrowed_on` DATETIME NOT NULL COMMENT '',
  `returned_on` DATETIME NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `patron_id`, `book_id`)  COMMENT '',
  INDEX `fk_patron_has_book_book1_idx` (`book_id` ASC)  COMMENT '',
  INDEX `fk_patron_has_book_patron_idx` (`patron_id` ASC)  COMMENT '',
  CONSTRAINT `fk_patron_has_book_patron`
    FOREIGN KEY (`patron_id`)
    REFERENCES `library`.`patron` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patron_has_book_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `library`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `library`.`patron`
-- -----------------------------------------------------
START TRANSACTION;
USE `library`;
INSERT INTO `library`.`patron` (`id`, `firstname`, `lastname`) VALUES (1, 'Jon', 'Ser');
INSERT INTO `library`.`patron` (`id`, `firstname`, `lastname`) VALUES (2, 'Ryan', 'Power');
INSERT INTO `library`.`patron` (`id`, `firstname`, `lastname`) VALUES (3, 'Ross', 'Hill');
INSERT INTO `library`.`patron` (`id`, `firstname`, `lastname`) VALUES (4, 'Cameron', 'Raymond');

COMMIT;


-- -----------------------------------------------------
-- Data for table `library`.`book`
-- -----------------------------------------------------
START TRANSACTION;
USE `library`;
INSERT INTO `library`.`book` (`id`, `title`) VALUES (1, 'The Manga Guide to Databases');
INSERT INTO `library`.`book` (`id`, `title`) VALUES (2, 'The Manga Guide to Calculus');
INSERT INTO `library`.`book` (`id`, `title`) VALUES (3, 'The Manga Guide to Linear Algebra');

COMMIT;


-- -----------------------------------------------------
-- Data for table `library`.`patron_has_book`
-- -----------------------------------------------------
START TRANSACTION;
USE `library`;
INSERT INTO `library`.`patron_has_book` (`id`, `patron_id`, `book_id`, `borrowed_on`, `returned_on`) VALUES (1, 1, 1, '2015-11-07', DEFAULT);
INSERT INTO `library`.`patron_has_book` (`id`, `patron_id`, `book_id`, `borrowed_on`, `returned_on`) VALUES (2, 2, 2, '2015-09-15', '2015-09-30');

COMMIT;

