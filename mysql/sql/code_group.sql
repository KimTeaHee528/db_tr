use kthdb1;

CREATE TABLE IF NOT EXISTS `kthdb1`.`ccg` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `code_group_name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `kthdb1`.`cc` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `code_name` VARCHAR(45) NULL,
  `use_ny` TINYINT NULL,
  `ccg_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_cc_ccg1_idx` (`ccg_seq` ASC) VISIBLE,
  CONSTRAINT `fk_cc_ccg1`
    FOREIGN KEY (`ccg_seq`)
    REFERENCES `kthdb1`.`ccg` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

SELECT * from ccg;

SELECT * from cc
where 1=1
-- and ccg_seq = 4
;

drop table cc;
drop table ccg;

-- ===========================
-- 인서트
-- ===========================

INSERT INTO ccg(
	code_group_name
)
VALUES(
	"통신사"
),(
	"연락처 종류"
),(
	"이메일분류"
),(
	"주소분류"
),(
	"쿠폰할인 형식"
)
;

INSERT INTO cc(
	code_name
    ,use_ny
    ,ccg_seq
)
VALUES(
	"kt"
    ,1
    ,1
),(
	"skt"
    ,1
    ,1
),(
	"lg"
    ,1
    ,1
),(
	"기본연락처"
    ,1
    ,2
),(
	"비상연락처"
    ,1
    ,2
),(
	"유선번호"
    ,1
    ,2
),(
	"google.com"
    ,1
    ,3
),(
	"naver.com"
    ,1
    ,3
),(
	"hanmail.com"
    ,1
    ,3
),(
	"회원 기본 주소지"
    ,1
    ,4
),(
	"회원 기본 배송지"
    ,1
    ,4
),(
	"회원 추가 배송지"
    ,1
    ,4
),(
	"%할인"
    ,1
    ,5
),(
	"금액 할인"
    ,1
    ,5
),(
	"배송비 할인"
    ,1
    ,5
)
;
