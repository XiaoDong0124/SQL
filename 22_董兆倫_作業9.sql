 create view EMP_VU (empno,EMPLOYEE,deptno)
 AS
 select empno, ename ,deptno
 from emp ;
 
 desc emp_vu;
 -- 2
 select * from EMP_VU;
 -- 3
 select employee,deptno
 from emp_vu;
 -- 4
 create view dept20 (EMPLOYEE_ID , EMPLOYEE, DEPARTMENT_ID)
 as 
 select empno , ename , deptno
 from emp
 where deptno=20
 with check option;
 
 desc dept20;
 -- 5
 select * from dept20;
 -- 6 
 update dept20
	set DEPARTMENT_ID = 30
	where EMPLOYEE="smith";
 
select * from dept20;
-- 7
create view SALARY_VU(Employee,Department,Salary,Grade)
as 
select e.ename,d.dname,e.sal,s.grade
from emp e join dept d on (e.deptno=d.deptno) join salgrade s on (e.sal between losal and hisal);
select * from salary_vu;