use kthdb1;

-- UPDATE tb_member SET dob = '1995-05-28', address = '광주' WHERE seq = 5;
UPDATE tb_member SET 
	point = 1500
WHERE 1=1
	and seq > 0
    and seq < 5
-- and name like '%천%'
;