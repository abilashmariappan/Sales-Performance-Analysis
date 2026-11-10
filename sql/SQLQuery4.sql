SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Superstore_Sales'
ORDER BY ORDINAL_POSITION;
SELECT COUNT(*) AS Total_Records
FROM dbo.Superstore_Sales;
SELECT COUNT(*) AS Total_Records
FROM dbo.Superstore_Sales;
SELECT COUNT(*) AS Total_Records
FROM dbo.Superstore_Sales;
SELECT TOP 10 *
FROM dbo.Superstore_Sales;
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM dbo.Superstore_Sales;