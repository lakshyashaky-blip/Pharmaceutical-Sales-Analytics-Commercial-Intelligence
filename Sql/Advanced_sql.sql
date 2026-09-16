--Advanced SQL
--Top Product in Every Category
WITH ProductRevenue AS
(
SELECT
    p.Category,
    p.ProductName,
    SUM(f.RevenueEUR) AS Revenue,

    RANK() OVER
    (
        PARTITION BY p.Category
        ORDER BY SUM(f.RevenueEUR) DESC
    ) AS RankNo

FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID

GROUP BY
    p.Category,
    p.ProductName
)

SELECT *
FROM ProductRevenue
WHERE RankNo = 1;

--Monthly Revenue Growth
WITH MonthlySales AS
(
SELECT
    d.YearMonth,
    SUM(f.RevenueEUR) AS Revenue
FROM FactSales f
JOIN DimDate d
    ON f.DateKey = d.DateKey
GROUP BY d.YearMonth
)

SELECT
    YearMonth,
    Revenue,
    LAG(Revenue) OVER (ORDER BY YearMonth) AS Previous_Month,
    Revenue -
    LAG(Revenue) OVER (ORDER BY YearMonth) AS Revenue_Growth
FROM MonthlySales;

--Running Revenue
SELECT
    d.YearMonth,

    SUM(f.RevenueEUR) AS Monthly_Revenue,

    SUM(SUM(f.RevenueEUR))
    OVER (ORDER BY d.YearMonth) AS Running_Revenue

FROM FactSales f
JOIN DimDate d
    ON f.DateKey = d.DateKey

GROUP BY d.YearMonth;

--Revenue Contribution by Country
SELECT

    p.Country,

    ROUND(
        100 * SUM(f.RevenueEUR)
        / SUM(SUM(f.RevenueEUR)) OVER (),
        2
    ) AS Revenue_Contribution_Percent

FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID

GROUP BY p.Country

ORDER BY Revenue_Contribution_Percent DESC;