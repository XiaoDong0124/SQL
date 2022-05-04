-- 1
SELECT ename,hiredate
FROM emp
WHERE deptno=
				(SELECT deptno
                FROM emp
                WHERE ename='Blake');
-- 2
select ename , hiredate
from emp
where hiredate>
				(select hiredate
                from emp
                where ename="Blake");
-- 3
select empno ,ename , sal
from emp
where sal>
			(select avg(sal)
            from emp)
order by sal desc;
-- 4 
select empno , ename
from emp 
where deptno in
			(select deptno
            from emp
            where ename like '%T%');
-- 5
select e.ename , e.deptno ,e.job
from emp e join dept d on (e.deptno=d.deptno)
where d.loc in ('Dallas');
-- 6 
select ename , sal
from emp
where mgr = 
			(select empno
            from emp
            where ename="King");
-- 7
select deptno,ename,job
from emp 
where deptno in
				(select deptno
                from dept
                where dname='Sales');
-- 8
select empno , ename , sal
from emp
where sal>
			(select avg(SAL)
            from emp) and deptno in 
									(select deptno
                                    from emp
                                    where ename like '%T%');
-- 9
select a.ename , a.deptno , a.sal
from emp a join (select * from emp where comm>0) b on (a.empno != b.empno and a.deptno = b.deptno and a.sal = b.sal)  ;
-- 10 exists 觀念釐清
select a.ename , a.deptno ,a.sal
from emp a join emp b on(a.empno != b.empno and a.sal = b.sal and (a.comm = b.comm or (a.comm is null and b.comm is null)))	
WHERE  a.deptno in
				(select deptno
                from dept
                where loc='dallas');
-- 11
select a.ename , a.hiredate , a.sal
from emp a join (select * from emp where ename = 'scott') b on (a.ename!= b.ename and a.sal=b.sal and IFNULL(a.comm,0)=IFNULL(b.comm,0));
select * from emp where ename = 'scott';
-- 12
select ename, hiredate, sal
from emp  
where sal > all
				(select sal
                from emp
                where job='clerk')
order by sal desc;