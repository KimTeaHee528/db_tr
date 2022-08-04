use kthdb1;

select
a.seq
,a.id
,a.pw
,b.seq
,b.tell_type
from tb_member a
left join tb_tell b on b.tb_member_seq = a.seq
;

select
a.seq
,a.id
,a.pw
,b.seq
,b.tell_type
from tb_member a
inner join tb_tell b on b.tb_member_seq = a.seq
;