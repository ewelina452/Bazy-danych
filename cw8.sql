use AdventureWorks2019;

Select * from HumanResources.Employee;
select * from person.Person;
select*from HumanResources.EmployeePayHistory;
 
 --1.
 begin
 select AVG(HumanResources.EmployeePayHistory.Rate ) AS œrednia from HumanResources.EmployeePayHistory;
 select FirstName, LastName, JobTitle, rate 
 from HumanResources.Employee, person.Person, HumanResources.EmployeePayHistory 
 where HumanResources.Employee.BusinessEntityID=Person.person.BusinessEntityID 
 and HumanResources.EmployeePayHistory.BusinessEntityID=HumanResources.Employee.BusinessEntityID 
 and  rate < (select avg(Rate) from HumanResources.EmployeePayHistory) order by rate;

 end;

 --2.
 create or alter function zwroc_date(@numer int)
returns @tab table (numer int, zwroc_date datetime)
as begin
insert into @tab
select SalesOrderID, ShipDate from Sales.SalesOrderHeader
where SalesOrderID=@numer;
return
end;


select * from dbo.zwroc_date(43661);

--3.
create or alter procedure produkt(@nazwa varchar(20))
as begin
select Product.ProductID, ProductNumber, sum(ProductInventory.Quantity) as Quantity from production.Product, Production.ProductInventory
where production.Product.ProductID=Production.ProductInventory.ProductID and Product.name=@nazwa group by Product.ProductID,Product.ProductNumber;

end;
exec produkt 'Adjustable Race';




--select * from production.Product;
--select *from production.ProductInventory;

--4

create or alter function zwroc_karte(@numer int)
returns @tab table (nr_karty varchar(20))
as begin
insert into @tab
select Sales.CreditCard.CardNumber from sales.CreditCard, sales.SalesOrderHeader where Sales.CreditCard.CreditCardID= sales.SalesOrderHeader.CreditCardID
and SalesOrderID=@numer;

return
end;

select*from dbo.zwroc_karte(43659);


select * from sales.CreditCard;
select* from sales.SalesOrderHeader;

--5.

create or alter procedure dzielenie(@num1 float, @num2 float)
as begin
if(@num1<@num2)
print 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
else 
declare @wynik float
set @wynik = @num1/@num2
select @wynik
end;

exec dzielenie 10,3;

--6.
create or alter procedure dni(@numer varchar(15))
as begin
select JobTitle, VacationHours/8 as VacationDays, SickLeaveHours/8 as SickDays from HumanResources.Employee where NationalIDNumber=@numer
end;

exec dni'295847284';

select * from humanResources.employee

--7
SELECT * FROM Sales.CurrencyRate
select*from sales.Currency

create or alter procedure kalk(@kwota float, @waluta_z varchar(5), @waluta_na varchar(5),@data datetime)
as begin
if @waluta_z ='USD'
select Sales.CurrencyRate.FromCurrencyCode, Sales.CurrencyRate.ToCurrencyCode,@kwota as kwota, round(@kwota*AverageRate,2) as wartosc
from Sales.CurrencyRate where FromCurrencyCode=@waluta_z and ToCurrencyCode=@waluta_na and CurrencyRateDate=@data
if @waluta_na ='USD'
select Sales.CurrencyRate.ToCurrencyCode as FromCurrencyCode,Sales.CurrencyRate.FromCurrencyCode as ToCurrencyCode,@kwota as kwota,  round(@kwota/AverageRate,2) as wartosc
from Sales.CurrencyRate where FromCurrencyCode=@waluta_na and ToCurrencyCode=@waluta_z and CurrencyRateDate=@data

end;


exec kalk 100,'USD','EUR', '2011-05-31 00:00:00.000';
exec kalk 100,'EUR','USD', '2011-05-31 00:00:00.000';
