SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    COUNT(DISTINCT [Customer ID]) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity_Sold,
    AVG(Discount) AS Average_Discount,
    SUM(Profit) / SUM(Sales) * 100 AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales;
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
    [Sub-Category],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY [Sub-Category]
ORDER BY Total_Profit DESC;
SELECT
    Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Average_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY Discount
ORDER BY Discount;
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    COUNT(DISTINCT [Customer ID]) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity,
    AVG(Discount) AS Average_Discount,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY Segment
ORDER BY Total_Sales DESC;
SELECT
    [Ship Mode],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    AVG(CAST([Shipping Days] AS DECIMAL(10,2))) AS Average_Shipping_Days,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY [Ship Mode]
ORDER BY Total_Sales DESC;
SELECT TOP 10
    [Customer ID],
    [Customer Name],
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Superstore_Sales
GROUP BY
    [Customer ID],
    [Customer Name]
ORDER BY Total_Profit DESC;
SELECT TOP 10
    [Customer ID],
    [Customer Name],
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Superstore_Sales
GROUP BY
    [Customer ID],
    [Customer Name]
ORDER BY Total_Profit ASC;
SELECT TOP 10
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin
FROM dbo.Superstore_Sales
GROUP BY State
ORDER BY Total_Sales DESC;
SELECT TOP 10
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin
FROM dbo.Superstore_Sales
GROUP BY State
ORDER BY Total_Profit ASC;
SELECT
    YEAR([Order Date]) AS Sales_Year,
    MONTH([Order Date]) AS Sales_Month,
    DATENAME(MONTH, [Order Date]) AS Month_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM dbo.Superstore_Sales
GROUP BY
    YEAR([Order Date]),
    MONTH([Order Date]),
    DATENAME(MONTH, [Order Date])
ORDER BY
    Sales_Year,
    Sales_Month;
WITH Yearly_Sales AS (
    SELECT
        YEAR([Order Date]) AS Sales_Year,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM dbo.Superstore_Sales
    GROUP BY YEAR([Order Date])
),
Sales_Comparison AS (
    SELECT
        Sales_Year,
        Total_Sales,
        Total_Profit,
        LAG(Total_Sales) OVER (
            ORDER BY Sales_Year
        ) AS Previous_Year_Sales
    FROM Yearly_Sales
)
SELECT
    Sales_Year,
    Total_Sales,
    Total_Profit,
    Previous_Year_Sales,
    ROUND(
        (Total_Sales - Previous_Year_Sales)
        / NULLIF(Previous_Year_Sales, 0) * 100,
        2
    ) AS Sales_Growth_Percentage
FROM Sales_Comparison
ORDER BY Sales_Year;
WITH Monthly_Sales AS (
    SELECT
        YEAR([Order Date]) AS Sales_Year,
        MONTH([Order Date]) AS Sales_Month,
        SUM(Sales) AS Monthly_Sales
    FROM dbo.Superstore_Sales
    GROUP BY
        YEAR([Order Date]),
        MONTH([Order Date])
)
SELECT
    Sales_Year,
    Sales_Month,
    Monthly_Sales,
    SUM(Monthly_Sales) OVER (
        ORDER BY Sales_Year, Sales_Month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_Total_Sales
FROM Monthly_Sales
ORDER BY Sales_Year, Sales_Month;
WITH Monthly_Sales AS (
    SELECT
        YEAR([Order Date]) AS Sales_Year,
        MONTH([Order Date]) AS Sales_Month,
        SUM(Sales) AS Total_Sales
    FROM dbo.Superstore_Sales
    GROUP BY
        YEAR([Order Date]),
        MONTH([Order Date])
),
Monthly_Comparison AS (
    SELECT
        Sales_Year,
        Sales_Month,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Sales_Year, Sales_Month
        ) AS Previous_Month_Sales
    FROM Monthly_Sales
)
SELECT
    Sales_Year,
    Sales_Month,
    Total_Sales,
    Previous_Month_Sales,
    ROUND(
        (Total_Sales - Previous_Month_Sales)
        / NULLIF(Previous_Month_Sales, 0) * 100,
        2
    ) AS MoM_Growth_Percentage
FROM Monthly_Comparison
ORDER BY Sales_Year, Sales_Month;
-- =============================================
-- STEP 21: TOP 10 PRODUCTS BY SALES
-- Purpose: Identify highest-revenue products
-- =============================================

SELECT TOP 10
    [Product ID],
    [Product Name],
    Category,
    [Sub-Category],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY
    [Product ID],
    [Product Name],
    Category,
    [Sub-Category]
ORDER BY Total_Sales DESC;
-- =============================================
-- STEP 22: TOP 10 PRODUCTS BY PROFIT
-- Purpose: Identify the most profitable products
-- =============================================

SELECT TOP 10
    [Product ID],
    [Product Name],
    Category,
    [Sub-Category],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY
    [Product ID],
    [Product Name],
    Category,
    [Sub-Category]
ORDER BY Total_Profit DESC;
-- =============================================
-- STEP 23: BOTTOM 10 PRODUCTS BY PROFIT
-- Purpose: Identify products generating losses
-- =============================================

SELECT TOP 10
    [Product ID],
    [Product Name],
    Category,
    [Sub-Category],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM dbo.Superstore_Sales
GROUP BY
    [Product ID],
    [Product Name],
    Category,
    [Sub-Category]
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;
-- =============================================
-- STEP 24: REPEAT CUSTOMER ANALYSIS
-- Purpose: Identify customers with multiple orders
-- =============================================

SELECT
    [Customer ID],
    [Customer Name],
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CASE
        WHEN COUNT(DISTINCT [Order ID]) > 1
        THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS Customer_Type
FROM dbo.Superstore_Sales
GROUP BY
    [Customer ID],
    [Customer Name]
ORDER BY Total_Orders DESC;
-- =============================================
-- STEP 25: CUSTOMER RETENTION ANALYSIS
-- Purpose: Calculate repeat and one-time customer rates
-- =============================================

WITH Customer_Order_Count AS (
    SELECT
        [Customer ID],
        COUNT(DISTINCT [Order ID]) AS Total_Orders
    FROM dbo.Superstore_Sales
    GROUP BY [Customer ID]
),
Customer_Segmentation AS (
    SELECT
        [Customer ID],
        Total_Orders,
        CASE
            WHEN Total_Orders > 1 THEN 'Repeat Customer'
            ELSE 'One-Time Customer'
        END AS Customer_Type
    FROM Customer_Order_Count
)
SELECT
    Customer_Type,
    COUNT(*) AS Total_Customers,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS Customer_Percentage
FROM Customer_Segmentation
GROUP BY Customer_Type;
-- =============================================
-- STEP 26: ORDER-LEVEL PROFITABILITY ANALYSIS
-- Purpose: Identify profitable and loss-making orders
-- =============================================

WITH Order_Profitability AS (
    SELECT
        [Order ID],
        [Customer ID],
        [Customer Name],
        MIN([Order Date]) AS Order_Date,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit,
        SUM(Quantity) AS Total_Quantity
    FROM dbo.Superstore_Sales
    GROUP BY
        [Order ID],
        [Customer ID],
        [Customer Name]
)
SELECT
    [Order ID],
    [Customer ID],
    [Customer Name],
    Order_Date,
    Total_Sales,
    Total_Profit,
    Total_Quantity,
    CASE
        WHEN Total_Profit > 0 THEN 'Profitable'
        WHEN Total_Profit < 0 THEN 'Loss-Making'
        ELSE 'Break-Even'
    END AS Order_Status
FROM Order_Profitability
ORDER BY Total_Profit ASC;
-- =============================================
-- STEP 27: ORDER PROFITABILITY SUMMARY
-- Purpose: Count profitable, loss-making, and break-even orders
-- =============================================

WITH Order_Profitability AS (
    SELECT
        [Order ID],
        SUM(Profit) AS Total_Profit
    FROM dbo.Superstore_Sales
    GROUP BY [Order ID]
)

SELECT
    CASE
        WHEN Total_Profit > 0 THEN 'Profitable'
        WHEN Total_Profit < 0 THEN 'Loss-Making'
        ELSE 'Break-Even'
    END AS Order_Status,

    COUNT(*) AS Total_Orders

FROM Order_Profitability
GROUP BY
    CASE
        WHEN Total_Profit > 0 THEN 'Profitable'
        WHEN Total_Profit < 0 THEN 'Loss-Making'
        ELSE 'Break-Even'
    END
ORDER BY Total_Orders DESC;
-- =============================================
-- STEP 28: REGIONAL PROFITABILITY RANKING
-- Purpose: Rank regions based on total profit
-- =============================================

WITH Regional_Profit AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM dbo.Superstore_Sales
    GROUP BY Region
)

SELECT
    Region,
    Total_Sales,
    Total_Profit,
    RANK() OVER (
        ORDER BY Total_Profit DESC
    ) AS Profit_Rank
FROM Regional_Profit
ORDER BY Profit_Rank;
-- =============================================
-- STEP 29: CATEGORY CONTRIBUTION ANALYSIS
-- Purpose: Calculate each category's percentage
-- contribution to total sales and total profit
-- =============================================

WITH Category_Performance AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM dbo.Superstore_Sales
    GROUP BY Category
)

SELECT
    Category,
    Total_Sales,
    Total_Profit,

    ROUND(
        Total_Sales * 100.0 /
        SUM(Total_Sales) OVER (), 2
    ) AS Sales_Contribution_Percent,

    ROUND(
        Total_Profit * 100.0 /
        NULLIF(SUM(Total_Profit) OVER (), 0), 2
    ) AS Profit_Contribution_Percent

FROM Category_Performance
ORDER BY Total_Sales DESC;
-- =============================================
-- STEP 30: MONTHLY SALES PERFORMANCE RANKING
-- Purpose: Rank each year-month combination
-- based on total sales
-- =============================================

WITH Monthly_Sales AS (
    SELECT
        YEAR([Order Date]) AS Sales_Year,
        MONTH([Order Date]) AS Sales_Month,
        DATENAME(MONTH, [Order Date]) AS Month_Name,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM dbo.Superstore_Sales
    GROUP BY
        YEAR([Order Date]),
        MONTH([Order Date]),
        DATENAME(MONTH, [Order Date])
)

SELECT
    Sales_Year,
    Sales_Month,
    Month_Name,
    Total_Sales,
    Total_Profit,

    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank

FROM Monthly_Sales
ORDER BY Sales_Rank;