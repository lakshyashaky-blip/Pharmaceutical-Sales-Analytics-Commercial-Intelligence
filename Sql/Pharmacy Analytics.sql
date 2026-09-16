--Pharmacy Analytics
--Top 10 Pharmacies
SELECT top 10
    p.PharmacyName,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID
GROUP BY p.PharmacyName
ORDER BY Revenue DESC

--Revenue by Pharmacy Type
SELECT
    p.PharmacyType,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue,
    ROUND(SUM(f.MarginEUR),2) AS Profit
FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID
GROUP BY p.PharmacyType;

--Store Size Performance
SELECT
    p.StoreSizeBand,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue,
    ROUND(SUM(f.MarginEUR),2) AS Profit
FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID
GROUP BY p.StoreSizeBand
ORDER BY Revenue DESC;