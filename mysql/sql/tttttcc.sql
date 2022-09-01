SELECT * FROM kthdb1.tb_cc;



alter table tb_cc add column code_name_en varchar(45) after code_name;
alter table tb_cc add column reg_date date;
alter table tb_cc add column mod_date date;



select
c.seq
,c.ccg_seq
,cg.code_group_name
,c.code_name
,c.code_name_en
,c.use_ny
,c.sort
,c.reg_date
,c.mod_date
from tb_cc c
left join tb_ccg cg on c.ccg_seq = cg.seq
order by cg.seq asc
;