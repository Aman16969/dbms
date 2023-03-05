sqlplus system/admin123
Create user SCOTT identified by tiger
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY admin123
CREATE TABLE//
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
CREATE TABLE EMP
        (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
//ALTER//
alter table emp modify (ENAME varchar2(20));
alter table emp drop column ename
alter table emp add ename varchar2(10)

//SELECT//
select * from all_tables where table_name='EMP'
select * from all_tab_columns where table_name='EMP'
select * from all_constraints where table_name='EMP'
drop table emp


//DML - Data Manipulation Language
desc dept
INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');

//INSERT
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
INSERT INTO EMP VALUES(7935,'TEST','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

//UPDATE
update emp set ename='FORDY' where empno=7902
//DELETE
delete from emp where empno=7935
//Transaction Control
COMMIT
ROLLBACK
Data Retrieval
SELECT* from EMP
SELECT* from DEPT
SELECT* from emp where sal between 3000 and 2000 //Wrong Query
SELECT* from emp where sal between 2000 and 3000
select* from emp where deptno =(20,30) //Wrong Query
select* from emp where deptno in (20,30)
select* from emp where comm is NULL
select* from emp where ename like '%A%'
SELECT INITCAP('computer'),upper('computer'),lower('AMAN') FROM DUAL;
SELECT CONCAT('COMPUTER','APPLICATION') CONCAT_STRING,'HOW'||'ARE'||'YOU' FROM DUAL;
SELECT SUBSTR('CONPUTER',2),SUBSTR('COMPUTER',3,4) FROM DUAL;;

//DATE OF SYSYTEM
select sysdate from dual
select sysdate //WRON WAY
SELECT JOB,COUNT(*), AVG(SAL),MAX(SAL) FROM EMP GROUP BY JOB;
SELECT INITCAP('computer'),upper('computer'),lower('AMAN') FROM DUAL;
SELECT CONCAT('COMPUTER','APPLICATION') CONCAT_STRING,'HOW'||'ARE'||'YOU' FROM DUAL;
SELECT SUBSTR('CONPUTER',2),SUBSTR('COMPUTER',INSTR('COMPUTER','O',4,1),4) FROM DUAL;
SELECT LENGTH('COMPUTER') FROM DUAL;
SELECT INSTR('INFORMATION','O',4,1),INSTR('INFORMATION','MA',4,2) FROM DUAL;

SELECT SUBSTR('Hi,This@ is Mr ABC',INSTR('Hi,This@ is Mr ABC','@')+1,
(INSTR('Hi,This@ is Mr ABC',' ',1,3)-INSTR('Hi,This@ is Mr ABC','@'))
)FROM DUAL;
SELECT RPAD('COMPUTER',15,'*')FROM DUAL;
SELECT lPAD('COMPUTER',15,'*')FROM DUAL;
SELECT LTRIM('COMPUER','C0'),RTRIM('COMPUTER','TER'),TRIM('    AMAN  '),TRIM('I' FROM 'INDIAN') FROM DUAL;
SELECT TRANSLATE('INDIAN','IN','XY'),REPLACE('INDIAN','IN','XY'),REPLACE('INDIAN','IN')FROM DUAL;
SELECT ROUND(456.82989,3),TRUNC(567.98766,3),MOD(1600,300) FROM DUAL;
SELECT ROUND(556.82989,-3),TRUNC(567.98766,-2),MOD(1600,300) FROM DUAL;
SELECT SYSDATE FROM DUAL;

SELECT ADD_MONTHS(TO_DATE('11-JAN-1234','DD-MON-YYYY'),5) FROM DUAL;

 
 select  months_between(to_date('11-aug-1990','dd-mon-yyyy'), to_date('11-jan-1990','dd-mon-yyyy'))  from dual
 
 select next_day(to_date('03-mar-2023','dd-mon-yyyy'),'sun')  from dual
 
 select last_day(to_date('03-mar-2023','dd-mon-yyyy')) from dual
 
 select extract(year from sysdate)  from dual;
 SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY HH24:MI:SS') FROM DUAL;
  SELECT TO_DATE(SYSDATE,'DD-MM-YYYY HH24:MI:SS') FROM DUAL;
  select to_char(sysdate,'DD-MONTH-YY HH24:MI:SS') from dual

select to_date('04-Mar-2023 00:15:00','DD-MON-YYYY HH24:MI:SS') from dual;

select sal,comm,nvl(comm,0) from emp

select sal,comm,nvl2(comm,sal+comm,sal) from emp

select sal,comm,coalesce(comm,sal,1000) from emp
select sal,comm,coalesce(comm,1000,SAL) from emp
select sal,case  
 when sal <= 1000 then 'low'
 when sal >= 5000 then 'high'
 else 'medium' end case from emp
  

 select sal,decode(sal,1000,'Low',5000,'High','Medium') from emp e
 SELECT E.EMPNO,E.ENAME,E.JOB,D.DNAME,D.LOC FROM EMP E ,DEPT D WHERE E.DEPTNO=D.DEPTNO; 
 SELECT E.EMPNO,E.ENAME,E SELECT E.EMPNO,E.ENAME,JOB,D.DNAME,LOC FROM EMP E INNER JOIN DEPT D ON(E.DEPTNO=D.DEPTNO); 
 SELECT E.EMPNO,E.ENAME,E.JOB,D.DNAME,D.LOC FROM EMP E INNER JOIN DEPT D ON(E.DEPTNO=D.DEPTNO); 
select empno,e.ename,job ,d.dname,loc from emp e inner join dept d using(deptno);
  
  
select empno,e.ename,job,d.dname deptname,loc from emp e left outer join dept d   on(e.deptno=d.deptno);
Or
select empno,e.ename,job,d.dname deptname,loc,d.deptno from emp e,dept d where e.deptno=d.deptno(+);  

select empno,e.ename,job,d.dname deptname,loc from emp e right outer join dept d   on(e.deptno=d.deptno);
Or
select empno,e.ename,job,d.dname deptname,loc,d.deptno from emp e,dept d where e.deptno(+)=d.deptno;

select e1.empno,e2.name,e1.ename,e2.deptno from emp e1,emp e2 where e1.empno=e2.mgr;

select * from emp where sal > (select sal from emp where empno = 7566);

select * from emp where sal > any (select sal from emp where sal between 2500 and 4000);
SELECT Deptno, dname 
FROM Dept D 
WHERE EXISTS (SELECT * 
FROM Emp E 
WHERE D.Deptno = E.Deptno)

Select ename, sal, rownum rank from (select * from emp order by sal desc);

SELECT DEPTNO,SAL, RANK() OVER(ORDER BY SAL)FROM EMP;
SELECT DEPTNO,SAL, RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL)FROM EMP;
Select ename, sal, rownum rank from (select * from emp order by sal desc);
select deptno,sum(sal) from emp group by rollup(deptno)	
select deptno,job,sum(sal) from emp group by rollup(deptno,job)
select deptno,job,sum(sal) from emp group by cube(deptno,job)

RANK

select deptno,sal,rank() over (order by sal) from emp
select deptno,sal,rank() over (partition by deptno order by sal) from emp
select deptno,sal,dense_rank() over (order by sal) from emp

select deptno,sal,dense_rank() over (partition by deptno order by sal) from emp

SET
SELECT Job FROM Emp WHERE Deptno = 20
UNION ALL
SELECT Job FROM Emp WHERE Deptno = 30

SELECT Job FROM Emp WHERE Deptno = 20
UNION
SELECT Job FROM Emp WHERE Deptno = 30

SELECT Job FROM Emp WHERE Deptno = 20
INTERSECT
SELECT Job FROM Emp WHERE Deptno = 30

SELECT Job FROM Emp WHERE Deptno = 20
MINUS
SELECT Job FROM Emp WHERE Deptno = 30


CREATE OR REPLACE VIEW EmpInfoQuery
AS
SELECT E.Empno EmployeeID,
E.Ename EmpName,
D.DeptNo DepartmentID,
D.Dname DepartmentName
FROM Emp E, Dept D
WHERE D.Deptno = E.Deptno
ORDER BY D.Deptno;

select * from EmpInfoQuery
CREATE OR REPLACE VIEW DeptSalSummary
(DeptName,
MinSalary,
MaxSalary,
AvgSalary,
GrossBudget)
AS
SELECT D.Dname, MIN(E.Sal), MAX(E.Sal), AVG(E.Sal), SUM(E.Sal)
FROM Emp E, Dept D
WHERE E.Deptno = D.Deptno
GROUP BY D.Dname

select * from DeptSalSummary

CREATE SEQUENCE SampleSeq
INCREMENT BY 1
START WITH 0
MINVALUE 0
MAXVALUE 5
NOCACHE
NOCYCLE;

select SampleSeq.nextval from dual

select SampleSeq.currval from dual

index
create index Test_Name on EMP(ENAME)

create synonym em for emp

select e.ename as Employee,d.ename as Manager from emp e left join emp d on e.mgr=d.empno;
select * from emp;

select d.dname as Department ,count(*) as No_of_Employees  from emp e, dept d where (e.deptno=d.deptno) group by d.dname having (count(*)>=5);

select (d.loc) as "LOCATION" ,max(e.sal) as "HIGHEST SALARY" from dept d inner join emp e on (d.deptno=e.deptno)  where (d.dname like 'R%' ) group by d.loc ;


select ename as "Employee" ,(nvl(sal,0)+nvl(comm,0))as "Salary+commision" from emp;
select ename as "Employee" ,((case when(sal is null)then 0 else sal end )+( case when(comm is null)then 0 else comm end ))as "Salary+commision" from emp;
