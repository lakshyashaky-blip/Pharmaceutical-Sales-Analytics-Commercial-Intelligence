<div align="center">

# 💊 European Pharmacy Sales Analytics
### End-to-End Commercial Analytics | Python · SQL Server · Power BI

![Python](https://img.shields.io/badge/Python-Pandas%20%7C%20NumPy-3776AB?logo=python&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL_Server-MS--SQL-CC2927?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-DAX-F2C811?logo=powerbi&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green)

*Simulating a pharmaceutical distributor's commercial performance review across 9 European countries — from raw data to executive-ready insights.*

</div>

---

## 📊 Project at a Glance

| Metric | Value |
|---|---|
| 💰 Total Revenue | **€8.63M** |
| 📈 Total Profit | **€2.42M** |
| 🎯 Profit Margin | **28.04%** |
| 📦 Units Sold | **446K** |
| 💊 Products Tracked | **220** |
| 🏥 Pharmacies Covered | **120** |
| 🌍 Countries | **9** |
| 🧾 Transactions Analyzed | **62,139** |

---

## 🧠 Business Problem

Simulating a commercial analytics review for a pharmaceutical distributor operating across **Germany, France, Italy, Belgium, Netherlands, Spain, Poland, and Austria**. The objective: identify revenue drivers, margin risk areas, and expansion opportunities across products, pharmacies, and regions — the kind of analysis a commercial/market-access analytics team delivers to leadership.

## 🗂️ Dataset

- **Source:** European Pharmacy Sales Dataset (Kaggle)
- **Structure:** Star schema — `FactSales` fact table joined to `DimDate`, `DimPharmacy`, and `DimProduct` dimension tables

## ⚙️ Workflow

```
Raw Excel Data → Python (Clean + Engineer) → SQL Server (Model + Analyze) → Power BI (Visualize)
```

### 1️⃣ Data Cleaning — Python
- Loaded and split the source Excel workbook into per-table CSVs
- Removed duplicates across all four tables
- Corrected numeric anomalies (negative Revenue/Units/Cost/Profit set to null)
- Standardized string fields (trimmed whitespace, filled missing categorical values)

### 2️⃣ Feature Engineering — Python
- `Profit_Margin_Pct` — margin as a percentage of revenue
- `ASP` (Average Selling Price) — revenue per unit sold
- `Margin_Tier` — binned into High (≥30%), Medium (15–30%), Low (<15%)
- Calendar features on `DimDate` — Year, Quarter, Month name, Is_Weekend flag

### 3️⃣ Data Modeling & Analysis — SQL Server
- Star schema built in SQL Server
- KPI, geographic, product, pharmacy, promotion, and time-intelligence queries
- Window functions: `RANK()` for top product per category, `LAG()` for month-over-month growth, running totals with `SUM() OVER()`

### 4️⃣ Dashboard Development — Power BI
- 5-page interactive dashboard with cross-filtering, drill-through, and DAX measures
- Consistent visual theme applied across all pages

---

## 📈 Dashboard Preview

<details open>
<summary><b>Page 1 — Executive Overview</b></summary>
<br>
KPI summary (Revenue, Profit, Products, Units, Margin %, Pharmacies), monthly revenue trend, revenue by country, and category performance (revenue vs. profit).

![Executive Overview](Screenshots/Page%201.png)
</details>

<details>
<summary><b>Page 2 — Product Intelligence</b></summary>
<br>
Top products and brands by revenue, revenue split by generic vs. branded, top products by profit, and a category-level revenue/profit scatter.

![Product Intelligence](Screenshots/Page%202.png)
</details>

<details>
<summary><b>Page 3 — Pharmacy & Geographic Analysis</b></summary>
<br>
Revenue by country and region, pharmacy type mix, top 10 pharmacies by revenue, and revenue by store size band.

![Pharmacy & Geographic](Screenshots/Page%203.png)
</details>

<details>
<summary><b>Page 4 — Commercial Performance & Promotion</b></summary>
<br>
Promotion vs. non-promotion revenue impact, revenue by margin tier, monthly profit trend, and business recommendations.

![Commercial Performance](Screenshots/Page%204.png)
</details>

<details>
<summary><b>Page 5 — Executive Insights & Business Recommendations</b></summary>
<br>
Consolidated key findings, strategic recommendations, project workflow, and tools used.

![Executive Summary](Screenshots/Page%205.png)
</details>

---

## 💡 Key Insights

- 🇩🇪 **Germany** recorded the strongest revenue among the 9 countries covered
- 💊 **Prescription** products generated the highest revenue of all categories, followed by OTC and Wellness
- 📊 Medium and High margin tiers together account for the large majority of total revenue
- 🏆 Revenue is concentrated among a relatively small set of top-selling products and pharmacies

## 🎯 Business Recommendations

- Expand high-performing brands into currently underperforming regions
- Prioritize and protect high-margin products in commercial planning
- Re-evaluate pricing for high-revenue but low-margin products
- Monitor promotional campaigns for volume-margin tradeoffs — promotions lift sales volume but need profitability tracking
- Strengthen inventory planning around top-selling SKUs and pharmacies

---

## 📁 Repository Structure

```
european-pharmacy-sales-analytics/
├── README.md
├── .gitignore
├── LICENSE
├── project.ipynb          # Python data cleaning & feature engineering
├── Pharma.pbix             # Full interactive Power BI dashboard
└── Screenshots/
    ├── Page 1.png          # Executive Overview
    ├── Page 2.png          # Product Intelligence
    ├── Page 3.png          # Pharmacy & Geographic Analysis
    ├── Page 4.png          # Commercial Performance & Promotion
    └── Page 5.png          # Executive Insights & Recommendations
```

> 📌 SQL scripts (KPI, geographic, product, pharmacy, promotion, and time-intelligence queries) and the source dataset are being added to `sql/` and `data/` folders respectively.

## 🚀 How to Reproduce

1. Clone the repo and open `project.ipynb`
2. Run all cells to clean and feature-engineer the raw data
3. Load the cleaned data into SQL Server and run the SQL scripts to build the star schema and reproduce the analytical queries
4. Open `Pharma.pbix` in Power BI Desktop to explore the full interactive dashboard

## 🛠️ Tools Used

`Python` · `Pandas` · `NumPy` · `SQL Server (MS SQL)` · `Power BI` · `DAX` · `Microsoft Excel`

---

<div align="center">

**Author:** Apurv Bhawsar

</div>
