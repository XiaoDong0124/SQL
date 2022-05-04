-- 1
SELECT MAX(sal) 'Maximum' , MIN(sal) 'Minimum', SUM(sal) 'Sum', AVG(sal) 'Average'
from emp;
-- 2
SELECT job,max(sal),min(sal),sum(sal),avg(sal)
FROM emp
GROUP BY job;
-- 3
SELECT job, count(*)
FROM emp
GROUP BY job;
-- 4
SELECT count(distinct mgr) "Number of Managers"
FROM emp;
-- 5
SELECT MAX(sal)-MIN(sal) DIFFERENCE
FROM emp;
-- 6
SELECT mgr,Min(sal)
FROM emp
WHERE mgr is not NULL
GROUP BY mgr
HAVING MIN(sal)>1000
ORDER BY MIN(sal) desc; 
-- 7
SELECT 
		case
        WHEN hiredate BETWEEN 20091231 and 20110101 THEN '2010'
        WHEN hiredate BETWEEN 20101231 and 20120101 THEN '2011'
        WHEN hiredate BETWEEN 20111231 and 20130101 THEN '2012'
        WHEN hiredate BETWEEN 20121231 and 20140101 THEN '2013'
        end Hyear ,count(hiredate) 'Number of People'
        
FROM emp
GROUP BY Hyear;


-- 痾
SELECT YEAR(hiredate),count(ename)
from emp
group by YEAR(hiredate);