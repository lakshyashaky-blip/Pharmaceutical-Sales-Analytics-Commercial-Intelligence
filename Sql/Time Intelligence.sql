--Time Intelligence
--Monthly Revenue
SELECT
    d.YearMonth,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimDate d
    ON f.DateKey = d.DateKey
GROUP BY d.YearMonth
ORDER BY d.YearMonth;

--Quarterly Revenue
SELECT
    d.Year,
    d.Quarter,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimDate d
    ON f.DateKey = d.DateKey
GROUP BY d.Year,d.Quarter
ORDER BY d.Year,d.Quarter;

--Weekend vs Weekday Sales
SELECT
    d.Is_Weekend,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue,
    ROUND(SUM(f.MarginEUR),2) AS Profit
FROM FactSales f
JOIN DimDate d
    ON f.DateKey = d.DateKey
GROUP BY d.Is_Weekend;