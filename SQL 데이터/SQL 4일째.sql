SELECT * FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT A.EMPNO, A.ENAME,A.MGR, B.ENAME MANAGER
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO
ORDER BY EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO MGR_EMPNO, E2.ENAME MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2
ON E1.MGR =  E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO MGR_EMPNO, E2.ENAME MGR_ENAME
FROM EMP E1 , EMP E2
WHERE E1.MGR =  E2.EMPNO(+);

CREATE TABLE SAMPLE1(
    ID NUMBER,
    NAME VARCHAR2(20),
    PRICE NUMBER
);

CREATE TABLE SAMPLE2(
    ID NUMBER,
    NAME VARCHAR2(20),
    COMM VARCHAR2(100)
);

INSERT INTO SAMPLE1 VALUES(11,'냉장고', 200);
INSERT INTO SAMPLE1 VALUES(12,'전자레인지', 200);
INSERT INTO SAMPLE1 VALUES(13,'밥솥', 150);

SELECT * FROM SAMPLE1;

DELETE FROM SAMLE1;
DELETE FROM SAMLE2;

COMMIT;

INSERT INTO SAMPLE2 VALUES(11, '냉동고', '비싸');
INSERT INTO SAMPLE2 VALUES(12, '강아지', '무서워');
INSERT INTO SAMPLE2 VALUES(14, '중국', '야비해');

SELECT * FROM SAMPLE2;




drop table SAMLE1;

SELECT * FROM SAMPLE2;
COMMIT;
SELECT * FROM SAMPLE1 S1, SAMPLE2 S2
WHERE S1.ID(+) = S2.ID;

SELECT * FROM SAMPLE1 S1 LEFT OUTER JOIN SAMPLE2 S2
ON S1.ID = S2.ID;

DELETE FROM SAMPLE1;


SELECT * FROM SAMPLE1 S1, SAMPLE2 S2
WHERE S1.ID = S2.ID;

SELECT * FROM SAMPLE1 S1 INNER JOIN SAMPLE2 S2
ON S1.ID = S2.ID;

SELECT *
FROM EMP;

-- 급여가 전체 평균 이상인 사원 정보 조회
SELECT *
FROM EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);

--부서가 SALES인 사원정보 조회
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO =  D.DEPTNO AND DNAME = 'SALES';

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO =  D.DEPTNO AND DNAME = 'SALES';

SELECT *
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

--RESEARCH
SELECT *
FROM EMP
WHERE DEPTNO IN( (SELECT DEPTNO FROM DEPT WHERE DNAME IN('SALES','RESEARCH')));

-- MARTIN 사원의 급여이상인 사원 정보 조회
SELECT *
FROM EMP
WHERE SAL >= (SELECT SAL FROM EMP WHERE ENAME = 'MARTIN');


SELECT *
FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT *
FROM EMP
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

(SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT *
FROM EMP
WHERE EXISTS (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
(SELECT DNAME FROM DEPT WHERE DEPTNO = 10);


SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN(SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
(SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT *
FROM EMP E, (SELECT DEPTNO, DNAME FROM DEPT WHERE DEPTNO = 30) D
WHERE E.SAL >= ANY(D.DEPTNO);


SELECT EMPNO, ENAME, E.DEPTNO, DNAME,SAL,GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT EMPNO, ENAME, E.DEPTNO, (SELECT DNAME
                                FROM DEPT
                                WHERE E.DEPTNO = DEPT.DEPTNO) DNAME, SAL, (SELECT GRADE
                                                                           FROM SALGRADE S WHERE E.SAL BETWEEN LOSAL AND HISAL)
FROM EMP E
ORDER BY SAL DESC;


--HR 코드
--SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, E.SALARY, L.CITY
--FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
--WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID;

--SELECT E.EMPLOYEE_ID, E.FIRST_NAME, SUB_TBL.DEPARTMENT_NAME, E.SALARY, SUB_TBL.CITY
--FROM EMPLOYEES E, (SELECT DEPARTMENT_ID, DEPARTMENT_NAME, CITY 
  --                  FROM DEPARTMENTS D, LOCATIONS L
    --                WHERE D.LOCATION_ID = L.LOCATION_ID) SUB_TBL
--WHERE E.DEPARTMENT_ID = SUB_TBL.DEPARTMENT_ID;
--SELECT DEPARTMENT_ID, DEPARTMENT_NAME, CITY 
                    --FROM DEPARTMENTS D, LOCATIONS L
                    --WHERE D.LOCATION_ID = L.LOCATION_ID;
--CREATE VIEW CITY_VIEW AS
--SELECT DEPARTMENT_ID, DEPARTMENT_NAME, CITY 
                    --FROM DEPARTMENTS D, LOCATIONS L
                    --WHERE D.LOCATION_ID = L.LOCATION_ID;
--
--SELECT * FROM CITY_VIEW;







