create database Temp;
go
use Temp;
create table [Type] (
[Type_Id] int primary key identity not null,
[Type_Name] nvarchar(max) not null 
);
go
create table RegChief(
RegChief_Id int primary key identity,
RegChief_Name nvarchar(max)
);
go
create table [External](
External_Id int primary key identity,
External_Bool bit,
BankExternal nvarchar(max),
InnExternal nvarchar(max),
AddressExternal nvarchar(max)
);
go
create table Reg(
Reg_Id int primary key identity,
RegNumber nvarchar(max),
RegName nvarchar(max),
RegChief_Id int references RegChief (RegChief_Id),
[Type_Id] int references [Type] ([Type_Id]),
TypeYear int
);
go
create table TypeRepair(
TypeRepair_Id int primary key identity,
TypeRepair_Name nvarchar(max)
);
go
create table Chief(
Chief_Id int primary key identity,
FIOchief nvarchar(max),
Base nvarchar(max)
);
go
create table Worker(
Worker_Id int primary key identity,
FIOworker nvarchar(max),
BaseWorker nvarchar(max),
YearWorker tinyint,
SpecialWorker nvarchar(max),
BonusWorker money,
Comment nvarchar(max),
NumberBankKart nvarchar(max)
);
go 
create table Brigada(
Brigada_Id int primary key identity,
Chief_Id int references Chief(Chief_Id),
Workers nvarchar(max)
);
go
create table Repair(
Repair_Id int primary key identity,
TypeRepair_Id int references TypeRepair(TypeRepair_Id),
Picture nvarchar(max),
Repair_Money money,
Bonus bit,
BonusPercent tinyint,
DateStart date,
DateStop date,
Reason nvarchar(max),
Brigada_Id int references Brigada(Brigada_Id)
);