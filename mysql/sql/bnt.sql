use kthdb1;
use bnt;

-- 공통코드
select
a.seq
,a.code_group_name
,b.seq
,b.code_name
from ccg a
inner join cc b on b.ccg_seq = a.seq
;

-- 로그인 
select 
m.seq
,m.id
,m.pw
From tb_member m 
where 1=1 
and id="spm528" 
and pw = "4dsd64"
;

-- 상품기준 상품 목록 (상품, 이미지, 태그, 브랜드)
select
p.seq
,p.title
,p.price
,i.image_url
,t.tag_name
,b.brand_name
from tb_product p
left join tb_image i on i.tb_product_seq = p.seq and i.image_type = 1
inner join tb_product_tag pt on pt.tb_product_seq = p.seq
inner join tb_tag t on t.seq = pt.tb_tag_seq							and (t.tag_name = "로봇" or t.tag_name = "인기")
inner join tb_brand_product bp on bp.tb_product_seq = p.seq
inner join tb_brand b on b.seq = bp.tb_brand_seq 						and (b.brand_name = "Lego" or b.brand_name = "손오공")
where 1=1
																		-- and p.seq = 1
																		and p.price <= 35000
;

-- 상품상세 (상품, 이미지, 태그, 브랜드, 디테일, 댓글, 리플)



