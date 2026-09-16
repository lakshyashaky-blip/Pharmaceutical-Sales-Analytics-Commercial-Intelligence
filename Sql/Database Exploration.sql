-- Database Exploration
--Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM FactSales;

--Date Range
SELECT
    MIN(d.Date) AS Start_Date,
    MAX(d.Date) AS End_Date
FROM FactSales f
JOIN DimDate d
    ON f.DateKey = d.DateKey;

--Total Products
SELECT COUNT(*) AS Total_Products
FROM DimProduct;

--Total Pharmacies
SELECT COUNT(*) AS Total_Pharmacies
FROM DimPharmacy;

--Countries Covered
SELECT DISTINCT Country
FROM DimPharmacy
ORDER BY Country;