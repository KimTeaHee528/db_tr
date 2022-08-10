use bnt;

insert into ccg(
cod_group_name
,use_ny
)
value(
"성별"
,1
),(
"등급"
,1
),(
"이메일"
,1
),(
"통신사"
,1
),(
"zip_code"
,1
),(
"광고수신"
,1
),(
"주문상태"
,1
)
;

insert into cc(
code_name
,use_ny
,ccg_seq
)
value(
"남자"
,1
,1
)
;



insert into tb_member(
id
,pw
,name
,grade
,dob
,create_date
)
value(
"spm528"
,"8465213sl!"
,"김태희"
,2
,'1991-05-28'
,'2022-12-08'
),(
"th5gbhea"
,"t6he@#"
,"김태태"
,2
,'1989-07-15'
,'2020-10-28 21:00:00'
),(
"tb3st4ba4g"
,"46468eadrsfed#"
,"김희희"
,2
,'2000-03-28'
,'2021-05-25 11:00:00'
),(
"ntshre5246"
,"tshe684#%"
,"박태희"
,3
,'1991-03-22'
,'2021-11-14 15:00:00'
),(
"rgbsert54346"
,"rhea#%"
,"박태태"
,3
,'1991-01-18'
,'2022-01-13 08:00:00'
),(
"ghfd5y3"
,"t6e@jtrysf"
,"박희희"
,1
,'1991-04-05'
,'2016-03-20 13:00:00'
),(
"ugyfku75243"
,"she56841#"
,"이태희"
,1
,'1991-07-30'
,'2015-04-10 15:00:00'
),(
"rgeadf23r"
,"d6zr1g%"
,"이태태"
,1
,'1991-04-08'
,'2017-01-27 17:00:00'
),(
"gbfd5243q"
,"z6rgd1#4"
,"이희희"
,1
,'1991-05-06'
,'2018-01-22 17:30:00'
),(
"gbsfda53"
,"pGSFD#w"
,"최태희"
,3
,'1991-07-07'
,'2019-05-21 18:00:00'
),(
"gbshdn53"
,"GRSD(BHW$#3q513"
,"최희태"
,2
,'2006-06-12'
,'2020-04-06 16:00:00'
)
;

insert into tb_product(
over_sea_ny
,sales_rate
,title
,price
,reg_date
,delivery_fee
,link
,discount
)
value(
0
,3200
,"범블비 무선 RC 변신로봇"
,45000
,'2021-02-03'
,2500
,"arga/theary/hfjkrgh"
,5000
),(
0
,120
,"드론"
,220000
,'2022-06-13'
,2500
,"hega/rhehar/hdaergh"
,10000
),(
0
,2000
,"큰 북극곰 인형"
,35000
,'2020-04-16'
,2500
,"jtua/xcfnry/qheergh"
,0
),(
1
,1500
,"장난감 로켓"
,15000
,'2021-03-17'
,5000
,"fzga/theary/rheargh"
,5000
),(
1
,13000
,"게임보이"
,15000
,'2020-06-06'
,6000
,"zgda/5y3nry/nzghd5t"
,0
),(
0
,50
,"모래삽&바가지"
,12000
,'2019-06-01'
,2000
,"znfd/reynry/rgsfa"
,0
),(
1
,5500
,"오리"
,5000
,'2019-09-17'
,5000
,"rga/raaergh/thr4rghea"
,0
),(
1
,1050
,"고양이 장난감"
,8000
,'2020-12-22'
,5000
,"trsh345/hfdaha/hdaag"
,1000
),(
1
,600
,"멜빵바지 인형"
,20000
,'2021-03-04'
,6000
,"hfdab/haebd/nfdabf"
,1500
),(
0
,80
,"곰가족"
,50000
,'2022-05-23'
,2500
,"ntead/naer/bear"
,6000
)
;

insert into tb_email(
email
,email_code
,advertise_ny
,tb_member_seq
)
value(
"spmm528@gmail.com"
,1
,0
,1
)
;
