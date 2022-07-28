use kthdb1;

SELECT
	seq
	,id
    ,pw
    ,name
    ,grade
    ,address
    ,gender
    ,dob
FROM tb_member
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
SELECT * from tb_member;
SELECT * from tb_tell;
SELECT * from tb_member,tb_tell;
