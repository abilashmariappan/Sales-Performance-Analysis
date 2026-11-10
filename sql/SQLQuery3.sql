USE Sales_Performance_Analysis;
GO
CREATE TABLE dbo.Superstore_Sales (
    [Row ID] INT PRIMARY KEY,
    [Order ID] VARCHAR(20),
    [Order Date] DATE,
    [Ship Date] DATE,
    [Ship Mode] VARCHAR(30),
    [Customer ID] VARCHAR(20),
    [Customer Name] VARCHAR(100),
    [Segment] VARCHAR(30),
    [Country] VARCHAR(100),
    [City] VARCHAR(100),
    [State] VARCHAR(100),
    [Postal Code] VARCHAR(10),
    [Region] VARCHAR(30),
    [Product ID] VARCHAR(30),
    [Category] VARCHAR(50),
    [Sub-Category] VARCHAR(50),
    [Product Name] NVARCHAR(500),
    [Sales] DECIMAL(18,4),
    [Quantity] INT,
    [Discount] DECIMAL(5,4),
    [Profit] DECIMAL(18,4),
    [Shipping Days] INT
);
GO

USE Sales_Performance_Analysis;
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Superstore_Sales'
ORDER BY ORDINAL_POSITION;