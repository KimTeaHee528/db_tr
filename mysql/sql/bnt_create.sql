use bnt;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `pw` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `grade` INT NULL,
  `dob` DATE NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `over_sea_ny` INT NULL,
  `sales_rate` INT NULL,
  `title` VARCHAR(45) NULL,
  `price` INT NULL,
  `reg_date` DATE NULL,
  `delivery_fee` INT NULL,
  `link` VARCHAR(45) NULL,
  `discount` INT NULL COMMENT '0~100%',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`point` (
  `seq` INT NOT NULL,
  `point` INT NULL,
  `reason` INT NULL,
  `due_date` DATETIME NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_point_member` (
  `seq` INT NOT NULL,
  `acquisition_date` DATETIME NULL,
  `point_seq` INT NOT NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_point_member_point1_idx` (`point_seq` ASC) VISIBLE,
  INDEX `fk_tb_point_member_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_point_member_point1`
    FOREIGN KEY (`point_seq`)
    REFERENCES `bnt`.`point` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_point_member_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_email` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `advertise_ny` INT NULL,
  `email_code` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_email_tb_member1_idx` (`email_code` ASC) VISIBLE,
  CONSTRAINT `fk_tb_email_tb_member1`
    FOREIGN KEY (`email_code`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_tell` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tell_num` VARCHAR(45) NULL,
  `tell_type` INT NULL COMMENT '대표번호0 / 휴대폰번호1 / 집전화번호2 / 팩스번호3',
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tell_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tell_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_address` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `zip_code` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `address_detail` VARCHAR(45) NULL,
  `address_type` INT NULL COMMENT '0:회원 주소\n1:회원 기본배송지\n2:회원 추가 배송지\n3:주문별 배송지',
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_addess_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_addess_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_tag` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_product_tag` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_tag_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_product_tag_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_product_tag_tb_tag1_idx` (`tb_tag_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_product_tag_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_product_tag_tb_tag1`
    FOREIGN KEY (`tb_tag_seq`)
    REFERENCES `bnt`.`tb_tag` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_image` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(45) NULL,
  `image_type` INT NULL,
  `tb_product_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_image_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_image_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_brand` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NULL,
  `brand_logo` VARCHAR(45) NULL,
  `brand_account` VARCHAR(45) NULL,
  `brand_tell` VARCHAR(45) NULL,
  `brand_address` VARCHAR(45) NULL,
  `brand_email` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_brand_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_brand_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_brand_product_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_brand_product_tb_brand1_idx` (`tb_brand_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_brand_product_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_brand_product_tb_brand1`
    FOREIGN KEY (`tb_brand_seq`)
    REFERENCES `bnt`.`tb_brand` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_detail` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `detail_type` INT NULL,
  `detail` VARCHAR(45) NULL,
  `tb_product_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_detail_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_detail_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_like` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_member_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  INDEX `fk_tb_like_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_like_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  CONSTRAINT `fk_tb_like_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_like_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_recent_view` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `view_date` DATETIME NULL,
  `tb_member_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_lookup_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_lookup_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_lookup_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_lookup_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_comment` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `registration` DATETIME NULL,
  `edit` DATETIME NULL,
  `tb_product_seq` INT NOT NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_comment_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_comment_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_comment_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_comment_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_reply` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `reply` VARCHAR(45) NULL,
  `registration` DATETIME NULL,
  `edit` DATETIME NULL,
  `tb_comment_seq` INT NOT NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_reply_tb_comment1_idx` (`tb_comment_seq` ASC) VISIBLE,
  INDEX `fk_tb_reply_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_reply_tb_comment1`
    FOREIGN KEY (`tb_comment_seq`)
    REFERENCES `bnt`.`tb_comment` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_reply_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_option` (
  `seq` INT NOT NULL AUTO_INCREMENT COMMENT '옵션그룹이랑 바스켓은 장바구니 구현용',
  `option_name` VARCHAR(45) NULL COMMENT '옵션에 매겨지는 이름들(색상, 사이즈)',
  `option_detail` VARCHAR(45) NULL,
  `option_price` INT NULL,
  `stock` INT NULL,
  `tb_product_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_option_tb_product_idx` (`tb_product_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_option_tb_product`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `bnt`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_order` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NULL,
  `progress` INT NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_order_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_order_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `bnt`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`tb_order_option` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL COMMENT '옵션별 주문 수량',
  `option_set` INT NULL,
  `tb_order_seq` INT NOT NULL,
  `tb_option_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_option_sellect_order1_idx` (`tb_order_seq` ASC) VISIBLE,
  INDEX `fk_tb_option_sellect_tb_option1_idx` (`tb_option_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_option_sellect_order1`
    FOREIGN KEY (`tb_order_seq`)
    REFERENCES `bnt`.`tb_order` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_option_sellect_tb_option1`
    FOREIGN KEY (`tb_option_seq`)
    REFERENCES `bnt`.`tb_option` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`ccg` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `code_group_name` VARCHAR(45) NULL,
  `use_ny` TINYINT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `bnt`.`cc` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `code_name` VARCHAR(45) NULL,
  `use_ny` TINYINT NULL,
  `ccg_seq` INT NOT NULL,
  INDEX `fk_cc_ccg1_idx` (`ccg_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  CONSTRAINT `fk_cc_ccg1`
    FOREIGN KEY (`ccg_seq`)
    REFERENCES `bnt`.`ccg` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;











