create database PayRoll_Service;

--uc2 creating table
create Table employee_payroll
(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date
)


--uc -3 inserting values to table
Insert into employee_payroll(name,salary,startDate) values
('somu',22000,'2022-12-12'),
('suresh',25000,'2022-08-18'),
('chetan',11000,'2021-05-13'),
('gouri',35000,'2021-08-19');

--uc-4 retrieving all data
select *from employee_payroll;
---uc-5 retrieving data from cast() anf Getdate()
select salary from employee_payroll where name='suresh';
select salary from employee_payroll where startDate BETWEEN Cast('2021-08-19' as Date) and GetDate();

--uc-6 add column gender and upadate values
Alter table employee_payroll
add Gender char(1);

Update employee_payroll 
set Gender='M'
where name='suresh';
Update employee_payroll 
set Gender='F'
where name='chetan' or name='somu'or name='gouri';