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

/* 배송 테이블 */
create table sale(
seq int not null auto_increment,
saleDate varchar(20),
sessionId  varchar(50),
productId varchar(20),
unitPrice int,
saleQty int,
primary key(seq)
)default CHARSET=UTF8;
/* 주문 테이블 */
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
select*from delivery;
drop table sale;
drop table delivery;
insert into sale(saleDate,sessionId,productId,unitPrice,saleQty)values("1","2","3","4","5")