USE demo1;
-- 1
SELECT  ename ,Sal
FROM emp
WHERE Sal>2850;
-- 2
SELECT ename, deptno
FROM emp
WHERE EMPNO in (7566);
-- 3
SELECT ename , sal
FROM emp
WHERE sal not between 1500 and 2850;
-- 4
SELECT ename, job, hiredate
FROM emp
WHERE hiredate between 20110220 and 20110501
order by hiredate;
-- 5
SELECT ename, deptno
FROM emp
WHERE deptno in (10,30)
order by ename;
-- 6
SELECT ename as "Employee",sal as "Monthly Salary"
FROM emp
WHERE sal >1500 and deptno in(10,30);
-- 7
SELECT ename , job , hiredate
FROM emp
WHERE hiredate>20111231 and hiredate<20130101;
-- 8
SELECT ename , job
FROM emp
WHERE mgr is null;
-- 9
SELECT ename , sal ,comm
FROM emp
WHERE comm is not null and comm > 0.00
order by sal desc ,comm desc;
-- 10
SELECT ename , job
FROM emp
WHERE ename LIKE '__A%';
-- 11
SELECT ename , mgr ,deptno
FROM emp
WHERE ename LIKE "%L%L%" and deptno =30 or mgr =7782;
-- 12
SELECT ename, job ,sal
FROM emp
WHERE job in ("CLERK","analyst") and sal not in (1000,3000,5000);
-- 13
SELECT ename, sal, comm
FROM emp
WHERE comm > sal*1.1;
-- class example
SELECT empno ,sal, ifnull(comm, "NO Commision") from emp;

SELECT empno, sal,comm,sal+comm, sal+ifnull(comm,0) from emp;