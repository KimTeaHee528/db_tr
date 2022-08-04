use kthdb1;

-- 로그인 

select * From tb_member a where 1=1 and id="spm528" and pw = "4dsd64"
;

-- 상품 목록
select
a.seq
,a.title
,a.price
,b.image_url
from tb_product a
inner join tb_image b on b.product_seq = a.seq
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