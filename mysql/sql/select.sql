use kthdb1;

CREATE TABLE IF NOT EXISTS `kthdb1`.`member2` (
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

SELECT
	seq
	,id
    ,pw
    ,name
    ,grade
    ,address
    ,gender
    ,dob
FROM member2
-- where 1=1
-- 	and seq = 5
-- 	and id = gsdhm528
-- 	and pw = ssbhfd64sd
-- 	and name = 김태희
-- 	and grade = 1
-- 	and address = '광주'
-- 	and gender = 2
-- 	and dob = 1995-05-28
;

-- ===================
-- select 활용
-- ===============
select * from tb_member
where 1=1
and name like '%태%'
;
select * from tb_member
where 1=1
and dob between '2000-01-01' and '2010-01-01'
;
select * from tb_member
where 1=1
and address is null
;
select * from tb_member
where 1=1
and address is null
;
select * from tb_member
where 1=1
and address = ''
;


SELECT * from tb_member;
SELECT * from tb_tell;
SELECT * from tb_address;
SELECT * from tb_email;
SELECT * from tb_product;
SELECT * from tb_tag;
SELECT * from tb_product_tag;
SELECT * from tb_brand;
SELECT * from tb_brand_product;
SELECT * from tb_like;
SELECT * from tb_cupon;
SELECT * from tb_cupon_product;
SELECT * from tb_member_cupon;
SELECT * from tb_image;


