-- 1
CREATE TABLE DEPARTMENT
(	id INT not null,
	name VARCHAR(24) not null
    );
desc department;
-- 2 
insert into department
	select deptno,dname from dept;
select * from department;
-- 3 
CREATE TABLE EMPLOYEE
(	id INT not null,
	last_name VARCHAR(24) not null,
    first_name VARCHAR(24),
    deop_id int);
desc EMPLOYEE;
-- 4
ALTER TABLE EMPLOYEE
	MODIFY last_name varchar(40);
DESC EMPLOYEE;
-- 5
CREATE TABLE EMPLOYEE2
AS SELECT EMPNO 'ID', ENAME 'LAST_NAME' , DEPTNO 'DEPT_ID' FROM EMP;
DESC EMPLOYEE2;
-- 6
DROP TABLE EMPLOYEE;
-- 7
ALTER TABLE EMPLOYEE2
RENAME EMPLOYEE;
-- 8 
ALTER TABLE EMPLOYEE
DROP LAST_NAME;
DESC EMPLOYEE;
-- 9 
ALTER TABLE EMPLOYEE
ADD COLUMN SALARY INT;
DESC EMPLOYEE;
-- 10
ALTER TABLE employee
ADD CONSTRAINT PK_EMPLOYEE_ID PRIMARY KEY(ID);
SHOW INDEXES FROM EMPLOYEE;
-- 11
SELECT * FROM EMPLOYEE;
ALTER TABLE EMPLOYEE 
ADD CONSTRAINT FK_EMPLOYEE_DEPTID FOREIGN KEY(DEPT_ID) REFERENCES DEPT(DEPTNO);
SHOW INDEXES FROM EMPLOYEE;
