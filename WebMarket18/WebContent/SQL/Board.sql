/* Board_Table 생성 */
create table board(
num int not null auto_increment,
id varchar(20)not null,
name varchar(20)not null,
subject varchar(100)not null,
content text not null,
regist_day varchar(30)not null,
hit int,
ip varchar(30),
primary key(num)
)default charset=UTF8;

/* Table 내용 조회 */
select*from board
/* Table 구조 확인 */
desc board
/* Table 삭제*/
drop table board