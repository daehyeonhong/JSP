show databases;

show tables;
create table member(
id int not null auto_increment,
name varchar(20),
passwd varchar(20),
primary key(id)
)default charset=utf8;
select * from member;
insert into member(name, passwd) values('hong','1234');
insert into member(name, passwd) values('kim','1234');

insert into member(name, passwd) values('kang','1234');
insert into member(name, passwd) values('king','1234');
insert into member(name, passwd) values('wang','1234');
insert into member(name, passwd) values('zzang','1234');
select * from member;

select * from member limit 3;
select name,passwd from member;
select name,passwd from member where id = 3;

select * from member order by name;/* 오름차순 정렬 */
select * from member order by name desc;/* 내림차순 정렬 */
select * from member order by name limit 3;/* 조회 결과 3개만 출력 */

/* update */
update member set name = 'admin' where name='hong';
select * from member;

/* delect */
delete from member where id=4;
select*from member;