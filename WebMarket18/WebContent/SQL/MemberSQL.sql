select count(*)from member where id='213';
select*from member where id=1;
desc member;
select*from member;

insert into board(id,name,subject,content,regist_day,hit,ip)values('hong','홍길동','제목1','내용1','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('hong','홍길똥2','제목2','내용2','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('hong','홍길동3','제목3','내용3','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('lim','임꺽정','제목4','내용4','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('lim','임꺽쩡2','제목5','내용5','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('lim','임꺽정3','제목6','내용6','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('il','일지매','제목7','내용7','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('il','일지먜2','제목8','내용8','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('il','일지매3','제목9','내용9','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('lee','이지매','제목10','내용10','20200729',0,'127.0.0.1');
insert into board(id,name,subject,content,regist_day,hit,ip)values('lee','이지먜','제목11','내용11','20200729',0,'127.0.0.1');

select*from board

select count(*)from board where subject like'%5%';
select*from board where subject like'%5%';
select*from board order by num desc