CREATE DATABASE [db_procedure_hw_23.04]
GO
USE [db_procedure_hw_23.04]
GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    ProductType NVARCHAR(50),
    Manufacturer NVARCHAR(100)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SellerID INT,
    SalePrice DECIMAL(10, 2),
    SaleDate DATETIME
);

CREATE PROCEDURE GetAllProductsInfo
AS
BEGIN
    SELECT * FROM Products;
END;

CREATE PROCEDURE GetProductsByType
    @productType NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Products WHERE ProductType = @productType;
END;

CREATE PROCEDURE GetTop3OldestCustomers
AS
BEGIN
    SELECT TOP 3 * FROM Customers ORDER BY RegistrationDate;
END;

CREATE PROCEDURE GetMostSuccessfulSalesperson
AS
BEGIN
    SELECT TOP 1 e.FullName AS SalespersonName, SUM(s.SalePrice) AS TotalSales
    FROM Sales s
    INNER JOIN Employees e ON s.SellerID = e.EmployeeID
    GROUP BY e.FullName
    ORDER BY TotalSales DESC;
END;

CREATE PROCEDURE CheckManufacturerProductAvailability
    @manufacturer NVARCHAR(100),
    @availability BIT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Products WHERE Manufacturer = @manufacturer)
        SET @availability = 1;
    ELSE
        SET @availability = 0;
END;

CREATE PROCEDURE GetMostPopularManufacturer
AS
BEGIN
    SELECT TOP 1 p.Manufacturer, SUM(s.SalePrice) AS TotalSales
    FROM Sales s
    INNER JOIN Products p ON s.ProductID = p.ProductID
    GROUP BY p.Manufacturer
    ORDER BY TotalSales DESC;
END;

CREATE PROCEDURE DeleteCustomersRegisteredAfterDate
    @registrationDate DATE,
    @deletedCount INT OUTPUT
AS
BEGIN
    DELETE FROM Customers WHERE RegistrationDate > @registrationDate;
    SET @deletedCount = @@ROWCOUNT;
END;
