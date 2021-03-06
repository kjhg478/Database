--1
SELECT EMPNO, ENAME, SAL
FROM EMP;
--2
SELECT ENAME AS "이름", SAL AS "월급"
FROM EMP;
--3
SELECT EMPNO AS "사원번호", ENAME AS "사원이름", SAL AS "월급", SAL*12 AS "연봉"
FROM EMP;
--4
SELECT JOB
FROM EMP
GROUP BY JOB;
--5
SELECT ENAME AS "사원이름", SAL*12 AS "연봉"
FROM EMP;
--6
SELECT INITCAP(ENAME), LENGTH(INITCAP(ENAME))
FROM EMP
WHERE ENAME LIKE 'J%' OR ENAME LIKE 'A%' OR ENAME LIKE 'M%';
--7
SELECT ENAME, DNAME, LOC FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND COMM IS NOT NULL AND SAL+COMM >= 1600;
--8
SELECT LOC, COUNT(LOC) FROM EMP RIGHT OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY LOC HAVING COUNT(LOC) <= 5 ORDER BY COUNT(LOC);
--9
SELECT
DEPTNO AS 부서번호 ,ENAME AS 이름,(SAL+NVL(COMM,0)) AS 총급여,NVL2(COMM,'유(O)','무(X)') AS COMM유무
FROM EMP
WHERE (SAL+NVL(COMM,0)) >(SELECT AVG(SAL) FROM EMP);
--10
SELECT ENAME, DNAME, SAL, (SELECT GRADE FROM SALGRADE WHERE LOSAL <= SAL AND SAL <= HISAL)AS GRADE 
FROM 
(SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE EMP.DEPTNO = 20))SS 
INNER JOIN DEPT ON SS.DEPTNO = DEPT.DEPTNO;

SELECT ENAME,DNAME,SAL,GRADE 
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
         INNER JOIN SALGRADE ON SALGRADE.LOSAL <= SAL AND SALGRADE.HISAL >= SAL
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              WHERE DEPTNO=20);

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM BONUS;