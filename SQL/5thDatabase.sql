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

INSERT INTO SUBJECT VALUES('Notice');
INSERT INTO SUBJECT VALUES('PartBoard');

INSERT INTO SUBJECT VALUES('FreeBoard');
INSERT INTO SUBJECT VALUES('QNABoard');


CREATE VIEW BOARDLIST AS
SELECT BOARD.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN
FROM BOARD;
--SELECT BBBB.*, ROW_NUMBER() OVER(ORDER BY CO_NUM DESC) AS RN FROM(SELECT * FROM COMMUNITY WHERE CO_MEID ='ADMIN')BBBB;
SELECT * FROM (SELECT BOARDLIST.*, ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS RN FROM(SELECT * FROM BOARD WHERE BOARD_NICK ='admin')BOARDLIST) WHERE RN BETWEEN 1 AND 5;

-- VIEW�� �߿伺
-- Ư������ڿ� VIEW�� �Ϲݻ���ڿ� VIEW
-- VIEW�� WHERE���� ������ �ȵȴٶ�... ( �̷��� �Ѹ��Ѹ��� ���� WHERE VIEW�� ����ؼ� ��������� �� )
-- view�� �����̱⶧���� �پ��� ������ �ȵ� (�����ϰ� �����ΰ͸�), �����κ��� �̿��� �� ���ν����� ��������
-- innerjoin�� �� �� view (������������ �Ѳ����� ������ �� ��)
CREATE 


SELECT * FROM BOARDLIST;
SELECT * FROM BOARD;

SELECT * FROM BOARDLIST WHERE RN BETWEEN 1 AND 5 AND BOARD_NICK ='sss';
SELECT * FROM BOARDLIST WHERE RN BETWEEN 6 AND 10 AND BOARD_NICK = 'admin';
SELECT * FROM BOARDLIST WHERE RN BETWEEN 1 AND 10 AND BOARD_NICK = 'sss';
SELECT COUNT(*) FROM BOARD WHERE BOARD_NICK ='sss';

COMMIT;