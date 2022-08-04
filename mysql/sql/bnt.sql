use kthdb1;

-- 로그인 

select * From tb_member a where 1=1 and id="spm528" and pw = "4dsd64"
;

-- 상품기준 상품 목록 (로봇채크)
select
p.seq
,p.title
,p.price
,i.image_url
,t.tag_name
from tb_product p
inner join tb_image i on i.tb_product_seq = p.seq
inner join tb_product_tag pt on pt.tb_product_seq = p.seq
inner join tb_tag t on t.seq = pt.seq
where 1=1
and i.image_type = 1
and t.tag_name = "로봇"
;

-- 태그기준 상품 목록
select
p.seq
,p.title
,p.price
,i.image_url
,t.tag_name
,pt.*
from tb_tag t
inner join tb_product_tag pt on i.tb_product_seq = p.seq
inner join tb_product_tag pt on pt.tb_product_seq = p.seq
inner join tb_tag t on t.seq = pt.seq
;


-- 코드그룹
select
a.seq
,a.code_group_name
,b.seq
,b.code_name
from ccg a
inner join cc b on b.ccg_seq = a.seq
;