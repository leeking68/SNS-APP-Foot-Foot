drop table users cascade constraints;

CREATE TABLE users (
	userid VARCHAR2(100) primary key,
	nickname VARCHAR2(100),
	userimg VARCHAR2(100),
	grade VARCHAR2(100)
);

insert into users 
values('user01', '유저원', null, 'kakao');

insert into users  
values('user02', '유저투', null, 'naver');

select * from users;

delete from users where userid ='user01';