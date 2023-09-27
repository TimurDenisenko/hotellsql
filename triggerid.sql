create trigger trMyFirstTrigger
on Database
for CREATE_TABLE
AS
BEGIN
Print'New table created'
END

create table Test (id int)

alter trigger trMyFirstTrigger
on database 
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
print'A table has just been created, modified or deleted'
end

drop table test

alter trigger trMyFirstTrigger
on database 
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
rollback
print'You cannot create,alter or drop a table'
end

disable trigger trMyFirstTrigger on database

drop trigger trMyFirstTrigger on database

create trigger trRenameTable
on database
for RENAME
as
begin
print'You just renamed something'
end

sp_rename 'Test', 'NewTest' 

create trigger tr_DatabaseScopeTrigger
on database 
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
rollback
print'You cannot create,alter or drop a table'
end

drop table NewTest

create trigger tr_ServerScopeTrigger
on all server
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print'You cannot create,alter or drop a table in any database on the server'
end

disable trigger tr_ServerScopeTrigger on all server

enable trigger tr_ServerScopeTrigger on all server

drop trigger tr_ServerScopeTrigger on all server

SELECT name, is_disabled FROM sys.server_triggers

create trigger tr_DatabaseScopeTrigger
on database
for create_table
as
begin
print'Database Scope Trigger'
end
go

create table test(id int)

create trigger tr_ServerScopeTrigger
on database
for create_table
as
begin
print'Server Scope Trigger'
end
go

create table test1(id int)

create trigger tr_LogonAuditTriggers
on all server
for logon
as begin 
declare @LoginName nvarchar(100)
set @LoginName = ORIGINAL_LOGIN()
if (select COUNT(*) FROM sys.dm_exec_sessions
where is_user_process = 1
and original_login_name = @LoginName) > 3
begin
print'Fourth connection of'+ @LoginName + 'blocked'
rollback
end
end

Exec sp_readerrorlog
