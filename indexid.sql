create clustered index IX_DimEmployee_Name
ON DimEmployee(FirstName)

drop index DimEmployee.PK_DimEmployee_EmployeeKey

create table tblEmployee(
Id int Primary key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50)
)

insert into tblEmployee values(1,'John',4500,'Male','New York');
insert into tblEmployee values(2,'Sam',2500,'Male','London');
insert into tblEmployee values(3,'Sara',5500,'Female','Tokyo');
insert into tblEmployee values(4,'Todd',3100,'Male','Toronto');
insert into tblEmployee values(5,'Pam',6500,'Female','Sydney');

create clustered index IX_tblEmployee_Gender_Salary
on tblEmployee(Gender DESC, Salary)

insert into tblEmployee values(1,'John',4500,'Male','New York');

Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')
insert into tblEmployee values(1,'John',4500,'Male','New York');
insert into tblEmployee values(1,'John',4500,'Male','New York');
select * from tblEmployee

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

create table tblEmployee(
Id int Primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50)
)

insert into tblEmployee values(1,'John','A',4500,'Male','New York');
insert into tblEmployee values(2,'Sam','B',2500,'Male','London');
insert into tblEmployee values(3,'Sara','C',5500,'Female','Tokyo');
insert into tblEmployee values(4,'Todd','D',3100,'Male','Toronto');
insert into tblEmployee values(5,'Pam','E',6500,'Female','Sydney');

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName,LastName)

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

create NonClustered index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate Asc)
select EmployeeKey,BaseRate from DimEmployee

select EmployeeKey,BaseRate from DimEmployee where BaseRate>20 and BaseRate<40


delete from DimEmployee where BaseRate = 25
select EmployeeKey,BaseRate from DimEmployee where BaseRate>20 and BaseRate<40

update DimEmployee set BaseRate = 25 where BaseRate>20 and BaseRate<26
select EmployeeKey,BaseRate from DimEmployee where BaseRate>20 and BaseRate<40

select EmployeeKey,BaseRate from DimEmployee order by BaseRate

select EmployeeKey,BaseRate from DimEmployee order by BaseRate Desc

select BaseRate,COUNT(BaseRate) as Total
from DimEmployee
Group by BaseRate
