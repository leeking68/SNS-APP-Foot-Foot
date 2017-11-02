

CREATE SEQUENCE SEQ_RE_NUM;

CREATE TABLE REPLY (
RE_NUM VARCHAR2(30),
RE_CON VARCHAR2(100),
DOC_NUM VARCHAR2(40),
USER_ID VARCHAR2(40)
);

alter table reply add(nickname varchar2(30));
alter table reply add(re_date date default sysdate);

alter table reply add(re_date date default sysdate);

select * from reply;