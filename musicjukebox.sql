create schema MusicJukeBox

create table MusicJukeBox.Employee
(
	EmployeeKey int NOT NULL IDENTITY(1, 1) primary key,
	EmployeeId AS 'E' + RIGHT('000' + CONVERT(VARCHAR(5), EmployeeKey), 6) PERSISTED,
	EmpName varchar(20) unique not null,
	Address varchar(100) not null,
	DOB date not null,
	City varchar(20) not null,
	Password varchar(15) not null,
	MobileNo varchar(10) not null
)

select * from MusicJukeBox.Employee

drop table MusicJukeBox.Employee
use MusicJukeBox
create procedure MusicJukeBox.AddEmp
(
@empName varchar(20),
@address varchar(100),
@dob date,
@city varchar(20),
@pass varchar(15),
@mobile varchar(10)
)
as 
begin 
   insert into MusicJukeBox.Employee values (@empName,@address,@dob,@city,@pass,@mobile)
end

create procedure MusicJukeBox.UpdateEmp
(
@empId int ,
@empName varchar(20),
@address varchar(100),
@dob date,
@city varchar(20),
@pass varchar(15),
@mobile varchar(10)
)
as 
begin 
   update MusicJukeBox.Employee set EmpName=@empName,Address=@address,DOB=@dob,City=@city,Password=@pass,MobileNo=@mobile where EmployeeId=@empId
end