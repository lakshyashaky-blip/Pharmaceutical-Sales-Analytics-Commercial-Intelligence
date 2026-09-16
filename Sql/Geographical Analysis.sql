--Geographic Analytics
--Revenue by Country
SELECT
    p.Country,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID
GROUP BY p.Country
ORDER BY Revenue DESC;

--Revenue by Region
SELECT
    p.Region,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID
GROUP BY p.Region
ORDER BY Revenue DESC;

--Top Cities by Revenue
SELECT top 15
    p.City,
    ROUND(SUM(f.RevenueEUR),2) AS Revenue
FROM FactSales f
JOIN DimPharmacy p
    ON f.PharmacyID = p.PharmacyID
GROUP BY p.City
ORDER BY Revenue DESC