


--CREATE FUNCTION Fibo(@m INT)
--RETURNS @tab TABLE(ciag_fibonacciego int)
--as
--begin
declare @n int=0,
 @fib0 int =0,
 @fib1 int =1,
 @i int=2
declare @tab table (liczba int)
insert into @tab values (@fib0)

while (@i<= 47)
begin

set @n=@fib0+@fib1
set @fib1=@fib0
set @fib0=@n
set @i+=1
insert into @tab values (@fib0)
end
--return 
--end;


--CREATE OR ALTER PROCEDURE fibo(@x INT)
--AS
--BEGIN
--SELECT * FROM dbo.Fibo(@x)
--END;


--EXEC fibo 15;

select*from @tab