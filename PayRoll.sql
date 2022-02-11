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


--uc-7 Aggregate function anfd Gruop by gender
select Sum(salary) as "TotalSalary",Gender from employee_payroll group by Gender;
select Avg(salary) as "AverageSalary",Gender from employee_payroll group by Gender;
select Min(salary) as "MinimumSalary",Gender from employee_payroll group by Gender;
select Max(salary) as "MaximumSalary",Gender from employee_payroll group by Gender;
select count(salary) as "CountSalary",Gender from employee_payroll group by Gender;

------- UC 8: Add column department,PhoneNumber and Address -------
Alter table employee_payroll
add EmployeePhoneNumber BigInt,EmployeeDepartment varchar(200) not null default 'Publish',Address varchar(200) default 'Not Provided';

select *from employee_payroll;

Update employee_payroll 
set EmployeePhoneNumber='9731390823',EmployeeDepartment='Devloper',Address='Bangalore,Karnataka'
where name='somu';

Update employee_payroll 
set EmployeePhoneNumber='9740049061',Address='kolkata'
where name ='suresh';


Update employee_payroll 
set EmployeePhoneNumber='9980114356',EmployeeDepartment='TEchHead',Address='Chennai,TN'
where name ='chetan';
Update employee_payroll 
set EmployeePhoneNumber='9731390823',EmployeeDepartment='Co-Devloper',Address='Bangalore,Karnataka'
where name='gouri';








