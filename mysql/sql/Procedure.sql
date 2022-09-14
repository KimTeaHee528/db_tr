use toyshop;

drop table toyshop.`PRODUCT`;
SELECT * FROM toyshop.`PRODUCT`;

CREATE TABLE IF NOT EXISTS `toyshop`.`PRODUCT` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `price` INT NULL,
  `detail_img` VARCHAR(45) NULL,
  `stock` INT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
;




DELIMITER $$
DROP PROCEDURE IF EXISTS insertLoop$$
CREATE PROCEDURE insertLoop()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO toyshop.PRODUCT(
			category_id
			, name
			, price
			, detail_img
			, stock
			)
		VALUES (
			i
			, concat(CONCAT
					   (
                       
					   CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
					   , CHAR(RAND() * 24 + 97)
                       
					   )
				   )
			, FLOOR(RAND() * 100)*5000
			, concat(CONCAT
						   (CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , '/'
                           ,CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , '/'
                           ,CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , '/'
                           ,CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , '/'
                           ,CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
                           , CHAR(RAND() * 24 + 97)
							)
					)
                    
			, FLOOR(RAND() * 100)*FLOOR(RAND() * 100)*10
			);
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER $$
CALL insertLoop;
$$

CALL insertLoop();



UPDATE tb_ccg SET 
	code_group_name =
    ,code_en_name =
    ,use_ny =
    ,reg_date =
    ,mod_date =
    value 
WHERE 1=1
	and seq = 3
;




