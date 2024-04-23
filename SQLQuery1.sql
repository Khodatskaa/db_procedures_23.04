CREATE DATABASE [db_procedure_practice_23.04];
GO
USE [db_procedure_practice_23.04];
GO

CREATE TABLE ExampleTable (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
	Date DATE,
	Time TIME,
    Value INT
);
GO

CREATE PROCEDURE HelloWorld
AS
BEGIN
    PRINT 'Hello, world!';
END;
GO

CREATE PROCEDURE GetCurrentTime
AS
BEGIN
    SELECT GETDATE() AS CurrentTime;
END;
GO

CREATE PROCEDURE GetCurrentDate
AS
BEGIN
    SELECT CONVERT(date, GETDATE()) AS CurrentDate;
END;
GO

CREATE PROCEDURE CalculateSum
    @num1 INT,
    @num2 INT,
    @num3 INT
AS
BEGIN
    SELECT @num1 + @num2 + @num3 AS Sum;
END;
GO

CREATE PROCEDURE CalculateMean
    @num1 INT,
    @num2 INT,
    @num3 INT
AS
BEGIN
    SELECT (@num1 + @num2 + @num3) / 3.0 AS Mean;
END;
GO

CREATE PROCEDURE GetMaxValue
    @num1 INT,
    @num2 INT,
    @num3 INT
AS
BEGIN
    SELECT MAX(val) AS MaxValue
    FROM (VALUES (@num1), (@num2), (@num3)) AS Numbers(val);
END;
GO

CREATE PROCEDURE GetMinValue
    @num1 INT,
    @num2 INT,
    @num3 INT
AS
BEGIN
    SELECT MIN(val) AS MinValue
    FROM (VALUES (@num1), (@num2), (@num3)) AS Numbers(val);
END;
GO

CREATE PROCEDURE GenerateLine
    @length INT,
    @symbol NVARCHAR(1)
AS
BEGIN
    DECLARE @line NVARCHAR(MAX) = REPLICATE(@symbol, @length);
    PRINT @line;
END;
GO

CREATE PROCEDURE CalculateFactorial
    @number INT
AS
BEGIN
    DECLARE @factorial BIGINT = 1;
    DECLARE @i INT = 1;
    WHILE @i <= @number
    BEGIN
        SET @factorial = @factorial * @i;
        SET @i = @i + 1;
    END;
    SELECT @factorial AS Factorial;
END;
GO

CREATE PROCEDURE CalculatePower
    @base INT,
    @exponent INT
AS
BEGIN
    SELECT POWER(@base, @exponent) AS Result;
END;
GO

EXEC HelloWorld;
EXEC GetCurrentTime;
EXEC GetCurrentDate;
EXEC CalculateSum 5, 10, 15;
EXEC CalculateMean 5, 10, 15;
EXEC GetMaxValue 5, 10, 15;
EXEC GetMinValue 5, 10, 15;
EXEC GenerateLine 10, '*';
EXEC CalculateFactorial 5;
EXEC CalculatePower 2, 3;