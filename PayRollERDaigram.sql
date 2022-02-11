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
Update employee_payroll 
set name='chetana'
where name ='chetan';

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