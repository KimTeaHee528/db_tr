CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_product` (
  `seq` INT NOT NULL AUTO_INCREMENT AUTO_INCREMENT,
  `over_sea_ny` TINYINT NULL,
  `title` VARCHAR(45) NULL,
  `price` INT NULL,
  `reg_date` DATE NULL,
  `delivery_fee` INT NULL,
  `link` VARCHAR(45) NULL,
  `discount` INT NULL COMMENT '0~100%',
  `overseas_ny` TINYINT NULL COMMENT '국내:0/ 해외:1',
  `stock` INT NULL,
  `brand_name` VARCHAR(45) NULL,
  `brand_logo` VARCHAR(45) NULL,
  `brand_tell` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_tag` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_product_tag` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_tag_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_product_tag_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_product_tag_tb_tag1_idx` (`tb_tag_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_product_tag_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `kthdb1`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_product_tag_tb_tag1`
    FOREIGN KEY (`tb_tag_seq`)
    REFERENCES `kthdb1`.`tb_tag` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `pw` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `grade` TINYINT NULL,
  `address` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` TINYINT NULL,
  `age` INT NULL,
  `dob` DATE NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_like` (
  `tb_member_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  INDEX `fk_tb_like_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_like_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_like_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_like_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `kthdb1`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_cupon` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `discount` INT NULL,
  `cupon_name` VARCHAR(45) NULL,
  `discount_type` TINYINT NULL COMMENT '퍼센트 할인:0/금액할인:1/배송비할인:2',
  `overlap_ny` TINYINT NULL COMMENT '쿠폰 중복적용 가능1/불가능0',
  `expiration_period` DATE NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_cupon_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_cupon_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  INDEX `fk_tb_cupon_product_tb_cupon1_idx` (`tb_cupon_seq` ASC) VISIBLE,
  INDEX `fk_tb_cupon_product_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  CONSTRAINT `fk_tb_cupon_product_tb_cupon1`
    FOREIGN KEY (`tb_cupon_seq`)
    REFERENCES `kthdb1`.`tb_cupon` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cupon_product_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `kthdb1`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_member_cupon` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_member_seq` INT NOT NULL,
  `tb_cupon_seq` INT NOT NULL,
  `acquisition_date` DATE NULL,
  INDEX `fk_tb_member_cupon_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_member_cupon_tb_cupon1_idx` (`tb_cupon_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  CONSTRAINT `fk_tb_member_cupon_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_member_cupon_tb_cupon1`
    FOREIGN KEY (`tb_cupon_seq`)
    REFERENCES `kthdb1`.`tb_cupon` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_order` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_member_cupon_seq` INT NOT NULL,
  `tb_member_seq` INT NOT NULL,
  `order_date` DATETIME NULL,
  `progress` TINYINT NULL,
  `ordercol` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_order_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_order_tb_member_cupon1_idx` (`tb_member_cupon_seq` ASC) VISIBLE,
  INDEX `fk_order_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_order_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `kthdb1`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_tb_member_cupon1`
    FOREIGN KEY (`tb_member_cupon_seq`)
    REFERENCES `kthdb1`.`tb_member_cupon` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_option` (
  `seq` INT NOT NULL AUTO_INCREMENT COMMENT '옵션그룹이랑 바스켓은 장바구니 구현용',
  `tb_product_seq` INT NOT NULL,
  `option_name` VARCHAR(45) NULL COMMENT '옵션에 매겨지는 이름들(색상, 사이즈)',
  `option_detail` VARCHAR(45) NULL,
  `price_a` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_option_tb_product_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_option_tb_product`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `kthdb1`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_option_sellect` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_option_seq` INT NOT NULL,
  `tb_order_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_option_sellect_tb_option1_idx` (`tb_option_seq` ASC) VISIBLE,
  INDEX `fk_tb_option_sellect_order1_idx` (`tb_order_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_option_sellect_tb_option1`
    FOREIGN KEY (`tb_option_seq`)
    REFERENCES `kthdb1`.`tb_option` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_option_sellect_order1`
    FOREIGN KEY (`tb_order_seq`)
    REFERENCES `kthdb1`.`tb_order` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `kthdb1`.`tell` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tell_num` VARCHAR(45) NULL,
  `tell_type` VARCHAR(45) NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tell_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tell_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_addess` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `addess` VARCHAR(45) NULL,
  `address_type` TINYINT NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_addess_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_addess_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;