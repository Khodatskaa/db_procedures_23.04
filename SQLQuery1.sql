USE [db_procedure_practice_23.04]
GO

SELECT * FROM ExampleTable;

SELECT ID, Name FROM ExampleTable;

SELECT * FROM ExampleTable WHERE Value > 10;

SELECT e.ID, e.Name, o.OrderDate
FROM ExampleTable e
JOIN Orders o ON e.ID = o.ExampleTableID;

SELECT MAX(Value) AS MaxValue, MIN(Value) AS MinValue, AVG(Value) AS AvgValue
FROM ExampleTable;
