/* if not exists -> 기존에 동일한 이름의 테이블이 없으면 생성 있으면 생성X */
create table if not exists product(
p_id varchar(10) not null,
p_name varchar(20),
p_unitPrice integer,
p_description text,
p_category varchar(20),
p_manufacturer varchar(20),
p_unitsinstock long,
p_condition varchar(20),
p_fileName varchar(20),
primary key(p_id)
)default CHARSET=UTF8;


select * from product;

drop table product;

insert into product values('P1234','iPhone',800000,'1330x750 Retina HD Display, 8-MegaPixel iSight Camera','Smart Phone','Apple',1000,'new','P1234.png');
insert into product values('P1235','LG PC Gram',1500000,'3.3-inch,Ips LED display, 5rd Generation intel Core processors','NoteBook','LG',1000,'new','P1235.png');
insert into product values('P1236','Galaxy Tab S',900000,'3.3-inch, 212*125.6*6mm, Super AMOLED Display, Octa-Core processors','Tablet','삼성',1000,'new','P1236.png');