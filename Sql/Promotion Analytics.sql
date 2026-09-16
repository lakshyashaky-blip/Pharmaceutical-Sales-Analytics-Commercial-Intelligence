--Promotion Analytics
--Promotion Performance
SELECT
    PromoFlag,
    ROUND(SUM(RevenueEUR),2) AS Revenue,
    ROUND(SUM(MarginEUR),2) AS Profit,
    SUM(UnitsSold) AS Units_Sold
FROM FactSales
GROUP BY PromoFlag;

--Margin Tier Analysis
SELECT
    Margin_Tier,
    ROUND(SUM(RevenueEUR),2) AS Revenue,
    ROUND(AVG(Profit_Margin_Pct),2) AS Average_Margin
FROM FactSales
GROUP BY Margin_Tier
ORDER BY Average_Margin DESC;

