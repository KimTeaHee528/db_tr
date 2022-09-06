use toyshop;

CREATE TABLE IF NOT EXISTS `toyshop`.`ccg` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`cc` (
  `seq` INT NOT NULL,
  `code_name` VARCHAR(45) NULL,
  `use_ny` VARCHAR(45) NULL,
  `ccg_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_cc_ccg3_idx` (`ccg_seq` ASC) VISIBLE,
  CONSTRAINT `fk_cc_ccg3`
    FOREIGN KEY (`ccg_seq`)
    REFERENCES `toyshop`.`ccg` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `id` VARCHAR(45) NULL,
  `online_ny` INT NULL,
  `last_login` DATETIME NULL,
  `pw` VARCHAR(45) NULL,
  `dob` DATETIME NULL,
  `email` VARCHAR(45) NULL,
  `tell` INT NULL,
  `carrier` INT NULL,
  `zip_code` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `address_detail` VARCHAR(45) NULL,
  `gender` INT NULL,
  `job` VARCHAR(45) NULL,
  `create_date` DATETIME NULL,
  `admin_ny` TINYINT NULL,
  `favorite_team_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_member_team1_idx` (`favorite_team_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_member_team1`
    FOREIGN KEY (`favorite_team_seq`)
    REFERENCES `toyshop`.`team` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_tell` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tell_num` VARCHAR(45) NULL,
  `tell_type` INT NULL COMMENT '대표번호0 / 휴대폰번호1 / 집전화번호2 / 팩스번호3',
  `tb_member_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tell_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tell_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_address` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `zip_code` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `address_detail` VARCHAR(45) NULL,
  `address_type` INT NULL COMMENT '0:회원 주소\n1:회원 기본배송지\n2:회원 추가 배송지\n3:주문별 배송지',
  `tb_member_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_addess_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_addess_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_order` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NULL,
  `progress` INT NULL,
  `tb_member_seq` INT NOT NULL,
  `tb_address_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_order_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_order_tb_address1_idx` (`tb_address_seq` ASC) VISIBLE,
  CONSTRAINT `fk_order_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_order_tb_address1`
    FOREIGN KEY (`tb_address_seq`)
    REFERENCES `toyshop`.`tb_address` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `over_sea_ny` INT NULL,
  `sales_rate` INT NULL,
  `title` VARCHAR(45) NULL,
  `price` INT NULL,
  `reg_date` DATE NULL,
  `delivery_fee` INT NULL,
  `link` VARCHAR(45) NULL,
  `discount` INT NULL COMMENT '0~100%',
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_tag` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NULL,
  `del_ny` INT NULL,
  `reg_date` DATETIME NULL,
  `mod_date` DATETIME NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_product_tag` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_tag_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_product_tag_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_product_tag_tb_tag1_idx` (`tb_tag_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_product_tag_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_product_tag_tb_tag1`
    FOREIGN KEY (`tb_tag_seq`)
    REFERENCES `toyshop`.`tb_tag` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_brand` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NULL,
  `brand_logo` VARCHAR(45) NULL,
  `brand_account` VARCHAR(45) NULL,
  `brand_tell` VARCHAR(45) NULL,
  `brand_address` VARCHAR(45) NULL,
  `brand_email` VARCHAR(45) NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_brand_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_brand_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_brand_product_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_brand_product_tb_brand1_idx` (`tb_brand_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_brand_product_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_brand_product_tb_brand1`
    FOREIGN KEY (`tb_brand_seq`)
    REFERENCES `toyshop`.`tb_brand` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_like` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_member_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  `del_ny` INT NULL,
  INDEX `fk_tb_like_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_like_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  CONSTRAINT `fk_tb_like_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_like_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_recent_view` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_member_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_lookup_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_lookup_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_lookup_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_lookup_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_comment` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `registration` DATETIME NULL,
  `edit` DATETIME NULL,
  `tb_product_seq` INT NOT NULL,
  `tb_member_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_comment_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_comment_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_comment_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_comment_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_cupon` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `discount` INT NULL,
  `cupon_name` VARCHAR(45) NULL,
  `due_date` DATETIME NULL,
  `due_date_type` INT NULL COMMENT '쿠폰 자체 기준 / 취득일 기준',
  `reg_date` DATETIME NULL,
  `mod_date` DATETIME NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_member_cupon` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `acquisition_date` DATE NULL,
  `tb_member_seq` INT NOT NULL,
  `tb_cupon_copy_seq` INT NOT NULL,
  `del_ny` INT NULL,
  INDEX `fk_tb_member_cupon_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_member_cupon_tb_cupon_copy1_idx` (`tb_cupon_copy_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_member_cupon_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `toyshop`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_member_cupon_tb_cupon_copy1`
    FOREIGN KEY (`tb_cupon_copy_seq`)
    REFERENCES `toyshop`.`tb_cupon` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_cupon_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_cupon_copy_seq` INT NOT NULL,
  `del_ny` INT NULL,
  INDEX `fk_tb_cupon_product_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_cupon_product_tb_cupon_copy1_idx` (`tb_cupon_copy_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cupon_product_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cupon_product_tb_cupon_copy1`
    FOREIGN KEY (`tb_cupon_copy_seq`)
    REFERENCES `toyshop`.`tb_cupon` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_option` (
  `seq` INT NOT NULL AUTO_INCREMENT COMMENT '옵션그룹이랑 바스켓은 장바구니 구현용',
  `option_name` VARCHAR(45) NULL COMMENT '옵션에 매겨지는 이름들(색상, 사이즈)',
  `option_detail` VARCHAR(45) NULL,
  `option_price` INT NULL,
  `stock` INT NULL,
  `tb_product_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_option_tb_product_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_option_tb_product`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `toyshop`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `toyshop`.`tb_option_select` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL COMMENT '옵션별 주문 수량',
  `option_set` INT NULL,
  `tb_order_seq` INT NOT NULL,
  `tb_option_seq` INT NOT NULL,
  `del_ny` INT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_option_sellect_order1_idx` (`tb_order_seq` ASC) VISIBLE,
  INDEX `fk_tb_option_sellect_tb_option1_idx` (`tb_option_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_option_sellect_order1`
    FOREIGN KEY (`tb_order_seq`)
    REFERENCES `toyshop`.`tb_order` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_option_sellect_tb_option1`
    FOREIGN KEY (`tb_option_seq`)
    REFERENCES `toyshop`.`tb_option` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
