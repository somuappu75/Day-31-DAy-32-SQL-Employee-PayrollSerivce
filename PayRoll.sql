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


----UC 9:  Salary to Basic Pay and Add Deduction,Taxable pay, Income Tax , Netpay --
Alter table employee_payroll
add Deduction float,TaxablePay float, IncomeTax float,NetPay float;

select *from employee_payroll;
Update employee_payroll 
set Deduction=1000
where Gender='F';
Update employee_payroll 
set Deduction=1000
where Gender='M';
Alter table employee_payroll
add basicpay float;
Update employee_payroll 
set basicpay=5000
where Gender='M';
Update employee_payroll 
set basicpay=8000
where Gender='F';

update employee_payroll
set NetPay=(basicPay - Deduction)
update employee_payroll
set TaxablePay=0,IncomeTax=0
select * from employee_payroll;

----- UC 10: Adding another Value for Terissa in Sales&Marketing Department -----
Insert into employee_payroll(name,basicPay,StartDate,Address,EmployeePhoneNumber,EmployeeDepartment) values ('Terissa',250000,'2021-02-20','Pune','9845798856','Salaes&Mkt');
select * from employee_payroll;

--UC-11 adding same name to with differnt department and same other attributes to same table--
 create table company
(company_id int primary key,
companyName varchar(50) not null);
--inserted data into company table
insert into company
values(101, 'Infosys India');
--altering table employee payroll to add company id column
alter table employee_payroll
add company_id int not null default 101;

--adding department table
create table departments
(departmentID int primary key,
departmentName varchar(50) not null,
noOfEmployees int ,
headOfDepartment varchar(50) not null);
--adding data into department table
insert into departments values
(01,'Design',17,'Mr. PavanPavale'),(02,'HR',67,'Supriya Halbhavi'),(03,'Maintainence',8,'VishuG');
insert into departments(departmentID,departmentName,headOfDepartment)
values(04,'Sales','Somaanth'),(05,'Marketing','Savita Gondi');

--creating employee department table
create table EmployeeDepartment
(employeeID int not null, departmentID int not null);
insert into EmployeeDepartment
values
(1,01),(2,02),(3,02),(1,03);

select * from employee_payroll;

--renaming table name from employee payroll to employee using stored procedure
exec sp_rename 'departments', 'Departments'

--retriving data using different tables UC12

--UC4
select * from employee_payroll
join payroll p
on e.id= p.company-id
join EmployeeDepartment ed
on ed.employeeID = e.id
join company c
on c.company_id= e.company_id
join departments d
on d.departmentID= ed.departmentID;

--UC5
select p.*
from payroll p
join employee e
on e.id= p.employeeID
where e.name='somu';

--creating table payroll
create table payroll
(employeeID int not null primary key, basepay decimal not null, deductions decimal not null, taxable_pay decimal not null,
tax decimal not null, netPay decimal not null);

-UC7
select e.gender, sum(p.basicpay), avg(p.basicpay), max(p.basicpay), min(p.basicpay), count(p.basicpay)
from employee e
join payroll p
on p.employeeID= e.id
group by e.gender;


update employee_payroll
set salary=12345
where name='chetana' or name='somu';
select * from employee_payroll;






