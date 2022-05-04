-- 1
insert into MY_EMP ()
	values(1,'Patel','Ralph','rpatel',795);
select *
from MY_EMP;
-- 2
insert into my_emp (ID,LAST_NAME,FIRST_NAME,USERID,SALARY)
	values(2,"Dancs","Betty","bdancs",860);
select *
from MY_EMP;
-- 3
insert into my_emp
	values(3,"Biri","Ben",'bbiri',1100),
			(4,"Newman","Chad","Cnewman",750);
select *
from MY_EMP;
-- 4
update my_emp 
set last_name = 'Drexler'
where ID = 3;
-- 5
update my_emp
set salary = 1000
where sal<900;
-- 6 
delete from my_emp
where FIRST_NAME ='Betty'; 
-- 7
start transaction;
		update my_emp 
        set salary=salary+salary*0.1;
        savepoint s1;
        delete from my_emp;
        select * from my_emp;
        rollback to s1;
        select * from my_emp;
commit;
select * from my_emp;
        


