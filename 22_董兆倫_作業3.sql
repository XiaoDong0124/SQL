-- 1
SELECT NOW() 系統日期;
-- 2
SELECT empno , ename, sal, ROUND(sal*1.15) 'NEW salary'
FROM emp; 
-- 3
SELECT empno , ename, sal, ROUND(sal*1.15) 'NEW salary',ROUND(sal*1.15-sal) 'INCREASE'
FROM emp; 
-- 4 
SELECT ename,hiredate, DATE_FORMAT(ADDDATE(ADDDATE(hiredate,INTERVAL 6 MONTH),INTERVAL mod(7-(weekday(ADDDATE(hiredate,INTERVAL 6 MONTH))),7) DAY),"%W,the %D of%M")
FROM emp;
-- 5
SELECT ename ,round(DATEDIFF(curdate(),hiredate)/30.5)
FROM emp;
-- 6
SELECT CONCAT(ename,'earns',sal,'monthly but wants',sal*3) 'Dream Salaries'
FROM emp;
-- 7
SELECT ename, LPAD(sal,15,"$") "SALARY"
FROM emp;
-- 8
SELECT ename , hiredate, weekday(hiredate)+1 DAY
FROM emp
ORDER BY DAY;
-- 9
SELECT ename,
		CASE 
        WHEN comm is NULL THEN 'No Commission'
        ELSE comm
        END COMM
FROM emp;
-- 10
SELECT CONCAT(ename,REPEAT('*',round(sal/100))) EMPLOYEE_AND_THEIR_SALARIES
FROM emp
ORDER BY length(EMPLOYEE_AND_THEIR_SALARIES) desc;


