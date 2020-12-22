DROP TABLE EBDDSTU;

CREATE TABLE EBDDSTU(
    STUNUM      NUMBER,
    STUNAME     NVARCHAR2(10),
    STUBIRTH    DATE,
    GROUPNO    NUMBER
);

INSERT INTO EBDDSTU VALUES(2201,'������','19940427',2);
INSERT INTO EBDDSTU VALUES(2202,'�輺��','19971002',1);
INSERT INTO EBDDSTU VALUES(2203,'���ָ�','19950309',7);
INSERT INTO EBDDSTU VALUES(2204,'�����','19960516',3);
INSERT INTO EBDDSTU VALUES(2205,'�赿ȯ','19950410',4);

INSERT INTO EBDDSTU VALUES(2206,'��α�','19970711',5);
INSERT INTO EBDDSTU VALUES(2207,'�����','19970301',6);
INSERT INTO EBDDSTU VALUES(2208,'������','19970128',1);
INSERT INTO EBDDSTU VALUES(2209,'������','19951128',4);
INSERT INTO EBDDSTU VALUES(2210,'������','19980106',3);

INSERT INTO EBDDSTU VALUES(2211,'������','20000309',5);
INSERT INTO EBDDSTU VALUES(2212,'������','20010519',7);
INSERT INTO EBDDSTU VALUES(2213,'������','19950422',2);
INSERT INTO EBDDSTU VALUES(2214,'�ڵ���','19941204',6);
INSERT INTO EBDDSTU VALUES(2215,'������','19950111',1);

INSERT INTO EBDDSTU VALUES(2216,'�����','19950917',2);
INSERT INTO EBDDSTU VALUES(2217,'������','19930529',6);
INSERT INTO EBDDSTU VALUES(2218,'������','19910121',3);
INSERT INTO EBDDSTU VALUES(2219,'������','19960618',7);
INSERT INTO EBDDSTU VALUES(2220,'������','19980728',6);

INSERT INTO EBDDSTU VALUES(2221,'������','19920211',5);
INSERT INTO EBDDSTU VALUES(2222,'������','19980621',3);
INSERT INTO EBDDSTU VALUES(2223,'������','19960710',5);
INSERT INTO EBDDSTU VALUES(2224,'����','19970403',2);
INSERT INTO EBDDSTU VALUES(2225,'������','19980328',1);

INSERT INTO EBDDSTU VALUES(2226,'������','19931113',7);
INSERT INTO EBDDSTU VALUES(2227,'�㳲��','19971215',4);


-- (1) ���̺� ���� ���캸��
    DESC EBDDSTU;
    
-- (2) ALIAS(��Ī)���� ��ȸ�ϱ�
    SELECT * FROM EBDDSTU;
    
    SELECT STUNUM AS �л���ȣ, STUNAME AS �̸�,
           STUBIRTH AS �������, GROUPNO AS ��
    FROM EBDDSTU;
    
-- (3) �ߺ������� ���� DISTINCT
    -- GROUPNO�� ��ȸ
    SELECT GROUPNO FROM EBDDSTU;
    SELECT DISTINCT GROUPNO FROM EBDDSTU;
    
-- (4) ���� ORDER BY
--  1) �������� ASC
    SELECT DISTINCT GROUPNO 
    FROM EBDDSTU
    ORDER BY GROUPNO ASC;
--  2) �������� DESC
    SELECT DISTINCT GROUPNO 
    FROM EBDDSTU
    ORDER BY GROUPNO DESC;
    
-- (5) �ΰ��� �̻� ���� �˻�
--  1) AND : ���ǽ�1�� ���ǽ�2�� ��� ���϶� TRUE, �ϳ��� �����̸� FALSE
--  2) OR : ���ǽ��� �ϳ��� ���̸� TRUE, �Ѵ� �����϶� FALSE

-- Q1. �л���ȣ�� 2225�̸鼭 1���� ��� �˻�!
-- Q2. �л���ȣ�� 2225 �Ǵ� 2226�� �л��� 7���� �л��� ��ȸ!

-- A1. ������
    SELECT * 
    FROM EBDDSTU
    WHERE STUNUM = 2225 AND GROUPNO = 1;
    
-- A2. ������
    SELECT * 
    FROM  EBDDSTU
    WHERE (STUNUM=2225 OR STUNUM=2226) AND GROUPNO=7;

-- (6) �������, ���ڿ���
    SELECT *
    FROM EBDDSTU
    WHERE STUNUM >= 2222;
    
    SELECT *
    FROM EBDDSTU
    WHERE STUNAME >='��' AND STUNAME <='��';
    
-- Q3. 1��, 3��, 5���� �л� �˻�!
SELECT *
FROM EBDDSTU
WHERE GROUPNO=1 OR GROUPNO=3 OR GROUPNO=5
ORDER BY GROUPNO ASC;

-- ���� �÷����� �������� ���� �˻�
-- (7) IN ������

SELECT *
FROM EBDDSTU
WHERE GROUPNO IN (1,3,5)
ORDER BY GROUPNO ASC;

/*
    SELECT
    FROM
    WHERE [COL_NAME] IN (DATA1, DATA2, DATA3..);
*/

--Q4. �л���ȣ�� 2223�̻� 2225������ �л� ��ȸ
SELECT *
FROM EBDDSTU
WHERE STUNUM >=2223 AND STUNUM<=2225;

-- (8) BETWEEN A AND B : A���� B������ ������ �˻�
/*
    SELECT
    FROM
    WHERE [COL_NAME] BETWEEN (MIN) AND (MAX);
*/

SELECT *
FROM EBDDSTU
WHERE STUNUM BETWEEN 2223 AND 2225;

-- Q5. �л���ȣ�� 2223�̻� 2225���ϰ� �ƴ�(NOT) �л� ��ȸ!
SELECT *
FROM EBDDSTU
WHERE STUNUM NOT BETWEEN 2223 AND 2225;


-- �� (9) LIKE �� --
/*
    SELECT
    FROM
    WHERE [COL_NAME] LIKE (.....);
*/

-- ex) ù ���ڰ� '��'���� �����ϴ� ������ ��ȸ
SELECT *
FROM EBDDSTU
WHERE STUNAME LIKE '��%';

-- ex) �ι�° ���ڰ� '��'�� ������ ��ȸ
SELECT *
FROM EBDDSTU
WHERE STUNAME LIKE '_��%';

-- ex) ����° ���ڰ� '��'�� ������ ��ȸ
SELECT *
FROM EBDDSTU
WHERE STUNAME LIKE '__��';

-- ex) �̸��߿� '��'�� ���Ե� ��� ������ ��ȸ
SELECT *
FROM EBDDSTU
WHERE STUNAME LIKE '%��%';

-- ' _ ', ' % ' => ���ϵ�ī��
-- '_(�����)' => � ���̵� ������� �Ѱ��� ���� �����͸� �ǹ�
-- '%(�ۼ�Ʈ)' => ���̶� ������� (���� ���� ��� ����) ��� ���� �����͸� �ǹ�

-- Q6. (�л��̸�)�� ���� '��', '��' ���� �ƴ� ����� "�̸�" �� ��ȸ! (��Ī���)
SELECT STUNAME AS �̸�
FROM EBDDSTU
WHERE STUNAME NOT LIKE '��%' AND STUNAME NOT LIKE '��%';

/*
    (10) ��, �ҹ��ڸ� �ٲ��ִ� �Լ�
         - UPPER : ��� �빮�ڷ� ��ȯ
         - LOWER : ��� �ҹ��ڷ� ��ȯ
         - INITCAP : ù���ڸ� �빮��, ������ �ҹ���
*/

SELECT UPPER('aBcDeFg') AS "UPPER(�빮��)"
FROM DUAL;

-- FROM DUAL : ���Ƿ� ��°��� �����ִ� â(������ ���̺�)

SELECT LOWER('aBcDeFg') AS "LOWER(�ҹ���)"
FROM DUAL;

SELECT INITCAP('aBcDeFg') AS "INITCAP(ù���� �빮��)"
FROM DUAL;


/*
    (11) ���ڿ� ���̸� ���ϴ� LENGTH
*/

SELECT LENGTH('Abc/De+������123') AS ���ڿ�����
FROM DUAL;

-- Q.�̸� ������ �̸��� �л��� �̸��� ���ڼ��� ��ȸ!
SELECT STUNAME, LENGTH(STUNAME)
FROM EBDDSTU
WHERE LENGTH(STUNAME)<3;

-- ������ ũ�⸦ ��ȸ(byte) : LENGTHB
-- '��', 'A', 'a', '#', '?' �� ����ũ�� ��ȸ

SELECT LENGTHB('��') AS "�ѱ� ('��')",
       LENGTHB('A') AS "�빮�� ('A')",
       LENGTHB('a') AS "�ҹ��� ('a')",
       LENGTHB('#') AS "Ư������ ('#')",
       LENGTHB('?') AS "Ư������ ('?')",
       LENGTHB('3') AS "���� ('3')",
       LENGTHB('��') AS "�ѱ����� ('��')",
       LENGTHB('��') AS "�ѱ۸��� ('��')"
FROM DUAL;

/*
    (12) ���ڿ� �Ϻθ� �����ϴ� SUBSTR
    SUBSTR('���ڿ�������' or [COL_NAME], ������ġ, �������)
*/

-- ���ڿ�������
SELECT SUBSTR('HELLO!!', 1, 2)
FROM DUAL;

SELECT SUBSTR('HELLO!!', 3, 2)
FROM DUAL;

-- Q. EBDDSTU ���̺��� �¾ �ذ� 95�� ����� �̸��� ��������� �˻�!
SELECT STUNAME, STUBIRTH
FROM EBDDSTU
WHERE SUBSTR(STUBIRTH,3,2) = 95;

-- Q. EBDDSTU ���̺��� ������ 7���� ����� �̸��� ��¥(��)�� �˻�! (��Ī����ؼ� ���غ���)
SELECT STUNAME AS �̸�, SUBSTR(STUBIRTH,9,2) AS ����
FROM EBDDSTU
WHERE SUBSTR(STUBIRTH,6,2) = 07;

/*
    (13) ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ�� ã�� INSTR
    INSTR('���ڿ�������' or [COL_NAME],'ã���� �ϴ� ����', ������ġ(�⺻��1),
            ���� ������ ��� ���° ��������(�⺻��1) )
*/

SELECT INSTR('HELLO, ORACLE!', 'B') AS INSTR1,       -- ù��° L
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR2,    -- 5��° ���ں��� ù��° L
       INSTR('HELLO, ORACLE!', 'L', 2, 3) AS INSTR3, -- 2��° ���ں��� ����° L
       INSTR('HELLO, ORACLE!', 'O', 1, 1) AS INSTR4, -- 1��° ���ں��� ù��° O
       INSTR('HELLO, ORACLE!', 'O', 1, 2) AS INSTR5  -- 1��° ���ں��� �ι�° O
FROM DUAL;

/*
    (14) Ư�����ڸ� �ٸ� ���ڷ� �ٲ��ִ� REPLACE
    REPLACE('���ڿ�������' or [COL_NAME], ã�� ����, �ٲ� ����) : ã�� ���� �� �ٲ� ����
    REPLACE('���ڿ�������' or [COL_NAME], ã�� ����) : ã�� ���� ����
*/

SELECT REPLACE('010-5680-8050', '-', ' ') AS "REPLACE �⺻��",
       REPLACE('010-5680-8050', '-') AS "REPLACE ������"
FROM DUAL;

/*
    (15) �� Į�� ������(�Ǵ� ���ڿ�������)�� ��ġ�� CONCAT
    
*/

SELECT CONCAT(STUNUM, STUNAME)
FROM EBDDSTU;

-- �л���ȣ : �л��̸�
-- ex) 2201 : ������

SELECT CONCAT(CONCAT(STUNUM,' : '), STUNAME) AS STU
FROM EBDDSTU;

SELECT STUNUM || ' : ' || STUNAME AS STU
FROM EBDDSTU;

-- CONCAT ��� || => ( [Shift] + [��] : | )

SELECT * FROM EBDDSTU WHERE STUNAME LIKE '%'||'��'||'%';

-- �ڡڡڡڡ�
SELECT * FROM EBDDSTU WHERE STUNAME LIKE '%'||?||'%';
SELECT * FROM EBDDSTU WHERE STUNAME LIKE '%?%';
-- ? ��� '��' ���� �ٲ�� ������ CONCAT�� �̿�

/*
    (16)�������� �� ������ Ư�� ���ڷ� ä��� LPAD, RPAD
    - LPAD('���ڿ�', �������ڸ���, ������� ä�﹮��(�⺻�� ' '))
    - RPAD('���ڿ�', �������ڸ���, ������� ä�﹮��(�⺻�� ' '))
*/

    SELECT 'ICIA',
            LPAD('������', 7, '#') AS LPAD1,
            RPAD('ICIA', 7, '*') AS RPAD1,
            LPAD('ICIA', 7) AS LPAD2,
            RPAD('ICIA', 7) AS RPAD2
    FROM DUAL;
    
    SELECT STUNAME,LPAD(STUNAME,8,'#')
    FROM EBDDSTU;
    
    -- Ex1. 1) �ֹι�ȣ 950713-1******
    -- �־��� ���ڿ� => 950713-1234567
    -- �־��� ���ڿ� => 951225-2234567 => 951225-2******
    -- RPAD, SUBSTR
    SELECT RPAD(SUBSTR(SSN,1,8),LENGTH(SSN),'*')
    FROM DUAL;
    
    
    -- Ex2. 2) ��ȭ��ȣ 010-****-8924
    -- �־��� ���ڿ� => 010-1234-8924
    -- �־��� ���ڿ� => 010-5678-1234 => 010-****-1234
    -- RPAD, SUBSTR, CONCAT
    SELECT RPAD(SUBSTR(PHONE,1,4),8,'*') || SUBSTR(PHONE,9)
    FROM DUAL;



    
    
    
    
    
    
    
    
    
    
    SELECT RPAD(SUBSTR('950713-1234567',1,8),14,'*') AS �ֹι�ȣ
    FROM DUAL;



