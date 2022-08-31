use kthdb1;
SELECT * FROM kthdb1.tb_ccg;



RENAME TABLE ccg TO tb_ccg;
alter table ccg add column use_ny int;
alter table ccg add column reg_date datetime;
alter table ccg add column mod_date datetime;
