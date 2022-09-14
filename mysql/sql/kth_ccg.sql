use kthdb1;
SELECT * FROM kthdb1.tb_cc;



RENAME TABLE cc TO tb_cc;
alter table ccg add column use_ny int;
alter table ccg add column reg_date datetime;
alter table ccg add column mod_date datetime;
alter table tb_ccg add column code_en_name int after code_group_name;

SELECT * FROM kthdb1.tb_cc;

SELECT count(*) FROM tb_cc where ccg_seq=1;

select
cg.seq
,cg.code_group_name
,cg.use_ny
,cg.reg_date
,cg.mod_date
,COUNT(*) cnt
from tb_ccg cg 
left join tb_cc c on cg.seq = c.ccg_seq
GROUP BY cg.seq
;
select
cg.seq
,cg.code_group_name
,cg.use_ny
,cg.reg_date
,cg.mod_date
,c.ccg_seq
from tb_ccg cg 
left join tb_cc c on cg.seq = c.ccg_seq
where 1=1
;


CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_test_ccg` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `code_group_name` VARCHAR(45) NULL,
  `code_en_name` VARCHAR(45) NULL,
  `use_ny` int,
  `reg_date` datetime,
  `mod_date` datetime,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `kthdb1`.`tb_test_cc` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `code_name` VARCHAR(45) NULL,
  `code_name_en` VARCHAR(45) NULL,
  `use_ny` tinyint,
  `ccg_seq` int,
  `reg_date` datetime,
  `mod_date` datetime,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
SELECT * FROM kthdb1.tb_ccg LIMIT 2;
SELECT * FROM kthdb1.tb_cc;

insert into tb_ccg(
	code_group_name
    ,code_en_name
    ,use_ny
    ,reg_date
)
values(
	#{}
)
;

delete from tb_cc where seq > 15;
ALTER TABLE tb_cc AUTO_INCREMENT = 16;

delete from tb_ccg where seq > 5;
ALTER TABLE tb_ccg AUTO_INCREMENT = 6;










