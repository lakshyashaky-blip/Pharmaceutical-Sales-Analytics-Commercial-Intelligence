-- Executive KPIs
-- Total Revenue
SELECT
    ROUND(SUM(RevenueEUR),2) AS Total_Revenue
FROM FactSales;

-- Total Cost
SELECT
    ROUND(SUM(CostEUR),2) AS Total_Cost
FROM FactSales; 

-- Total Profit
SELECT
    ROUND(SUM(MarginEUR),2) AS Total_Profit
FROM FactSales;

-- Total Units Sold
SELECT
    SUM(UnitsSold) AS Total_Units_Sold
FROM FactSales;

-- Average Selling Price
SELECT
    ROUND(AVG(ASP),2) AS Average_Selling_Price
FROM FactSales;

-- Average Profit Margin %
SELECT
    ROUND(AVG(Profit_Margin_Pct),2) AS Average_Profit_Margin
FROM FactSales;