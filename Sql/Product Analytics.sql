--Product Analytics
--Top 10 Products by Revenue
SELECT TOP 10
    p.ProductName,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC

--Top 10 Products by Profit
SELECT TOP 10
    p.ProductName,
    ROUND(SUM(f.MarginEUR),2) AS Profit
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Profit DESC

--Bottom 10 Products by Revenue
SELECT TOP 10
    p.ProductName,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue

--Revenue by Category
SELECT top 10
    p.Category,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

--Brand vs Generic Performance
WITH ProductData AS (
    SELECT 
        (CASE 
            WHEN p.IsGeneric = 1 THEN 'Generic'
            ELSE 'Branded'
        END) AS Product_Type,
        f.RevenueEUR,
        f.MarginEUR
    FROM FactSales f
    JOIN DimProduct p 
        ON f.ProductID = p.ProductID
)
SELECT 
    Product_Type,
    ROUND(SUM(RevenueEUR), 2) AS Revenue,
    ROUND(SUM(MarginEUR), 2) AS Profit
FROM ProductData
GROUP BY 
    Product_Type;

--Highest Margin Products
SELECT Top 15
    p.ProductName,
    ROUND(AVG(f.Profit_Margin_Pct),2) AS Avg_Margin
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Avg_Margin DESC