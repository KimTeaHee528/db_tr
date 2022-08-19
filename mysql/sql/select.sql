use kthdb1;


-- 조인으로
select
p.seq
,p.title
,p.price
,i.image_url
,t.tag_name
,b.brand_name
from tb_product p
	left join tb_image i on i.tb_product_seq = p.seq 
		and i.image_type = 1
	inner join tb_product_tag pt on pt.tb_product_seq = p.seq
	inner join tb_tag t on t.seq = pt.tb_tag_seq 
		and (t.tag_name = "로봇" or t.tag_name = "인기")
	inner join tb_brand_product bp on bp.tb_product_seq = p.seq
	inner join tb_brand b on b.seq = bp.tb_brand_seq 
		and (b.brand_name = "Lego" or b.brand_name = "손오공")
	where 1=1
		and p.price <= 35000
    -- asc는 정방향 desc는 역방향
	-- order by p.price asc
	order by p.seq asc
;


-- 서브쿼리로
select
	p.seq
	,p.title
	,p.price
	,(select image_url 
		from tb_image i 
        where 
			i.tb_product_seq = p.seq  
			and image_type = 1) 
	as image_url
	,(select tag_name 
		from tb_tag t 
        where 
			t.seq = pt.tb_tag_seq 
			and t.tag_name IS NOT NULL 
            and (t.tag_name = "로봇" or t.tag_name = "인기"))
	as tag_name
	,(select brand_name 
		from tb_brand b 
        where 
			b.seq = bp.tb_brand_seq 
			and (b.brand_name = "Lego" or b.brand_name = "손오공"))
	as brand_name
from tb_product p
	inner join tb_product_tag pt on pt.tb_product_seq = p.seq
	inner join tb_brand_product bp on bp.tb_product_seq = p.seq
	where 1=1
		and p.price <= 35000
    -- asc는 정방향 desc는 역방향
	-- order by p.price asc
	order by p.seq asc
;

select
	b.seq
    ,b.email
    ,b.email_div
    ,b.advertise_ny
    ,"" as tellnum
    ,"" as carrier
    ,"" as tell_type
from tb_email b
where 1=1
union
select
	a.seq
	,"" as email
    ,"" as email_div
    ,"" as advertise_ny
    ,a.tellnum
    ,a.carrier
    ,a.tell_type
From tb_tell a
where 1=1
;

select * from ccg;














select * from tb_image;




-- ===================
-- select 활용
-- ===============
select * from tb_member
where 1=1
and name like '%태%'
;
select * from tb_member
where 1=1
and dob between '2000-01-01' and '2010-01-01'
;
select * from tb_member
where 1=1
and address is null
;
select * from tb_member
where 1=1
and address is null
;
select * from tb_member
where 1=1
and address = ''
;


SELECT * from tb_member;
SELECT * from tb_tell;
SELECT * from tb_address;
SELECT * from tb_email;
SELECT * from tb_product;
SELECT * from tb_tag;
SELECT * from tb_product_tag;
SELECT * from tb_brand;
SELECT * from tb_brand_product;
SELECT * from tb_like;
SELECT * from tb_cupon;
SELECT * from tb_cupon_product;
SELECT * from tb_member_cupon;
SELECT * from tb_image;


