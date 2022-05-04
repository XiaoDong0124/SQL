USE demo1;
-- 1
SELECT*
FROM dept;
-- 2
SELECT  ename, job, hiredate, EMPNO
FROM emp;
-- 3
SELECT DISTINCT job
FROM emp;
-- 4
SELECT empno as "Emp#", ename as "Employee", JOB as "Job", hiredate as "Hire Date"
From emp;
-- 5
SELECT concat (ename,",",Job)  "Employee and Tittle"
FROM emp;
