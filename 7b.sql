create database fibo;
use fibo;

CREATE FUNCTION Fibo(@n INT)
RETURNS @tab TABLE(liczba int, nr int)
as
begin
declare 
@liczba int =0,
 @fib0 int =0,
 @fib1 int =1,
 @i int=2

--declare @tab table (liczba int)
insert into @tab values (@fib0, @i-2)

while (@i<= @n)
begin

set @liczba=@fib0+@fib1
set @fib1=@fib0
set @fib0=@liczba
set @i+=1
insert into @tab values (@fib0,@i-2)
end
return 
end;


CREATE OR ALTER PROCEDURE fib(@n INT)
AS
BEGIN
SELECT * FROM dbo.Fibo(@n)
END;


EXEC fib 20;

