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
alter table tb_member add column point int after grade;
alter table member2 add column name_jp varchar(45) after nickname;
alter table member2 add column name_ch varchar(45) after nickname;


-- INSERT INTO tb_tell(
-- nickname
-- ,name_eng
-- ,name_jp
-- ,name_ch
-- ,name_ch
-- )
-- VALUES(
-- "nickname"
-- ,"name_eng"
-- ,"name_jp"
-- ,"name_ch"
-- ,"name_ch"
-- )
-- ;


-- 컬럼삭제
ALTER TABLE member2 DROP name_eng;
ALTER TABLE member2 DROP name_ch;
ALTER TABLE member2 DROP name_jp;
ALTER TABLE member2 DROP name_ko;

-- 컬럼변경 (데이터 타입)
alter table member2 modify column nickname int;

-- 컬럼 이름 변경
ALTER TABLE tb_add CHANGE COLUMN nickname nick varchar(45);

-- 테이블 이름 변경
RENAME TABLE tb_option_sellect TO tb_option_select;

-- 컬럼 삭제
ALTER TABLE tb_product DROP COLUMN stock;

-- 로우 삭제
DELETE FROM member2 WHERE SEQ > 0;

-- 시퀀스 시작순서
ALTER TABLE tb_option_name AUTO_INCREMENT = 1;

select * From member2;



-- 캐릭터셋 설정
ALTER DATABASE kthdb1 CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- 캐릭터셋 확인
show variables like 'c%';

