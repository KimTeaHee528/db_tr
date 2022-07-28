use kthdb1;



CREATE TABLE IF NOT EXISTS `kthdb1`.`member2` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
;


-- 컬럼추가
alter table member2 add column nickname varchar(45);
alter table member2 add column name_eng varchar(45) after nickname;
alter table member2 add column name_jp varchar(45) after nickname;
alter table member2 add column name_ch varchar(45) after nickname;
alter table member2 add column name_ch varchar(45) after nickname;


INSERT INTO tb_tell(
nickname
,name_eng
,name_jp
,name_ch
,name_ch
)
VALUES(
"nickname"
,"name_eng"
,"name_jp"
,"name_ch"
,"name_ch"
)
;



-- 컬럼삭제
ALTER TABLE `member2` DROP `name_kor`;

-- 컬럼변경
alter table member2 modify column nickname int;

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN nickname nick varchar(45);

-- 컬럼 삭제
ALTER TABLE member2 DROP COLUMN nick;

-- 로우 삭제
DELETE FROM member2 WHERE SEQ =2;


-- 시퀀스 시작순서
-- ALTER TABLE tb_member AUTO_INCREMENT = 1;
-- ALTER TABLE tb_tell AUTO_INCREMENT = 1;


select * From member2;