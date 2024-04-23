USE [db_procedure_hw_23.04]
GO

EXEC GetAllProductsInfo;

EXEC GetProductsByType 'Sports Equipment';

EXEC GetTop3OldestCustomers;

EXEC GetMostSuccessfulSalesperson;

DECLARE @availability BIT;
EXEC CheckManufacturerProductAvailability 'Nike', @availability OUTPUT;
PRINT 'Availability: ' + CASE WHEN @availability = 1 THEN 'Yes' ELSE 'No' END;

EXEC GetMostPopularManufacturer;

DECLARE @deletedCount INT;
EXEC DeleteCustomersRegisteredAfterDate '2023-02-01', @deletedCount OUTPUT;
PRINT 'Number of deleted customers: ' + CAST(@deletedCount AS VARCHAR(10));
