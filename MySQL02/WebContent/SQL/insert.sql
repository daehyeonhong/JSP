/**/
show tables;

select*from member;
select*from product;

insert member(name,passwd)values('홍길동','1234');

update product set p_fileName = "P1235.png" where p_id = "P1235"
update product set p_condition = 'New';

select concat('P',cast(substr(max(p_id),2)as unsigned)+1) from product;

select distinct(p_category)from product;

create table if not exists category(
category varchar(20),
primary key(category)
)default CHARSET=UTF8;

select*from category;

insert into category values('Smart Phone');
insert into category values('NoteBook');
insert into category values('Tablet');
select*from product where p_id='P1234'