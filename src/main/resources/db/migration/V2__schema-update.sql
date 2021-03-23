ALTER TABLE `balance`.`provider` 
ADD UNIQUE INDEX `UQ_NAME_COUNTRY` (`name` ASC, `country` ASC);
