-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema balance
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema balance
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `balance` DEFAULT CHARACTER SET utf8mb4 ;
USE `balance` ;

-- -----------------------------------------------------
-- Table `balance`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`provider` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `country` VARCHAR(10) NOT NULL DEFAULT 'GT',
  PRIMARY KEY (`id`))
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`account_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`account_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`account` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_type_id` INT UNSIGNED NOT NULL,
  `provider_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `account_number` VARCHAR(150) NOT NULL,
  `balance` DOUBLE NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  INDEX `idx_account_name` (`name` ASC),
  INDEX `idx_account_number` (`account_number` ASC),
  INDEX `fk_account_provider_idx` (`provider_id` ASC),
  INDEX `fk_account_account_type1_idx` (`account_type_id` ASC),
  CONSTRAINT `fk_bank_account_bank`
    FOREIGN KEY (`provider_id`)
    REFERENCES `balance`.`provider` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bank_account_account_type1`
    FOREIGN KEY (`account_type_id`)
    REFERENCES `balance`.`account_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL DEFAULT 'User',
  `email` VARCHAR(250) NOT NULL,
  `password` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_user_email` (`email` ASC))
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`transaction_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`transaction_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `credit` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`transaction` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_type_id` INT UNSIGNED NOT NULL,
  `account_id` INT UNSIGNED NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` VARCHAR(250) NULL,
  `amount` DOUBLE NOT NULL DEFAULT 0.00,
  `currency` VARCHAR(10) NOT NULL DEFAULT 'GTQ',
  PRIMARY KEY (`id`),
  INDEX `idx_transaction_date` (`date` ASC),
  INDEX `fk_transaction_transaction_type1_idx` (`transaction_type_id` ASC),
  INDEX `fk_transaction_account1_idx` (`account_id` ASC),
  CONSTRAINT `fk_transaction_transaction_type1`
    FOREIGN KEY (`transaction_type_id`)
    REFERENCES `balance`.`transaction_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_bank_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `balance`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`scheduled_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`scheduled_transaction` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` INT UNSIGNED NOT NULL,
  `transaction_type_id` INT UNSIGNED NOT NULL,
  `cron` VARCHAR(250) NOT NULL,
  `amount` DOUBLE NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  INDEX `fk_scheduled_transaction_account1_idx` (`account_id` ASC),
  INDEX `fk_scheduled_transaction_transaction_type1_idx` (`transaction_type_id` ASC),
  CONSTRAINT `fk_scheduled_transaction_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `balance`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scheduled_transaction_transaction_type1`
    FOREIGN KEY (`transaction_type_id`)
    REFERENCES `balance`.`transaction_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`transaction_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`transaction_detail` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` INT UNSIGNED NOT NULL,
  `image_path` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_detail_transaction1_idx` (`transaction_id` ASC),
  CONSTRAINT `fk_transaction_detail_transaction1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `balance`.`transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `balance`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `balance`.`user_account` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_account_account1_idx` (`account_id` ASC),
  INDEX `fk_user_account_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_account_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `balance`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_account_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `balance`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB ROW_FORMAT=DYNAMIC
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
