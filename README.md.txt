# Sales Performance Analysis & Business Intelligence Dashboard

## Project Overview

This project focuses on analysing retail sales data to identify business trends, evaluate profitability, understand customer purchasing behaviour, and generate actionable business recommendations.

The project uses the Sample Superstore dataset and demonstrates an end-to-end data analytics workflow using Python, SQL Server, spreadsheet analysis, and Microsoft Power BI.

## Project Objectives

- Analyse overall sales and profit performance.
- Identify high-performing and loss-making products.
- Evaluate regional and category-wise profitability.
- Understand customer segment performance.
- Analyse the relationship between discounts and profitability.
- Examine monthly and yearly sales trends.
- Develop an interactive Power BI dashboard.
- Provide data-driven business recommendations.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and exploratory data analysis |
| Pandas | Data manipulation and analysis |
| SQL Server | Database management and SQL analysis |
| WPS Spreadsheet | PivotTables, charts and spreadsheet analysis |
| Microsoft Power BI | Interactive dashboard and visualisation |
| GitHub | Project documentation and portfolio |

## Dataset

**Dataset:** Sample Superstore

**Source:** [Kaggle – Sample Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

The dataset contains retail transaction information, including orders, customers, products, sales, discounts, shipping details and profit.

- Total records: 9,994
- Original columns: 22
- Additional analytical columns: 3
- Final columns: 25

## Project Workflow

### 1. Data Cleaning – Python

- Imported the raw CSV dataset using Pandas.
- Checked missing values and duplicate records.
- Verified unique order and row identifiers.
- Converted date columns into appropriate formats.
- Created additional columns for shipping days, order year, month number and month name.
- Exported the cleaned dataset for further analysis.

### 2. Exploratory Data Analysis – Python

Performed exploratory analysis to understand:

- Overall sales and profit performance.
- Monthly and yearly sales trends.
- Regional and category performance.
- Customer segment performance.
- Discount and profitability patterns.
- Top-performing and loss-making products.

### 3. SQL Server Analysis

Imported 9,994 records into SQL Server and performed analytical queries using:

- Aggregate functions.
- GROUP BY and ORDER BY.
- Joins and subqueries.
- Common Table Expressions.
- Window functions.
- Ranking and running totals.
- Year-over-year and month-over-month analysis.
- Customer and product profitability analysis.

### 4. Spreadsheet Analysis – WPS Spreadsheet

Created PivotTables and charts to analyse:

- Regional performance.
- Category and sub-category profitability.
- Customer segments.
- Shipping modes.
- Monthly sales trends.
- Top customers and products.
- Loss-making products.
- State-wise sales and profit.

### 5. Power BI Dashboard

Developed an interactive dashboard containing:

**Key Performance Indicators**
- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Total Quantity Sold
- Average Discount
- Profit Margin
- Average Order Value

**Visualisations**
- Monthly Sales Trend
- Regional Sales and Profit Performance
- Category Sales and Profit Performance
- Sub-Category Profitability
- Customer Segment Performance
- Shipping Mode Performance
- State-wise Profit Performance

**Interactive Filters**
- Region
- Customer Segment
- Category
- Order Year

## Key Business Findings

### Overall Performance

| KPI | Result |
|---|---:|
| Total Sales | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Total Orders | 5,009 |
| Total Customers | 793 |
| Total Quantity Sold | 37,873 |
| Average Discount | 15.62% |
| Profit Margin | 12.47% |
| Average Order Value | $458.61 |

### Regional Performance

- West generated the highest sales of approximately $725,458.
- West also achieved the highest regional profit margin at 14.94%.
- Central had the lowest regional profit margin at 7.92%.

### Category Performance

- Technology generated the highest sales at approximately $836,154.
- Technology achieved a profit margin of 17.40%.
- Furniture had a significantly lower profit margin of 2.49%.

### Product Performance

- Canon imageCLASS 2200 Advanced Copier was the highest-sales product.
- Tables recorded the largest sub-category loss.
- Copiers generated the highest total sub-category profit.

### Customer Performance

- Consumer customers contributed the highest sales.
- Home Office achieved the highest profit margin among customer segments.
- Some high-sales customers were not necessarily highly profitable.

### Discount Analysis

- Orders without discounts generated approximately $320,988 in total profit.
- Discount levels of 30% and above were associated with aggregate losses in this dataset.

### State Performance

- California recorded the highest sales and profit.
- Texas recorded the largest state-level loss.

## Business Recommendations

1. Review pricing, discounting and cost structures for low-profit products, especially Tables.
2. Investigate the reasons behind low profitability in the Central region.
3. Evaluate furniture pricing and operating costs to improve margins.
4. Review high-discount transactions before approving large discounts.
5. Identify profitable customer groups and develop targeted retention strategies.
6. Use product-level profitability analysis to support inventory and pricing decisions.
7. Monitor state-level losses and investigate the factors affecting profitability.

## Project Deliverables

- Python data cleaning and exploratory analysis.
- SQL Server database and analytical queries.
- Spreadsheet analysis and PivotTables.
- Interactive Power BI dashboard.
- Business Insights and Recommendations report.

## Repository Structure

```text
Sales-Performance-Analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── python/
│
├── sql/
│
├── excel/
│
├── powerbi/
│
├── reports/
│
└── README.md
```

## Conclusion

This project demonstrates an end-to-end retail data analytics workflow, from raw data preparation and exploratory analysis to SQL-based business analysis, interactive visualisation and business recommendations.

The analysis highlights important opportunities to improve profitability, evaluate discount strategies, understand regional performance and make more informed business decisions.

---

**Project Title:** Sales Performance Analysis & Business Intelligence Dashboard

**Author:** Abilash Mariappan

**Domain:** Data Analytics | Business Intelligence | Retail Analytics