use kthdb1;

CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `over_sea_ny` TINYINT NULL,
  `title` VARCHAR(45) NULL,
  `price` INT NULL,
  `reg_date` DATE NULL,
  `delivery_fee` INT NULL,
  `link` VARCHAR(45) NULL,
  `discount` INT NULL COMMENT '0~100%',
  `overseas_ny` TINYINT NULL COMMENT '국내:0/ 해외:1',
  `stock` INT NULL,
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `pw` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `grade` TINYINT NULL,
  `address` VARCHAR(45) NULL,
  `gender` TINYINT NULL,
  `dob` DATE NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_like` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_member_seq` INT NOT NULL,
  `tb_product_seq` INT NOT NULL,
  INDEX `fk_tb_like_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  INDEX `fk_tb_like_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_tell` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tell_num` VARCHAR(45) NULL,
  `tell_type` TINYINT NULL COMMENT '대표번호0 / 휴대폰번호1 / 집전화번호2 / 팩스번호3',
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tell_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tell_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_email` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `advertise_ny` TINYINT NULL,
  `tb_member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_email_tb_member1_idx` (`tb_member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_email_tb_member1`
    FOREIGN KEY (`tb_member_seq`)
    REFERENCES `kthdb1`.`tb_member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_brand` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NULL,
  `logo` VARCHAR(45) NULL,
  `acount` VARCHAR(45) NULL,
  `tb_brandcol` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_brand_product` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `tb_product_seq` INT NOT NULL,
  `tb_brand_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_tb_brand_product_tb_product1_idx` (`tb_product_seq` ASC) VISIBLE,
  INDEX `fk_tb_brand_product_tb_brand1_idx` (`tb_brand_seq` ASC) VISIBLE,
  CONSTRAINT `fk_tb_brand_product_tb_product1`
    FOREIGN KEY (`tb_product_seq`)
    REFERENCES `kthdb1`.`tb_product` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_brand_product_tb_brand1`
    FOREIGN KEY (`tb_brand_seq`)
    REFERENCES `kthdb1`.`tb_brand` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

delete from tb_tell where seq > 0;
delete from tb_member where seq > 0;


ALTER TABLE tb_member AUTO_INCREMENT = 1;
ALTER TABLE tb_tell AUTO_INCREMENT = 1;


INSERT INTO tb_member(
	id
    ,pw
    ,name
    ,grade
    ,address
    ,gender
    ,dob
)
VALUES(
	'spm528'
    ,"4dsd64"
    ,"김태희"
    ,2
    ,"안산"
    ,1
    ,"2004-05-28"
),(
	'hntsbo8'
    ,"t9ldagsd"
    ,"김바보"
    ,4
    ,"안산"
    ,1
    ,"1985-05-28"
),(
	'hnhe8'
    ,"564agsd"
    ,"김천재"
    ,2
    ,"일산"
    ,3
    ,"1989-05-28"
),(
	'iksbo8'
    ,"75ieagsd"
    ,"김평범"
    ,2
    ,"제주"
    ,2
    ,"1991-05-28"
),(
	'rxgmd42'
    ,"t4bh6agsd"
    ,"김비범"
    ,1
    ,"제주"
    ,2
    ,"2000-05-28"
),(
	'rqa58'
    ,"nt4badagsd"
    ,"김태이"
    ,1
    ,"광주"
    ,4
    ,"2002-05-28"
),(
	'jnryd5bo8'
    ,"n5yedagsd"
    ,"이태희"
    ,1
    ,"김해"
    ,2
    ,"2000-05-28"
),(
	'bsfsbo8'
    ,"wt3abgsd"
    ,"이제주"
    ,1
    ,"제주"
    ,1
    ,"1991-05-28"
),(
	'gbve6564'
    ,"eah43sd"
    ,"박태희"
    ,1
    ,"광주"
    ,1
    ,"1994-05-28"
),(
	'wrg1ab698'
    ,"thfdagsd"
    ,"최태희"
    ,3
    ,"강남"
    ,2
    ,"2014-05-28"
)
;

INSERT INTO tb_tell(
	tell_num
    ,tell_type
    ,tb_member_seq
)
VALUES(
	'010-3015-7203'
    ,0
    ,1
),(
	'010-3245-7203'
    ,1
    ,1
),(
	'02-886-7203'
    ,2
    ,1
),(
	'010-4444-7203'
    ,0
    ,2
),(
	'010-4344-7203'
    ,1
    ,2
),(
	'02-999-7203'
    ,2
    ,2
),(
	'011-2235-7203'
    ,0
    ,3
),(
	'010-4345-7203'
    ,1
    ,3
),(
	'02-4746-7203'
    ,2
    ,3
)
;

