SELECT name
FROM sys.databases
WHERE name = 'Sales_Performance_Analysis';
USE Sales_Performance_Analysis;
GO

SELECT DB_NAME() AS Current_Database;