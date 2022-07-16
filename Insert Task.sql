--Database Task
create database Task
use Task
--Person Table
create table Person(Person_ID INT, Name VARCHAR(10), Email VARCHAR(30), Score INT)
INSERT INTO PERSON
VALUES (1, 'Alice', 'alice2018@hotmail.com', 88)
INSERT INTO PERSON
VALUES (2, 'Bob', 'bob2018@hotmail.com', 11)
INSERT INTO PERSON
VALUES (3,'Davis', 'davis2018@hotmail.com', 27)
INSERT INTO PERSON
VALUES (4, 'Tara', 'tara2018@hotmail.com', 45)
INSERT INTO PERSON
VALUES (5, 'John', 'john2018@hotmail.com', 63)
select * from Person

--Friend Table
create table Friend (Person_ID INT, Friend_ID INT)
insert into Friend
values(1,2)
insert into Friend
values(1,3)
insert into Friend
values(2,1)
insert into Friend
values(2,3)
insert into Friend
values(3,5)
insert into Friend
values(4,2)
insert into Friend
values(4,3)
insert into Friend
values(4,5)
select * from Friend

--Entries Table
create table Entries(Name varchar(10), Address varchar(20), Email varchar(30), [Floor] int, Resources varchar(10))
insert into Entries
values('A', 'Banglore', 'A@gmail.com', 1, 'cpu')
insert into Entries
values('A', 'Banglore', 'A1@gmail.com', 1, 'cpu')
insert into Entries
values('A', 'Banglore', 'A2@gmail.com', 2, 'desktop')
insert into Entries
values('B', 'Banglore', 'B@gmail.com', 2, 'desktop')
insert into Entries
values('B', 'Banglore','B1@gmail.com', 2, 'desktop')
insert into Entries
values('B', 'Banglore','B2@gmail.com', 1, 'monitor')
select * from Entries

--Details Table
create table Details(ID int, Zone Varchar(10))
insert into Details
values(1,'Z1')
insert into Details
values(1,'Z2')
insert into Details
values(2,'Z1')
insert into Details
values(2,'Z2')
insert into Details
values(3,'Z1')
insert into Details
values(3,'Z2')
insert into Details
values(3,'Z3')
select * from Details

--Animal Table
create table Animal(ID int, Name varchar(10), Strength int)
insert into Animal
values(1, 'Alice', 20)
insert into Animal
values(2, 'Bob', 30)
insert into Animal
values(3, 'Alex', 45)
select * from Animal

--Source Table
create table [Source](ID int, Name varchar(10))
insert into Source
values(1, 'A')
insert into Source
values(2, 'B')
insert into Source
values(3, 'C')
insert into Source
values(4, 'D')
select * from [Source]

--Target Table
create table Target(ID int, Name varchar(10))
insert into Target
values(1, 'A')
insert into Target
values(2, 'B')
insert into Target
values(4, 'X')
insert into Target
values(5, 'F')
select * from Target

--Matches Table
create table Matches(team_code varchar(10), team_name varchar(30))
insert into Matches
values('CSK', 'Chennai Super King')
insert into Matches
values('DC', 'Delhi Capitals')
insert into Matches
values('GT', 'Gujrat Titans')
insert into Matches
values('KKR', 'Kolkata Knight Riders')
insert into Matches
values('LSG', 'Lucknow Super Giants')
insert into Matches
values('MI', 'Mumbai Indians')
insert into Matches
values('PBKS', 'Kings 11 Punjab')
insert into Matches
values('RR', 'Rajasthan Royals')
insert into Matches
values('RCB', 'Royal Challengers Banglore')
insert into Matches
values('SRH', 'Sunrises Hyderabad')
select * from Matches

--Teachers Table
create table Teachers ([TeacherName] varchar(20), [SubjectTaught] varchar(25), [Gender] varchar(10))
insert into Teachers
values('Rajni Sharma','English, Hindi', 'Female')
insert into Teachers
values('Anjali Gupta', 'Math, Science', 'Female')
insert into Teachers
values('Rajni Sharma', 'Math, Physics', 'Female')
insert into Teachers
values('Pradeep Singh', 'English, Math, Physics', 'Male')
insert into Teachers
values('Sanjeev Mehra', 'Chemistry, Economics', 'Male')
select * from Teachers

--tblEmployee Table
create table tblEmployee ( EMPLOYEE_ID int, 
	[NAME] VARCHAR(20), 
	SALARY int 
);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO tblEmployee(EMPLOYEE_ID,NAME,SALARY) VALUES(103,'Den',11000);
select * from tblEmployee

--Departments Table
CREATE TABLE Departments(
   Department_ID int,
   Department_Name varchar(50)
);

INSERT INTO DEPARTMENTS VALUES('10','Administration');
INSERT INTO DEPARTMENTS VALUES('20','Marketing');
INSERT INTO DEPARTMENTS VALUES('30','Purchasing');
INSERT INTO DEPARTMENTS VALUES('40','Human Resources');
INSERT INTO DEPARTMENTS VALUES('50','Shipping');
INSERT INTO DEPARTMENTS VALUES('60','IT');
INSERT INTO DEPARTMENTS VALUES('70','Public Relations');
INSERT INTO DEPARTMENTS VALUES('80','Sales');
SELECT * FROM Departments;
sp_rename 'Departments', 'tblDepartments'

--TableA Table
create table [TableA](ID int primary key, Category Varchar(15))
insert into [TableA] values(1, 'A')
insert into [TableA] values(2, 'B')
insert into [TableA] values(3, 'C')
insert into [TableA] values(4, 'D')
insert into [TableA] values(5, 'E')
select * from TableA

--TableB Table
create table[TableB] (Category varchar(15), City varchar(15))
insert into [TableB] values ('A', 'Indore')
insert into [TableB] values ('B', 'Ludhiana')
insert into [TableB] values ('C', 'Pune')
insert into [TableB] values ('E', 'Banglore')
insert into [TableB] values ('F', 'Surat')
select * from TableB 

--Employees Table
CREATE TABLE Employees(
	emp_id int, 
	[name] varchar(20), 
	salary int
        );
insert into EMPLOYEES values(100,'Jennifer',4400);
insert into EMPLOYEES values(101,'Michael',13000);
insert into EMPLOYEES values(102,'Pat',6000);
insert into EMPLOYEES values(103,'Den', 11000);
insert into EMPLOYEES values(104,'Alexander',3100);
insert into EMPLOYEES values(105,'Shelli',2900);
insert into EMPLOYEES values(106,'Sigal',2800);
insert into EMPLOYEES values(107,'Guy',2600);
insert into EMPLOYEES values(108,'Karen',2500);

