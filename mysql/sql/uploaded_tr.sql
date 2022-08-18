use kthdb1;


drop table product_uploaded_tr;

CREATE TABLE IF NOT EXISTS `kthdb1`.`product_uploaded_tr` (
  `seq` BIGINT NOT NULL AUTO_INCREMENT,
  `type` TINYINT NULL,
  `default_ny` TINYINT NULL,
  `sort` TINYINT NULL,
  `original_name` VARCHAR(45) NULL,
  `uuid_name` VARCHAR(45) NULL,
  `ext` VARCHAR(45) NULL,
  `size` BIGINT NULL,
  `del_ny` TINYINT NULL,
  `pseq` BIGINT NULL,
  PRIMARY KEY (`seq`))
ENGINE = MyISAM
;


insert into product_uploaded_tr(
	type
	,default_ny
	,sort
	,original_name
	,uuid_name
	,ext
    ,size
	,del_ny
	,pseq
)
value(
	0
    ,1
    ,1
    ,"rccar_01.png"
    ,"5kjhf-fred-ae-sdb_01.png"
    ,"png"
    ,754865
    ,0
    ,1
),(
	0
    ,0
    ,2
    ,"rccar_02.png"
    ,"5kjhf-fred-ae-sdb_02.png"
    ,"png"
    ,1548657
    ,0
    ,1
),(
	1
    ,0
    ,3
    ,"rccar_03.png"
    ,"5kjhf-fred-ae-sdb_03.png"
    ,"png"
    ,584654
    ,0
    ,1
),(
	0
    ,1
    ,1
    ,"dron_01.png"
    ,"th6dzfred-ae-sdb_01.png"
    ,"png"
    ,123556
    ,0
    ,2
),(
	0
    ,0
    ,2
    ,"dron_02.png"
    ,"th6dzfred-ae-sdb_02.png"
    ,"png"
    ,1548956
    ,0
    ,2
),(
	1
    ,0
    ,3
    ,"dron_03.png"
    ,"th6dzfred-ae-sdb_03.png"
    ,"png"
    ,548975
    ,0
    ,2
)
;


delete from product_uploaded_tr where seq>0;

select * from product_uploaded_tr;