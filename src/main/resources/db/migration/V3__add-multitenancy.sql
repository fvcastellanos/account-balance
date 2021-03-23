CREATE TABLE `balance`.`tenant` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `code` CHAR(150) NOT NULL,
  `active` tinyint NOT NULL DEFAULT 0,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

CREATE TABLE `balance`.`user_tenant` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(150) NOT NULL,
  `tenant` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_user_tenant` (`username` ASC, `tenant` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;

DROP TABLE `balance`.`user_account`;
DROP TABLE `balance`.`user`;

ALTER TABLE `balance`.`account` 
DROP COLUMN `balance`,
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `account_number`,
ADD INDEX `idx_account_tenant` (`tenant` ASC);

ALTER TABLE `balance`.`account_type` 
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `name`,
ADD INDEX `idx_account_type_tenant` (`tenant` ASC);

ALTER TABLE `balance`.`provider` 
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `country`,
ADD INDEX `idx_provider_tenant` (`tenant` ASC);

ALTER TABLE `balance`.`scheduled_transaction` 
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `amount`,
ADD INDEX `idx_scheduled_transaction_tenant` (`tenant` ASC);

ALTER TABLE `balance`.`transaction` 
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `currency`,
ADD INDEX `idx_transaction_tenant` (`tenant` ASC);

ALTER TABLE `balance`.`transaction_detail` 
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `image_path`,
ADD INDEX `idx_transaction_detail_tenant` (`tenant` ASC);

ALTER TABLE `balance`.`transaction_type` 
ADD COLUMN `tenant` VARCHAR(150) NOT NULL AFTER `credit`,
ADD INDEX `idx_transaction_type_tenant` (`tenant` ASC);

