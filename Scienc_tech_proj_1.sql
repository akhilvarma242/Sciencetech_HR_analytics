Create Database Employee;
 Use Employee;
 
 CREATE TABLE emp_record ( 
emp_id VARCHAR(6) not null PRIMARY KEY);
drop table emp_record ;

Create table emp_record(
EMP_ID varchar(15) Not null Primary Key, 
FIRST_NAME varchar(50) Not null,
LAST_NAME varchar (50) not null,
GENDER varchar(5) Not null,
ROLE varchar (40) Not null,
DEPT varchar (40) Not null,
EXP Int not null,
COUNTRY varchar (30) not null,
CONTINENT varchar(20) not null,
SALARY Int not null,
EMP_RATING Int not null,
MANAGER_ID varchar (20),
PROJ_ID varchar (30));

Desc Emp_record;

CREATE TABLE proj_table ( 
proj_id VARCHAR(5) not null PRIMARY KEY, 
proj_name VARCHAR(30) not null, 
domain VARCHAR(15) not null, 
start_date DATE not null, 
closure_date DATE not null, 
dev_qtr VARCHAR(4) not null, 
status VARCHAR(10) not null); 

CREATE TABLE data_sci_team ( 
emp_id VARCHAR(6) not null PRIMARY KEY, 
f_name VARCHAR(10) not null, 
l_name VARCHAR(10) not null, 
gender VARCHAR(10) not null, 
role VARCHAR(30) not null, 
dept VARCHAR(15) not null, 
exp INT not null, 
country VARCHAR(15) not null, 
continent VARCHAR(15) not null); 

select * from data_sci_team;
select count(Emp_id) from data_sci_team;
select count(FIRST_NAME) from emp_record;
Desc emp_record;
Select * from emp_record;

drop table emp_record;

Select * from proj_table;

CREATE TABLE emp_record ( 
emp_id VARCHAR(6) not null PRIMARY KEY);
drop table emp_record ;

Create table emp_record(
EMP_ID varchar(15) Not null Primary Key, 
FIRST_NAME varchar(50) Not null,
LAST_NAME varchar (50) not null,
GENDER varchar(5) Not null,
ROLE varchar (40) Not null,
DEPT varchar (40) Not null,
EXP Int not null,
COUNTRY varchar (30) not null,
CONTINENT varchar(20) not null,
SALARY Int not null,
EMP_RATING Int not null,
MANAGER_ID varchar (20),
PROJ_ID varchar (30));

Drop table proj_table;
CREATE TABLE proj_table ( 
proj_id VARCHAR(5) not null PRIMARY KEY, 
proj_name VARCHAR(30) not null, 
domain VARCHAR(15) not null, 
start_date DATE not null, 
closure_date DATE not null, 
dev_qtr VARCHAR(4) not null, 
status VARCHAR(10) not null); 
Select * from proj_table;

Desc proj_table;

Select * from proj_table;
DESC  emp_record;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT FROM emp_record; 		



SELECT * FROM emp_record;
Select * From data_sci_team;
Select * From proj_table;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, gender, dept, emp_rating 
FROM emp_record 
WHERE emp_rating < 2; 

SELECT EMP_ID, FIRST_NAME, LAST_NAME, gender, dept, emp_rating 
FROM emp_record 
WHERE emp_rating > 4; 

SELECT EMP_ID, FIRST_NAME, LAST_NAME, gender, dept, emp_rating 
FROM emp_record 
WHERE emp_rating between 2 AND 4; 



DESC EMP_RECORD;

SELECT * FROM EMP_RECORD;


SELECT * FROM EMP_RECORD;

SELECT * FROM EMP_RECORD;



use employee;
select * from emp_record;
select * from data_sci_team;
Select * from proj_table;



SELECT concat(FIRST_NAME,' ',LAST_NAME)NAME
FROM emp_record where DEPT = 'FINANCE';

select ROLE, MANAGER_ID, COUNT(*) AS employee_count FROM emp_record group by role, MANAGER_ID ORDER BY role,MANAGER_ID;

SELECT FIRST_NAME, LAST_NAME, DEPT
FROM emp_record 
WHERE Dept = 'HEALTHCARE'
UNION 
SELECT FIRST_NAME, LAST_NAME, Dept
FROM emp_record 
WHERE Dept = 'FINANCE';

SELECT EMP_id, FIRST_NAME, LAST_NAME, role, dept, emp_rating, emp_rating AS max_rating 
FROM emp_record 
WHERE (dept, emp_rating) 
IN (SELECT dept, MAX(emp_rating) FROM emp_record GROUP By dept) 
ORDER BY dept ASC; 

SELECT role, MIN(salary) AS minSalary, MAX(salary) AS maxSalary 
FROM emp_record 
GROUP BY role; 

SELECT FIRST_NAME, LAST_NAME, exp as experience, 
DENSE_RANK() OVER (ORDER BY exp DESC) exp_rank 
FROM emp_record; 

CREATE VIEW 6K_salary AS 
SELECT emp_id, FIRST_NAME, LAST_NAME, country, salary 
FROM emp_record 
WHERE salary > 6000; 
SELECT * FROM 6k_salary; 



SELECT emp_id, FIRST_NAME, LAST_NAME, exp 
FROM emp_record 
WHERE exp IN ( 
SELECT  exp 
FROM emp_record 
WHERE exp > 10 
); 

DELIMITER // 
CREATE PROCEDURE Employee3() 
BEGIN 
SELECT * FROM emp_record 
WHERE exp > 3; 
END // 
DELIMITER ; 
CALL Employee3; 

DELIMITER // 
CALL check_role();

ALTER TABLE emp_record ADD INDEX fname_index (FIRST_NAME); 
SELECT * FROM emp_record WHERE FIRST_NAME = 'Eric'; 
check_role
SELECT FIRST_NAME, LAST_NAME, salary, ((salary * .05)*emp_rating) AS bonus 
FROM emp_record; 

SELECT country, AVG(salary) 
FROM emp_record 
GROUP BY country 
ORDER BY country ASC; 

SELECT continent, AVG(salary) 
FROM emp_record 
GROUP BY continent 
ORDER BY continent ASC; 

SELECT
    ROLE,
    MANAGER_ID,
    COUNT(*) AS employee_count
FROM emp_record
GROUP BY ROLE, MANAGER_ID
ORDER BY MANAGER_ID;