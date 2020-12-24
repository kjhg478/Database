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
    


-- ���� �÷����� �������� ���� �˻�
-- (7) IN ������

-- Q3. 1��, 3��, 5���� �л� �˻�!
SELECT *
FROM EBDDSTU
WHERE GROUPNO=1 OR GROUPNO=3 OR GROUPNO=5
ORDER BY GROUPNO ASC;

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


-------------------------------------------------------------------------------
-- (1) ����
-- A�׷� : 4���� ���
SELECT *
FROM EBDDSTU
WHERE GROUPNO = 4;

-- B�׷� : ���� '��'���� ���
SELECT * 
FROM EBDDSTU
WHERE STUNAME LIKE '��%';

-- ������(INTERSECT) : �����߿� ����� �κ�
SELECT *FROM EBDDSTU WHERE GROUPNO = 4
INTERSECT 
SELECT * FROM EBDDSTU WHERE STUNAME LIKE '��%';

-- ������(UNION) : ��� ��� �����͸� ���
SELECT *FROM EBDDSTU WHERE GROUPNO = 4
UNION 
SELECT * FROM EBDDSTU WHERE STUNAME LIKE '��%';

-- A : 3 / B : 8
-- INTERSECT : 2
-- UNION : 9    => ( A + B - INTERSECT ): 3+8-2 = 9

-- ������(MINUS) : ���� �˻��� �����Ϳ��� ���߿� �˻��� �����͸� ���ش�.
SELECT *FROM EBDDSTU WHERE GROUPNO = 4
MINUS
SELECT * FROM EBDDSTU WHERE STUNAME LIKE '��%';

-- A-B => 3 - 8 =??
-- A - (A INTERSECT B) => 3 - 2 = 1(�㳲��)

-- (2) �������� : TRIM(), LTRIM(), RTRIM()
SELECT '     ��õ�Ϻ���ī����      ',TRIM('     ��õ�Ϻ���ī����      ')
FROM DUAL;

SELECT LTRIM('     ��õ�Ϻ���ī����      ') AS LTRIM1,
       RTRIM('     ��õ�Ϻ���ī����      ') AS RTRIM1
FROM DUAL;

-- (3) ���밪 : ABS()
SELECT ABS(5) AS "���밪 5", ABS('-10') AS "���밪 -10",
        ABS(5)+ABS('-10') AS ���
FROM DUAL;

-- (4) �ݿø� : ROUND()
SELECT ROUND(1234.5678)
FROM DUAL;

SELECT ROUND(1234.5678, 1) AS "�Ҽ��� 1��°"
FROM DUAL;

-- Q1.���� '���� �ڸ�'���� �ݿø� : 1230
-- Q2.���� '���� �ڸ�'���� �ݿø� : 1200
SELECT ROUND(1234.5678, -1),
       ROUND(1234.5678, -2)
FROM DUAL;

SELECT 
ROUND(1234.5678, -1) AS "�����ڸ� �ݿø�",
ROUND(1234.5678, -2) AS "�����ڸ� �ݿø�"
FROM DUAL;

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND_0,   --�Ҽ��� 0��° �ڸ����� ����ϰڴ�.
       ROUND(1234.5678,1) AS ROUND_1,   --�Ҽ��� 1��° �ڸ����� ����ϰڴ�. (�ι�° �ڸ����� �ݿø�)
       ROUND(1234.5678,2) AS ROUND_2,   --�Ҽ��� 2��° �ڸ����� ����ϰڴ�. (����° �ڸ����� �ݿø�)
       ROUND(1234.5678,-1) AS ROUND_MINUS1,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

-- (5)���� : TRUNC()
SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678,0) AS TRUNC_0,   
       TRUNC(1234.5678,1) AS TRUNC_1,   
       TRUNC(1234.5678,2) AS TRUNC_2,   
       TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;

-- (6) ����� ���� ã��
--  1) CEIL : ���κ��� ū ����
--  2) FLOOR : ���κ��� ���� ����
SELECT 
    CEIL(3.14), FLOOR(3.14),
    CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

-- (7) ������ �� ���ϱ� : MOD(A,B)
-- 15/4 => �� : 3
-- 15%4 => ������ : 3

SELECT FLOOR(15/4) AS �� , MOD(15,4) AS ������
FROM DUAL;

-- Q. 1���� ���ַ� �Ǿ��ִ��� ���غ���!
SELECT ROUND(365/7) AS "1���� ����?"
FROM DUAL;

SELECT SYSDATE
FROM DUAL;      

-- 2020-12-23 ���� 2020/12/23���� ����


-- ��¥ ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


-- (8) ��¥ ���� �Լ�
-- (DATE DATA) + ���� : ���ڸ�ŭ ���� ��¥
-- (DATE DATA) - ���� : ���ڸ�ŭ ���� ��¥
-- (DATE DATA1) - (DATE DATA2) : �� ��¥�� �ϼ� ���
-- (DATE DATA1) + (DATE DATA2) : ���� �Ұ���
SELECT
    SYSDATE AS "NOW(����)",
    SYSDATE+1 AS "TOMORROW(����)",
    SYSDATE-1 AS "YESTERDAY(����)"
FROM DUAL;
    
-- ����, ��������, �������� ��ȸ!
SELECT
    SYSDATE AS "NOW(����)",
    SYSDATE-7 AS "������ ��",
    SYSDATE+9 AS "9�� ��"
FROM DUAL;

-- �� ��¥�� �ϼ� ���
SELECT
    SYSDATE+5 AS "5����",
    SYSDATE-5 AS "5����",
    (SYSDATE+5) - (SYSDATE-5) AS "�ϼ� ���"
FROM DUAL;

-- ���� �� ���ϱ� : MONTHS_BETWEEN()
SELECT CEIL(MONTHS_BETWEEN('2021-03-03','2020-09-14'))
FROM DUAL;

-- ���� �� ���ϱ� : ADD_MONTHS()
SELECT ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- �ٰ��� ���Ͽ� �ش��ϴ� ��¥ : NEXT_DAY(��¥,'X����')
-- Q. ������ ȭ���� ��¥ ��ȸ!
SELECT NEXT_DAY(SYSDATE, '�����') AS "���ƿ��� �����"
FROM DUAL;

-- Q. ������ ����� ��ȸ!
SELECT NEXT_DAY(SYSDATE+7, '�����') AS "������ �����"
FROM DUAL;

-- �̹��� / Ư������ ������ �ϼ� : LAST_DAY()
SELECT LAST_DAY('20200913') FROM DUAL;


-- �ڡڡ�
-- TO_CHAR, TO_NUMBER, TO_DATE

-- TO_CHAR : ���� �Ǵ� ��¥�� ���ڵ����ͷ� ��ȯ
--           ex)String.valueOf(100)

-- TO_NUMBER : ���ڸ� ���ڷ�
--             ex) Integer.parseInt("100")

-- TO_DATE : ���ڸ� ��¥��
SELECT TO_DATE('20201011') FROM DUAL;



SELECT TO_CHAR(SYSDATE, 'MM-DD DAY') FROM DUAL;

-- DAY : '��'����
SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL;

-- DY : 'ȭ' (���Ͼ���)
SELECT TO_CHAR(SYSDATE, 'DY') FROM DUAL;

-- MON : ��
SELECT TO_CHAR(SYSDATE, 'MON') FROM DUAL;
-- (��)

-- D : [������ ���� �ϼ� (�Ͽ��� = 1)]
SELECT TO_CHAR(SYSDATE, 'D') FROM DUAL;

-- DDD : [365��(1��)�������� ���ñ��� �ϼ�] 365-8
SELECT TO_CHAR(SYSDATE, 'DDD') FROM DUAL;

-- W : [�Ѵ� ���� ������]
SELECT TO_CHAR(SYSDATE, 'W') FROM DUAL;

-- WW : [1�� ���� ������]
SELECT TO_CHAR(SYSDATE, 'WW') FROM DUAL;

-- DL : 2020�� 12�� 23�� ������ [�ش����� ��¥ ����]
SELECT TO_CHAR(SYSDATE, 'DL') FROM DUAL;

-- (9) �ð����� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT SYSDATE FROM DUAL;

-- AM : ����
SELECT TO_CHAR(SYSDATE,'AM') FROM DUAL;

-- PM : ����
SELECT TO_CHAR(SYSDATE,'PM') FROM DUAL;

-- HH�� HH24 ����
SELECT TO_CHAR(SYSDATE,'HH') AS HH,
TO_CHAR(SYSDATE,'HH24')AS HH24
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'PM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'PM HH24:MI:SS') FROM DUAL;

-- BC : ����
-- CC : 21����

-- (10) NULL ó�� �Լ� : NVL, NVL2
-- NULLTEST ���̺� ����
CREATE TABLE NULLTEST(
    NNAME   NVARCHAR2(10),
    NAGE    NUMBER,
    NFRIEND NVARCHAR2(5)
);

-- ������ ����
INSERT INTO NULLTEST(NNAME) VALUES ('Ȳ��ö');
INSERT INTO NULLTEST VALUES ('������', 25, 'X');

SELECT * FROM NULLTEST;

-- NVL : �÷��� ������ NULL�� ��� ����
-- NVL([COL_NAME], '������ ������')
SELECT NNAME, NVL(NAGE,999), NVL(NFRIEND, '����')
FROM NULLTEST;

-- NVL2
-- NVL2([COL_NAME], ��NULL�� �ƴҰ�� ������ ������ , ��NULL�� ��� ������ ������ )
SELECT NNAME,NAGE, NVL2(NAGE,999,20), NFRIEND, NVL2(NFRIEND, '����', '����')
FROM NULLTEST;

-- (11) �׷�ȭ �Լ�
INSERT INTO NULLTEST VALUES ('������', 28, '100');
INSERT INTO NULLTEST VALUES ('������', 24, '33');

SELECT * FROM NULLTEST;

-- SUM( ) : ������ �÷� �������� �� : 77
SELECT SUM(NAGE) FROM NULLTEST;

-- COUNT( ) : ������ �÷� �������� ���� : 3
SELECT COUNT(NAGE) FROM NULLTEST;

-- AVG = SUM / COUNT
-- AVG( ) : ������ �÷� �������� ��� : 25.66
SELECT AVG(NAGE) FROM NULLTEST;

-- MIN( ) : ������ �÷� �������� �ּڰ�
SELECT MIN(NAGE) FROM NULLTEST;

-- MAX( ) : ������ �÷� �������� �ִ�
SELECT MAX(NAGE) FROM NULLTEST;



    
    


