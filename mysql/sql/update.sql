use kthdb1;

-- UPDATE tb_member SET dob = '1995-05-28', address = '광주' WHERE seq = 5;
UPDATE tb_member SET 
	address = null
WHERE 1=1
and name like '%천%'
;