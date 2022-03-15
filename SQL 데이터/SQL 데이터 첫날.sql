SELECT * FROM EMPLOYEES;
-- SELECT �� ����
--SELECT (DISTINCT �ߺ������� �ѹ�) ���̺��. �÷���1, ���̺��.�÷���2.... : ��ȸ�� �÷��� (* : ��� �÷� 
--FROM ���̺��1, ���̺��2 ....
--WHERE ����
--GROUP BY �׷�ȭ�� �÷���
--HAVING �׷�ȭ ������ ��ȸ ����
--ORDER BY (ASC ��������/DESC ��������) �������� Į����

-- SALARY 1000�� �̻��� ����� �����ȣ, ����̸�, ����, �μ���ȣ ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 10000;


-- �μ���ȣ�� �ο��� ��ȸ
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--�μ���ȣ�� �ο����� 10���̻��� �μ��� ��ȸ
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 10
ORDER BY DEPARTMENT_ID;

SELECT * FROM EMPLOYEES, DEPARTMENTS
WHERE employees.department_id= departments.department_id;


SELECT DISTINCT  DEPARTMENT_ID, DEPARTMENT_ID
FROM EMPLOYEES;

--��Ī

SELECT EMPLOYEE_ID AS ��ȣ, FIRST_NAME AS �̸�, SALARY AS ����, SALARY*12 AS ����
FROM EMPLOYEES;


SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE employees.department_id= departments.department_id;

SELECT EMPLOYEE_ID, FIRST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.department_id= D.department_id;

--���ڿ� ���Ҷ��� || OR�����ڸ� ���
SELECT FIRST_NAME || ' '  || LAST_NAME "�� ��"
FROM EMPLOYEES;

--����� �̸��� ������ ������ ���� ������ ��ȸ
SELECT FIRST_NAME || ' '  || LAST_NAME "�̸�", SALARY ����
FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID DESC, SALARY ASC;