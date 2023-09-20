--funktsiooni loomine
Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select EmployeeKey,FirstName,Cast(BirthDate as Date) as DOB
	From DimEmployee);
select * from fn_ILTVF_GetEmployees();


Create Function fn_MSTVF_GetEmployees()
Returns @Table Table(Id int, Name varchar(20),DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey,FirstName,Cast(BirthDate as Date)
From DimEmployee
Return
End
select * from fn_MSTVF_GetEmployees();

Update fn_MSTVF_GetEmployees() set Name='Sam2' Where Id = 1;
Update fn_ILTVF_GetEmployees() set FirstName='Sam123' Where EmployeeKey = 1;
select * from fn_ILTVF_GetEmployees();
--

--funktsiooni loomine (2)
create Function fn_GetEmployeeNameById(@Id int)
Returns varchar(20)
as
Begin
Return (Select FirstName from DimEmployee Where EmployeeKey = @Id)
End
select dbo.fn_GetEmployeeNameById(15);

alter Function fn_GetEmployeeNameById(@Id int)
Returns varchar(20)
With Encryption
as
Begin
Return (Select FirstName from DimEmployee Where EmployeeKey = @Id)
End
GO  
EXEC sp_helptext 'dbo.fn_GetEmployeeNameById';  
GO  

alter Function fn_GetEmployeeNameById(@Id int)
Returns varchar(20)
With SchemaBinding
as
Begin
Return (Select FirstName from dbo.DimEmployee Where EmployeeKey = @Id)
End
drop table DimEmployee
--

--Ajutised tabelid
Create table #PersonDetails(
Id int Primary key,
Name varchar(20)
);
insert into #PersonDetails Values(1,'Tom');
insert into #PersonDetails Values(2,'Dom');
insert into #PersonDetails Values(3,'Rom');
Select * from #PersonDetails;

select name from tempdb.sys.all_objects
where name like '#PersonDetails%'

Create Procedure spCreateLocalTempTable
as
Begin
Create table #PersonDetails(
Id int Primary key,
Name varchar(20)
);
insert into #PersonDetails Values(1,'Tom');
insert into #PersonDetails Values(2,'Dom');
insert into #PersonDetails Values(3,'Rom');
Select * from #PersonDetails;
End
exec spCreateLocalTempTable

Create table ##PersonDetails(
Id int Primary key,
Name varchar(20)
);
select * from ##PersonDetails
--

--Indeksid serveris
Select * from DimEmployee where BaseRate > 35 and BaseRate < 50

Create Index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC)
exec sys.sp_helpindex @Objname = 'DimEmployee'

drop index DimEmployee.IX_DimEmployee_BaseRate
--
