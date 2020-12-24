-- SCOTT / TIGER ����

-- ���ӵ� ������ ���̺� ��ȸ
SELECT TABLE_NAME FROM TABS;

-- 4�� ���̺� ��ȸ
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM BONUS;


-- �ڡڡڡڡ�
-- (1) GROUP BY : Ư�� �÷� �Ǵ� ����Ʋ �������� �����͸� �׷����� ����
--               (� �÷��� ����� ȿ�������� ����� �� ������ ����)
--               (�׷��� ���� �Ǹ� ���� �÷� �̿ܿ� �ٸ� �÷��� ��ȸ�� �Ұ�)

/*
    SELECT
    FROM
    WHERE
    GROUP BY [�׷�ȭ�� COLUMN�� ����]
    ORDER BY [������ COLUMN]
*/

-- �μ��� ��� �޿� ���ϱ�
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- EMP(EMPLOYEE : ����)
-- DEPT(DEPARTMENT : �μ�)
-- SAL(SALARY : �޿�, ����)
-- COMM(COMMISSION : ����)
-- LOC(LOCATION : ����)
-- GRADE (���)
-- LOSAL(LOW �����޿�)
-- HISAL(HIGH �ְ�޿�)

-- Q1. ����(JOB)���� �ο���, �޿��հ�, ��ձ޿��� ���Ͽ���.
SELECT JOB, COUNT(*) AS �ο���, SUM(SAL) AS �޿��հ�, ROUND(AVG(SAL)) AS ��ձ޿�
FROM EMP
GROUP BY JOB;

-- Q2. ����(JOB)�� �ο��� ���� ������ ����
SELECT JOB, COUNT(*) AS �ο���, SUM(SAL) AS �޿��հ�, ROUND(AVG(SAL)) AS ��ձ޿�
FROM EMP
GROUP BY JOB
ORDER BY COUNT(*) DESC;

-- (2) ROLLUP : �׷�ȭ �������� �հ踦 �Բ� ���
/*
    SELECT
    FROM
    WHERE
    GROUP BY ROLLUP([COL_NAME])
*/
SELECT JOB, COUNT(*) AS �ο���, SUM(SAL) AS �޿��հ�, ROUND(AVG(SAL)) AS ��ձ޿�
FROM EMP
GROUP BY ROLLUP(JOB);

-- �ڡڡڡڡ�
-- (3) HAVING : GROUP BY ���� ����ؼ� �׷�ȭ �� ��� ��
--              ��� �׷��� �����ϴ� ���ǽ�
/*
    SELECT
    FROM
    WHERE
    GROUP BY
    HAVING [��±׷��� �����ϴ� ���ǽ�] �ڡڡڡڡ�
    ORDER BY
*/

SELECT DEPTNO, COUNT(*)     -- �μ���ȣ, �ο����� �˻�
FROM EMP                    -- ���� ���̺���
WHERE SAL > 1500            -- �޿��� 1500���� ū ����
GROUP BY DEPTNO             -- �μ���ȣ���� ������
HAVING DEPTNO >= 20         -- �μ���ȣ 20 �̻��� �׷��߿���
ORDER BY DEPTNO ASC;        -- �μ���ȣ�� �����ͺ��� ���ʷ� ����

-- Q1. EMP���̺��� �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ����� ��ȸ
--     �� ��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ���ȣ ���� ���
SELECT DEPTNO, ROUND(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- Q2. �������޿� �����ϴ� ����� 3�� �̻��� ���ް� �ο��� ���
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

----------------------------------------------------------------

-- �ڡڡڡڡ�
-- (1) ����(JOIN) : �ΰ� �̻��� ���̺��� �����Ͽ� �ϳ��� ���̺� ó�� ���
--                  INNER JOIN, OUTER JOIN
--  1) ��������(INNER JOIN) : �ΰ� ���̺��� ��(COLUMN) ���� ���� ��
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT *
FROM EMP , DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- ex) ��Ī��� INNER JOIN
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- 2) �ܺ�����(OUTER JOIN)
--    : ���� ������ �������� �ʴ� �����͸� ó���ϱ� ����
--    : INNER JOIN�� �� ���̺��� �ִ� ��ġ�ϴ� ���� �������� �Ϳ� ����
--    : OUTER JOIN�� ��� ������ �����͸� ��� �����´�.
--    : LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN

/*
    !! LEFT OUT JOIN
    !! ù��° ���
    SELECT [TAB_NAME1].[COL_NAME], [TAB_NAME2].[COL_NAME]
    FORM [TAB_NAME1] LEFT OUTER JOIN [TAB_NAME2] 
    ON [TAB_NAME1].[COL_NAME] = [TAB_NAME2].[COL_NAME]
*/

SELECT E1.*, E2.ENAME AS ���
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO;

/*
    !! �ι�° ���
    SELECT [TAB_NAME1].[COL_NAME],[TAB_NAME2].[COL_NAME]
    FROM [TAB_NAME1] , [TAB_NAME2]
    ON [TAB_NAME1].[COL_NAME] = [TAB2_NAME].[COL_NAME](+)
*/

SELECT E1.*, E2.ENAME AS ���
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);


-- RIGHT OUTER JOIN ����
SELECT *
FROM EMP E1 RIGHT OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO;

SELECT *
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- FULL OUTER JOIN
/*
    SELECT [TAB_NAME1].[COL_NAME], [TAB_NAME2].[COL_NAME]
    FORM [TAB_NAME1] FULL OUTER JOIN [TAB_NAME2] 
    ON [TAB_NAME1].[COL_NAME] = [TAB_NAME2].[COL_NAME]
*/

SELECT * 
FROM EMP E1 FULL OUTER JOIN EMP E2
ON E1.MGR = E2.EMPNO;


-- (3) �������� : SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ����
--               SQL�� ���ο��� SELECT���� ����ϴ� ��

-- Q1. ����̸��� 'JONES'�� ����� �޿��� ��� : 2975
SELECT ENAME, SAL
FROM EMP
WHERE ENAME='JONES';

-- Q2. �޿��� 2975���� ���� �޿��� �޴� ������� ���
SELECT * 
FROM EMP 
WHERE SAL > 2975;

-- Q1 + Q2 . 'JONES'�� �޿����� ���� �޿��� �޴� ��������� ���

/*
    SELECT
    FROM
    WHERE [COL_NAME] > ( SELECT [COL_NAME]
                         FROM
                         WHERE )

*/

SELECT * 
FROM EMP
WHERE SAL > (SELECT SAL 
             FROM EMP 
             WHERE ENAME = 'JONES');
    
/*
    - ���������� Ư¡
      1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸�
         ��ȣ( )�� ��� ����Ѵ�.
      2. Ư���� ��� ��츦 �����ϴ� �ϰ�� ORDER BY ���� ����� �� ����.
      3. ���������� SELECT ���� ����� [COL_NAME]�� ���������� �񱳴��
         [COL_NAME]�� ���� �ڷ����� ���� ������ �����ؾ� �Ѵ�.
      
*/

-- Q1. �޴� �޿��� ��� �޿� �̻��� ����� ������ �˻��Ͻÿ�.
-- Q2. �� �μ��� �ְ�޿��� ���� �޿��� �޴� ������� ���








