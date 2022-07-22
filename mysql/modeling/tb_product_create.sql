CREATE TABLE IF NOT EXISTS `kthdb1`.`product` (
  `seq` INT NOT NULL COMMENT '상품코드',
  `title` VARCHAR(45) NULL COMMENT '제목',
  `detail_image` VARCHAR(45) NULL COMMENT '제품상세 링크',
  `price` INT NULL COMMENT '가격',
  `overSea-deliveryNY` TINYINT COMMENT '해외배송1/국내배송0',
  `delivery_free` TINYINT NULL COMMENT '배송비 변화 조건',
  `delivery_fee` INT NULL COMMENT '배송비',
  `dicount_price` INT NULL COMMENT '할인가격',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;