-- 1
SELECT e.ename , e.deptno,d.dname,d.loc
FROM emp e JOIN dept d on e.deptno=d.deptno;
-- 2
SELECT e.ename , e.comm, d.dname , d.loc
FROM emp e JOIN dept d on e.deptno = d.deptno
WHERE e.comm is not null and e.comm!=0;
-- 3
SELECT e.ename,d.dname
FROM emp e JOIN dept d on e.deptno=d.deptno
WHERE e.ename LIKE "%A%";
-- 4
SELECT e.ename , e.job , e.deptno , d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE d.loc = 'DALLAS';
-- 5
SELECT e.ename 'Employee' , e.empno 'Emp#',b.ename 'Manager', b.empno '#Mgr'
FROM emp e JOIN emp b on e.mgr=b.empno;
-- 6
SELECT e.ename , e.job , d.dname , e.sal , s.grade
FROM emp e JOIN dept d on e.deptno=d.deptno JOIN salgrade s ON sal BETWEEN losal and hisal;
-- 7  ##要複習 答案出來觀念不清
SELECT a.ename 'Employee', a.hiredate "Emp Hiredate", b.ename "Manager" ,b.hiredate "Mgr Hiredate"
FROM emp a JOIN emp b ON a.mgr = b.empno
WHERE a.hiredate < b.hiredate;
-- 8
select d.dname 'dname', d.loc 'loc', count(*) 'Number of People',round(avg(e.sal),2) 'Salary'
from emp e join dept d on (e.deptno=d.deptno)
group by d.dname;