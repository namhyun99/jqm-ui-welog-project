create table userdb (
userid varchar2(50) not null primary key,
passwd varchar2(50) not null,
name varchar2(50) not null,
email varchar2(50),
hp varchar2(50),
consent varchar2(10) not null,
privacy varchar2(10) not null,
join_date date default sysdate
);


insert into userdb(userid,passwd,name,email,hp,consent,privacy) values ('kim1','123qweasd@','김철수','kim1@naver.com','01011112222','동의','동의');
insert into userdb(userid,passwd,name,email,hp,consent,privacy) values ('lee1','123qweasd@','이아무개','lee1@gamil.com','01012345678','동의','동의');


commit;

select * from userdb;
