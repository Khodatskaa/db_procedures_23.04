USE [db_procedure_hw_23.04]
GO

INSERT INTO Products (ProductID, ProductName, ProductType, Manufacturer)
VALUES 
    (1, 'Football', 'Sports Equipment', 'Nike'),
    (2, 'Basketball', 'Sports Equipment', 'Adidas')
;

INSERT INTO Customers (CustomerID, CustomerName, RegistrationDate)
VALUES 
    (1, 'John Doe', '2023-01-01'),
    (2, 'Jane Smith', '2023-02-15')
;

INSERT INTO Sales (SaleID, ProductID, CustomerID, SellerID, SalePrice, SaleDate)
VALUES 
    (1, 1, 1, 1, 50.00, '2023-01-05'),
    (2, 2, 2, 2, 40.00, '2023-02-20')
;
