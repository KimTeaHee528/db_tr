use kthdb1;
SELECT * FROM kthdb1.tb_ccg;



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

