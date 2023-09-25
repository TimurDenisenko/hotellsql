select EmployeeKey, FirstName, Gender, ParentEmployeeKey 
from DimEmployee
join DimDepartmentGroup
on DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey

Create View vWEmployeesByDepartment
as 
select EmployeeKey, FirstName, Gender, ParentEmployeeKey 
from DimEmployee
join DimDepartmentGroup
on DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey

select * from vWEmployeesByDepartment

Create View vWITDepartment_Employees
as
select EmployeeKey, FirstName, BaseRate,Gender, DepartmentGroupName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey
where DimDepartmentGroup.DepartmentGroupName = 'IT'

select * from vWITDepartment_Employees

create view vWEmployeesNonCofidentialData
as
select EmployeeKey, FirstName, Gender, DepartmentGroupName
from DimEmployee
join DimDepartmentGroup
on DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey

select * from vWEmployeesNonCofidentialData

DepartmentGroupName, COUNT(EmployeeKey) as TotalEmployees
from DimEmployee
join DimDepartmentGroup
on DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey
group by DepartmentGroupName

select * from vWEmployeesCountByDepartment

create view vWemployeesDataExceptSalary
as 
Select EmployeeKey,FirstName,Gender,ParentEmployeeKey
from DimEmployee

Update vWemployeesDataExceptSalary
set FirstName = 'Mikey' where EmployeeKey = 2

select * from vWemployeesDataExceptSalary

delete from vWemployeesDataExceptSalary where EmployeeKey = 2;
select * from vWemployeesDataExceptSalary

insert into vWemployeesDataExceptSalary values(2,'Luca :0','M',1)
select * from vWemployeesDataExceptSalary

create view vwEmployeeDetailsByDepartment
as
Select EmployeeKey, FirstName, BaseRate, ParentEmployeeKey
from DimEmployee
join DimDepartmentGroup
on DimEmployee.ParentEmployeeKey = DimDepartmentGroup.ParentDepartmentGroupKey

select * from vwEmployeeDetailsByDepartment

update vwEmployeeDetailsByDepartment
set ParentEmployeeKey='1' where FirstName = 'Mary'
select * from vwEmployeeDetailsByDepartment

create view vWTotalSalesByProduct
with SchemaBinding
as
select EnglishProductName,
SUM(ISNULL((QuantitySold * ReorderPoint), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.DimProductSales
join dbo.DimProduct
on  dbo.DimProduct.ProductKey = dbo.DimProductSales.ProductId
group by EnglishProductName

select * from vWTotalSalesByProduct

create unique clustered index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(EnglishProductName)
execute sp_helpindex vWTotalSalesByProduct

Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select EmployeeKey, FirstName, Gender, ParentEmployeeKey
from  DimEmployee
where Gender = @Gender


Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select EmployeeKey, FirstName, Gender, ParentEmployeeKey
from DimEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('M')

Create View vWEmployeeDetailsSorted
as
Select EmployeeKey, FirstName, Gender, ParentEmployeeKey
from DimEmployee
order by EmployeeKey

Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable

