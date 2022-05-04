-- CH1
-- 1
SELECT *
FROM dept;
-- 2
SELECT empno,ename, job , hiredate
FROM emp;
-- 3
SELECT DISTINCT job
FROM emp;
-- 4
SELECT empno 'Emp#' , ename Employee , job Job , hiredate "Hire date" 
FROM emp;
-- 5
SELECT CONCAT(ename,",",job) "Employee and Title"
FROM emp;
 -- CH2
 -- 1
 SELECT ename ,sal
 FROM emp
 WHERE sal>2580 ;
 -- 2
 SELECT ename,deptno
 FROM emp
 WHERE empno = 7566;
 -- 3
 SELECT ename , sal
 FROM emp
 WHERE sal not BETWEEN 1500 and 2850;
 -- 4
 SELECT ename , job , hiredate
 FROM emp
 WHERE hiredate BETWEEN 20110220 and 20110501
 ORDER BY hiredate;
 -- 5
 SELECT ename , deptno
 FROM emp
 WHERE deptno = 10 or deptno = 30
 ORDER BY ename;
 -- 6
 SELECT ename Employee , sal 'Monthly Salary'
 FROM emp
 WHERE sal>1500 and deptno in (10,30);
 -- 7
 SELECT ename , job , hiredate
 FROM emp
 WHERE YEAR(hiredate)=2012;
 -- 8
 SELECT ename , job 
 FROM emp
 WHERE mgr is null;
 -- 9
 SELECT ename , sal , comm
 FROM emp 
 WHERE comm is not null and comm !=0
 ORDER BY sal , comm;
 -- 10
 SELECT ename , job
 FROM emp
 WHERE ename LIKE "__A%";
 -- 11 
 SELECT ename , mgr , deptno
 FROM emp
 WHERE ename LIKE "%L%L%" and (deptno=30 or mgr=7782);
 -- 12
 SELECT ename , job , sal
 FROM emp
 WHERE job in ("CLERK","Analyst") and sal not in (1000,3000,5000);
 -- 13
 SELECT ename ,sal ,comm
 FROM emp
 WHERE comm>1.1*sal;
 -- CH3
 -- 1
 select CURDATE() '系統日期';
 -- 2
 select empno , ename ,sal ,round(sal*1.15) "New Salary"
from emp
order by sal; 
-- 3 
select empno , ename , sal , round(sal*1.15) "New Salary",round(sal*1.15)-sal 'Increase'
from emp
order by Increase;
-- 4 
select ename , hiredate , date_format(adddate(hiredate , interval 6 month)  , '%W the %D of %M')  'Review'
from emp;
-- 5
select ename, round(DATEDIFF(curdate(),hiredate)/(365/12)) 'MONTH_WORKED'
from emp;
-- 6
select concat(ename,'earns',sal,'monthly but wants',sal*3)
from emp;
-- 7
select ename , lpad(sal,15,'$')
from emp;
-- 8
select ename , hiredate , weekday(hiredate)+1 'Day'
from emp
order by Day;
-- 9
select ename , IFNULL(comm,'NO Commission')
from emp; 
-- 10
select concat(ename,repeat('*',round(sal/100))) 'EMPLOYEE_AND_THEIR_SALARIES'
from emp
order by length(EMPLOYEE_AND_THEIR_SALARIES) desc;
-- Ch4
-- class
select deptno , GROUP_CONCAT(job SEPARATOR ',') JOBS
from emp
GROUP BY deptno;
-- 1
select max(sal) 'Maximum',min(sal) 'Minmum',sum(sal) 'Sum' , round(avg(sal)) 'Average'
from emp;
-- 2
select job ,max(sal) 'Maximum',min(sal) 'Minmum',sum(sal) 'Sum' , round(avg(sal)) 'Average'
from emp
group by job;
-- 3
select job ,count(*) 
from emp
group by job;
-- 4 
select count(distinct(mgr)) 'Number of Mangers'
from emp; 
-- 5
select max(sal)-min(sal) 'Difference'
from emp;
-- 6
select mgr, min(sal)
from emp
where mgr is not null
group by mgr
having min(sal) >1000
order by min(sal) desc;
-- 7
select year(hiredate), count(*) 'here we are'
from emp
group by year(hiredate);
-- ch5
-- 1
select e.ename , e.deptno , d.dname , d.loc
from emp e join dept d on e.deptno = d.deptno;
-- 2
select e.ename, e.comm , d.dname,d.loc
from emp e join dept d on e.deptno=d.deptno
where e.comm!=0 and e.comm is not null;   
-- 3
select e.ename, d.dname
from emp e join dept.d on e.deptno=d.deptno
where e.ename like '%A%';
-- 4
select e.ename , e.job , d.dname,d.loc
from emp e join dept d on e.deptno=d.deptno
where d.loc='DALLAS';
-- 5 
select a.ename "Employee", a.empno 'Emp#' , b.ename 'Manager', a.mgr 'Mgr#'
from emp a join emp b on b.empno=a.mgr;
-- 6
select  e.ename , e.job , d.dname , e.sal , s.grade
from emp e join dept d on e.deptno=d.deptno join salgrade s on e.sal between losal and hisal
order by s.grade;
-- 7
select a.ename "Employee",a.hiredate  "Emp hiredate",b.ename 'Manager',b.hiredate 'Mgr Hiredate'
from emp a join emp b on a.mgr=b.empno
where a.hiredate<b.hiredate
order by a.hiredate;
-- 8 
select d.dname 'dname', d.loc 'loc', count(*) 'Number of People',round(avg(e.sal),2) 'Salary'
from emp e join dept d on (e.deptno=d.deptno)
group by d.dname;
-- ch6
-- 1
select ename,hiredate
from emp
where deptno=
			(select deptno
            from emp
            where ename="Blake");
-- 2 
select ename, hiredate 
from emp 
where hiredate >
				(select hiredate
                from emp 
                where ename='Blake');
-- 3 
select empno,ename,sal
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
from emp e
where e.deptno =
				(select d.deptno
                from dept d
                where d.loc = 'DALLAS');
-- 6
select ename , sal
from emp 
where mgr =
			(select empno
            from emp
            where ename='KING');
-- 7
select deptno, ename , job
from emp
where deptno = 
				(select deptno
                from dept
                where dname='sales');
-- 8
select empno,ename,sal
from emp
where sal > 
			(select avg(sal)
            from emp)
            AND
            deptno in 
					(select deptno
                    from emp
                    where ename like '%T%');
-- 9
select a.ename , a.deptno , a.sal
from emp a join (select * from emp where comm>0) b on(a.ename != b.ename and a.deptno=b.deptno and a.sal = b.sal );
-- 10 
select a.ename , a.deptno , a.sal
from emp a join (select * from emp where deptno = (select deptno from dept where loc = 'dallas')) b on (a.ename!=b.ename and a.sal=b.sal and ifnull(a.comm,0)=ifnull(b.comm,0));
-- 11
select a.ename , a.hiredate , a.sal
from emp a join (select comm,sal from emp where ename='scott') b on (a.sal=b.sal and ifnull(a.comm,0)=ifnull(b.comm,0))
where a.ename!='Scott';
-- 12
select ename, hiredate , sal
from emp
where sal > all 
			(select sal
            from emp
            where job='clerk')
order by sal desc;

-- class example 
select ename ,sal ,deptno
from emp
where sal in
			(select max(sal)
            from emp 
            group by deptno);
 -- class example
 select e.ename , e.job , e.deptno , d.dname , d.loc
 FROM emp e JOIN dept d ON e.deptno=d.deptno
 ORDER BY deptno;
 -- 2 內部連結
  SELECT e.ename , e.job , e.deptno , d.dname , d.loc
 FROM emp e JOIN dept d ON e.deptno=d.deptno
 WHERE e.ename='king';
 -- 3 不相等連結
 SELECT e.empno , ename , sal , grade
 FROM emp e JOIN salgrade s on (e.sal BETWEEN losal and hisal)
 ORDER BY s.grade;
 -- 4 自我連結
 SELECT a.empno , a.ename , a.mgr , b.ename
 FROM emp a JOIN emp b on a.mgr = b.empno
 ORDER BY a.mgr;
 -- 5 外部連結
 -- 我是右邊有成功
 SELECT d.deptno , d.dname, e.empno , e.ename
 FROM emp e RIGHT JOIN dept d on e.deptno = d.deptno;
 -- 我是左邊你自己跑跑看
 SELECT d.deptno , d.dname, e.empno , e.ename
 FROM emp e LEFT JOIN dept d on e.deptno = d.deptno;
 -- 喵
 SELECT CAST(NOW() AS DATE )'*1'; 
 