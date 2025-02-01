-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT NOT NULL,
  `client_name` VARCHAR(45) NOT NULL,
  `client_adress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `id` INT NOT NULL,
  `order_number` INT NOT NULL,
  `datetime_order` DATETIME NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_client_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `order_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sku` (
  `id` INT NOT NULL,
  `sku_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_composition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_composition` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `sku_id` INT NOT NULL,
  `sku_qty` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_composition_sku_idx` (`sku_id` ASC) VISIBLE,
  INDEX `order_composition_order_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_composition_sku`
    FOREIGN KEY (`sku_id`)
    REFERENCES `mydb`.`sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_composition_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
