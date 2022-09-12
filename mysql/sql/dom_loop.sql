use toyshop;

SELECT * FROM toyshop.`PRODUCT`;

CREATE TABLE IF NOT EXISTS `toyshop`.`PRODUCT` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `price` INT NULL,
  `detail_img` VARCHAR(45) NULL,
  `stock` INT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
;

