use kthdb1;



CREATE TABLE IF NOT EXISTS `kthdb1`.`member2` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;

-- 칼럼추가
alter table member2 add column nickname varchar(45);
alter table member2 add column name_eng varchar(45) after nickname;
alter table member2 add column name_jp varchar(45) after nickname;
alter table member2 add column name_ch varchar(45) after nickname;
alter table member2 add column name_kor varchar(45) after nickname;

-- 칼럼삭제
ALTER TABLE `member2` DROP `name_kor`;

-- 칼럼변경
alter table member2 modify column nickname int;

-- 칼럽 이름 변경
alter table member2 change column nickname nick varchar(45);

-- 시퀀스 순서
-- ALTER TABLE tb_member AUTO_INCREMENT = 1;
-- ALTER TABLE tb_tell AUTO_INCREMENT = 1;


select * From member2;