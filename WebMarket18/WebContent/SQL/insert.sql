show tables;

select*from member;
select*from product;

insert member(name,passwd)values('홍길동','1234');

update product set p_fileName = "P1235.png" where p_id = "P1235"
update product set p_condition = 'New';

select concat('P',cast(substr(max(p_id),2)as unsigned)+1) from product;

select distinct(p_category)from product;

--Category_Table 생성
create table if not exists category(
seq int not null auto_increment,
categoryName varchar(20) not null,
description varchar(30),
primary key(seq)
)default CHARSET=UTF8;

drop table category;

select*from category;

--Category_Table 데이터 입력
insert into category(categoryName,description)values('Smart Phone','Smart Phone');
insert into category(categoryName,description)values('NoteBook','NoteBook');
insert into category(categoryName,description)values('Tablet','Tablet');

insert into category values('Smart Phone');
insert into category values('NoteBook');
insert into category values('Tablet');
select*from product where p_id='P1234'

update product set(p_name,p_unitPrice,p_description,p_category,p_manufacturer,p_unitsInStock,p_condition,p_fileName)values("1",2,"1","1","1","1",2,"1","1")where p_id="P_1239";
select distinct(trim(categoryName))from category order by seq

select p_id from product where p_id='P1234'

alter table sale add column status int;

update sale set status=3 where productId=;

create table status(
statusNumber int not null auto_increment,
status varchar(20) not null,
primary key(statusNumber)
)default CHARSET=UTF8;

select status,
(case status 
when 1 then '주문 완료'
when 2 then '배송 접수'
when 3 then '배송 중'
when 4 then '배송 완료'
when 5 then '수령 완료'
else '미정'
end)
from sale;

select count(*)from member where id=1

/* 주문 테이블 */
create table sale(
seq int not null auto_increment,
saleDate varchar(20),
sessionId  varchar(50),
productId varchar(20),
unitPrice int,
saleQty int,
status int,	/* 1.결재완료, 2.배송접수, 3.배송중, 4.배송완료, 5.수령완료 */
primary key(seq)
)default CHARSET=UTF8;

/* 배송 테이블 */
create table delivery(
seq int not null auto_increment,
sessionId varchar(50),
name varchar(20),
deliveryDate varchar(20),
nation varchar(20),
zipCode varchar(10),
address varchar(200),
primary key(seq)
)default CHARSET=UTF8;



desc sale
desc delivery;

select*from sale;
select*from status;
select*from delivery;

drop table sale;
drop table delivery;

insert into sale(saleDate,sessionId,productId,unitPrice,saleQty)values("1","2","3","4","5")
insert into status(status)values('주문 완료');
insert into status(status)values('배송 접수');
insert into status(status)values('배송 중');
insert into status(status)values('배송 완료');
insert into status(status)values('수령 완료');


select*from sale s,delivery d where s.sessionId=d.sessionId;
select s.sessionId as '주문번호',s.saleDate as '주문일',s.productId as '제품 번호',p.p_name as '제품 명',s.unitPrice as '제품 가격',s.saleQty as '구매 수량',d.name as '구매자 명',d.deliveryDate as '구매일',d.nation as '배송 국가',d.zipCode as '우편번호',d.address as '배송 주소' from sale s,delivery d,product p where s.sessionId=d.sessionId and s.productId=p.p_id;

select d.seq,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status 
					from sale s,delivery d,status st 
					where s.sessionId=d.sessionId 
					and s.status=st.statusNumber;


select d.seq,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status from sale s,delivery d,product p,status st where s.sessionId=d.sessionId and
s.productId=p.p_id and s.status=st.statusNumber;
      
select status from status;
/* 기존 테이블 삭제 */
drop table member

/* 새 테이블 생성 */
create table member(
id varchar(10) not null,
password varchar(10) not null,
name varchar(10) not null,
gender varchar(4),
birth varchar(10),
mail varchar(30),
phone varchar(20),
postcode varchar(5),
address varchar(200),
detailAddress varchar(100),
extraAddress varchar(50),
regist_day varchar(50),
primary key(id)
)default CHARSET=UTF8;
update sale set status=2 where productId='P1235' and sessionId='FDFE9437BF8171A65EC2D60277B9C3AA'
update sale set status=3 where productId='P1235' and sessionId='FDFE9437BF8171A65EC2D60277B9C3AA';

select productId if (status=1 '결재완료','미정')

select*from status
select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address,st.status from sale s,delivery d,status st where s.sessionId=d.sessionId and s.status=st.statusNumber
select*from sale
select*from member
select*from product

select*from member where id=2

select*from product order by p_id
