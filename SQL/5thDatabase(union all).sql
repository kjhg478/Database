SELECT * FROM BOARD;
SELECT * FROM COMMENTS;

CREATE SEQUENCE SEQ_5TH START WITH 1 INCREMENT BY 1;

SELECT SEQ_JH FROM DUAL;

DROP SEQUENCE SEQ_5TH;

SELECT * FROM USER_SEQUENCE;

SELECT * FROM MEMBERT;

SELECT SEQ_5TH.NEXTVAL FROM DUAL;
SELECT SEQ_5TH.CURRVAL FROM DUAL;
SELECT * FROM BOARD;

CREATE SEQUENCE SEQ_5TH START WITH 1 INCREMENT BY 1 MINVALUE 0 MAXVALUE 10 CYCLE NOCACHE;


SELECT * FROM BOARD;
SELECT * FROM membert;

SELECT * FROM SUBJECT;

SELECT * FROM BOARDLIST WHERE RN BETWEEN 1 AND 10;



INSERT INTO SUBJECT VALUES('Notice');
INSERT INTO SUBJECT VALUES('PartBoard');

INSERT INTO SUBJECT VALUES('FreeBoard');
INSERT INTO SUBJECT VALUES('QNABoard');

INSERT INTO MEMBERT VALUES('sss', 'ddd', 'sss', 'ddd', '01', '1994-01-01 00:00:00', '남자', 'dddd','13445','aaaa','S','1');

CREATE VIEW BOARDLIST2 AS
SELECT BOARD.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN
FROM BOARD;

SELECT * FROM(SELECT * FROM SUBJECT WHERE SUBJECT_CATEGORY = 'Notice')BOARDLIST WHERE RN BETWEEN 1 AND 10;

--SELECT BBBB.*, ROW_NUMBER() OVER(ORDER BY CO_NUM DESC) AS RN FROM(SELECT * FROM COMMUNITY WHERE CO_MEID ='ADMIN')BBBB;
SELECT * FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_SUBJECT ='Notice')BOARDLIST) WHERE RN BETWEEN 1 AND 10;

SELECT COUNT(*) FROM BOARD WHERE BOARD_SUBJECT = 'Notice';
-- VIEW의 중요성
-- 특정사용자용 VIEW와 일반사용자용 VIEW
-- VIEW에 WHERE절을 넣으면 안된다라... ( 이러면 한명한명에 대한 WHERE VIEW를 계속해서 생성해줘야 함 )
-- view는 정적이기때문에 다양한 변수들 안됨 (간단하게 정적인것만), 동적인변수 이용할 땐 프로시저나 서브쿼리
-- innerjoin을 쓸 때 view (여러정보들을 한꺼번에 보려고 할 때)
-- .boardlist 전체를 뽑아라

SELECT * FROM MEMBERT;

SELECT * FROM BOARDLIST;
SELECT * FROM BOARD;

SELECT BOARDLIST.* FROM BOARDLIST WHERE RN BETWEEN 1 AND 10 AND BOARD_NICK ='sss';
SELECT * FROM BOARDLIST WHERE RN BETWEEN 6 AND 10 AND BOARD_NICK = 'admin';
SELECT * FROM BOARDLIST WHERE RN BETWEEN 1 AND 10 AND BOARD_NICK = 'sss';
SELECT COUNT(*) FROM BOARD WHERE BOARD_NICK ='sss';

SELECT * FROM BOARDlIST ORDER BY BOARD_HIT ASC;
SELECT * FROM BOARDlIST ORDER BY BOARD_HIT DESC;

SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_HIT DESC) AS RN FROM BOARDLIST WHERE RN BETWEEN 1 AND 10;

SELECT * FROM (SELECT BOARD.*, ROW_NUMBER() OVER(ORDER BY BOARD_HIT, CASE WHEN BOARD_SUBJECT IN('Notice') THEN 0 ELSE 1 END, BOARD_SUBJECT DESC) AS RN FROM BOARD) WHERE RN BETWEEN 1 AND 10;


SELECT * FROM (SELECT BOARD.*, ROW_NUMBER() OVER(ORDER BY BOARD_STATE, CASE WHEN BOARD_SUBJECT IN('Notice') THEN 1 ELSE 0 END, BOARD_STATE ASC) AS RN FROM BOARD);

SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='1')BOARDLIST
UNION ALL
SELECT * FROM (SELECT BOARD.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='0')BOARD) WHERE RN BETWEEN 1 AND 20;

SELECT COUNT(*) FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='0')BOARDLIST);


SELECT * FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='1')BOARDLIST) WHERE RN BETWEEN 1 AND 30
UNION ALL
SELECT * FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='0')BOARDLIST) WHERE RN BETWEEN 1 AND 30;

SELECT * FROM BOARDLIST2;

-- 모든 페이지에 공지사항 고정
SELECT * FROM BOARDLIST2 WHERE BOARD_STATE = '1'
UNION ALL
SELECT BOARD.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM BOARD WHERE BOARD_STATE = '0';


-- 모든 페이지에 공지사항 고정
SELECT * FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='1')BOARDLIST)WHERE RN <= '5'
UNION ALL
SELECT * FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_STATE ='0')BOARDLIST) WHERE RN BETWEEN 1 AND 30;

COMMIT;
