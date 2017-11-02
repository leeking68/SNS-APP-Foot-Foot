DROP TABLE BEACON CASCADE CONSTRAINTS;
DROP SEQUENCE seq_beacon;

CREATE TABLE BEACON (
	B_IDX NUMBER(16),	/*비콘 게시 번호 */
	B_ID VARCHAR2(200) NOT NULL, /* 비콘아이디 */
	B_SPOTNAME VARCHAR2(200), /* 비콘장소명 */
	B_LOCACTION VARCHAR2(200), /* 비콘장소위치 */
	B_PAGE VARCHAR2(200), /* 비콘페이지 */
	B_IMG VARCHAR2(300), /* 비콘 이미지 */
	CONSTRAINT PK_BEACON PRIMARY KEY(B_IDX)
);

insert into BEACON 
values(seq_beacon.nextval, 'FF:C9:DD:C2:19:2E', '롯데월드', '매표소', 'http://www.lotteworld.com/' ,'img/lotte.png');

insert into BEACON 
values(seq_beacon.nextval, 'D2:AB:0E:EC:C7:B0', '크리스피크림', '잠실점', 'http://http://www.krispykreme.co.kr/', 'img/cream.png');

create sequence seq_beacon
  start with 1
  increment BY 1
;

select * from beacon;

delete from BEACON where b_id='FF:C9:DD:C2:19:2E';

/* 롯데 */
select * from beacon where b_id = 'FF:C9:DD:C2:19:2E';

/* 크리스피 'D2:AB:0E:EC:C7:B0' */

