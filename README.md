<div align="center">

<img src="walmart_logo.png" alt="Walmart Logo" width="180"/>

<br>

# Walmart Sales Analysis

### SQL-Based Exploratory Analysis of Retail Performance Across Branches

<p>
  <img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Transactions-1,000-0071CE?style=flat-square" />
  <img src="https://img.shields.io/badge/Status-Complete-2ECC71?style=flat-square" />
</p>

<sub>Translating raw transaction data into revenue, customer, and product insights through structured SQL analysis.</sub>

</div>

<br>

---

## Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Repository Structure](#repository-structure)
- [Tools & Techniques](#tools--techniques)
- [Business Problems Solved](#business-problems-solved)
- [How to Run](#how-to-run)
- [Key Takeaways](#key-takeaways)
- [Project Context](#project-context)
- [Author](#author)

---

<br>

## Overview

This project analyzes Walmart's sales transaction data using SQL to answer product, sales, and customer-behavior questions across three branches. The workflow spans data preparation and feature engineering — deriving time-of-day and day-of-week fields — followed by structured exploratory analysis across product lines, revenue, VAT, and customer ratings.

The objective is to translate a flat transaction table into the kind of insights a retail analyst would be expected to produce: which branch, product line, or customer segment drives the most revenue, and under what conditions.

<br>

## Dataset

<div align="center">

| Metric | Value |
|:---|:---:|
| Total Transactions | 1,000 |
| Date Range | Jan 2019 – Mar 2019 |
| Branches | A · B · C |
| Cities | Yangon · Mandalay · Naypyitaw |
| Product Lines | 6 |
| Customer Types | Member · Normal |
| Payment Methods | Ewallet · Cash · Credit Card |
| Total Revenue | $322,966.75 |
| Units Sold | 5,510 |

</div>

**Columns:** `Invoice ID` · `Branch` · `City` · `Customer Type` · `Gender` · `Product Line` · `Unit Price` · `Quantity` · `Tax 5%` · `Total` · `Date` · `Time` · `Payment` · `COGS` · `Gross Margin %` · `Gross Income` · `Rating`

**Product Lines:** Health and Beauty, Electronic Accessories, Home and Lifestyle, Sports and Travel, Food and Beverages, Fashion Accessories

**Source:** [Walmart Sales Forecasting dataset (Kaggle)](https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales)

<br>

## Repository Structure

```
├── WalmartSalesData_csv.csv                # Raw dataset
├── Walmart_Sales_Analysis_Solution.sql     # Schema, feature engineering & full EDA
└── README.md
```

<br>

## Tools & Techniques

| Technique | Application |
|:---|:---|
| Schema Design | Typed table creation with `PRIMARY KEY` and `NOT NULL` constraints |
| Feature Engineering | Derived `time_of_day`, `day_name`, and `month_name` columns using `CASE`, `DAYNAME()`, `MONTHNAME()` |
| Aggregation | `SUM`, `AVG`, `COUNT` across multiple business dimensions |
| CTEs & Classification | `WITH` clause combined with `CASE` to label product lines as "Good" or "Bad" by rating |
| Filtered Aggregates | `HAVING` to isolate branches selling above the average quantity |

<br>

## Business Problems Solved

**Generic**
- Distinct cities represented in the dataset, and which city each branch operates in

**Product Analysis**
- Most common payment method
- Best-selling and highest-revenue product lines
- Monthly revenue and COGS trends
- Product line with the highest VAT
- Product line rating classification (Good ≥ 7, otherwise Bad)
- Branches selling above the average quantity
- Most common product line by gender; average rating per product line

**Sales Analysis**
- Sales volume by time of day, per weekday
- Revenue by customer type
- City and customer type with the highest VAT paid

**Customer Analysis**
- Unique customer types and payment methods
- Most common customer type and gender distribution (overall and per branch)
- Time of day and day of week with the highest average ratings (overall and per branch)

<br>

## How to Run

| Step | Action |
|:---:|:---|
| 1 | Clone this repository |
| 2 | Open `Walmart_Sales_Analysis_Solution.sql` in MySQL Workbench or any MySQL client |
| 3 | Run the script top to bottom to create the `walmartSales` database, `sales` table, and populate `time_of_day`, `day_name`, `month_name` |
| 4 | Import `WalmartSalesData_csv.csv` into the `sales` table via the Table Data Import Wizard or `LOAD DATA INFILE` |
| 5 | Run any EDA query below the feature-engineering section to reproduce the analysis |

<br>

## Key Takeaways

- Revenue is fairly evenly distributed across the three branches, with no single branch dominating — useful for benchmarking staffing and inventory decisions
- Member customers and Ewallet payments appear as recurring high-frequency segments worth prioritizing in loyalty and retention campaigns
- Ratings cluster in the 6–8 range across product lines, so the Good/Bad threshold at 7 cleanly separates over- and under-performing categories

<br>

## Project Context

This is one of several projects in my Data Analytics portfolio:

| Project | Focus |
|:---|:---|
| [Netflix Titles SQL Analysis](#) | SQL joins, CTEs, window functions on ~8,800 records |
| [Spotify Trends Power BI Dashboard](#) | DAX and Power BI on ~28,000 songs |
| [Zomato Restaurant EDA](#) | Python/Pandas exploratory analysis |
| [Adidas Sales KPI Dashboard](#) | Excel PivotTables and interactive dashboarding |
| **Walmart Sales Analysis** *(this repository)* | SQL feature engineering and multi-dimensional EDA |

<br>

## Author

<div align="center">

**Ashish Chaudhari**
B.Tech Computer Science · Data Science Certified
Pune, India

[![GitHub](https://img.shields.io/badge/GitHub-Ashish--Chaudhari3-181717?style=flat-square&logo=github)](https://github.com/Ashish-Chaudhari3)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-ashishchaudhari03-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/ashishchaudhari03)
[![Portfolio](https://img.shields.io/badge/Portfolio-ashish--work.lovable.app-000000?style=flat-square&logo=vercel&logoColor=white)](https://ashish-work.lovable.app)

</div>

<br>

---

<div align="center">
<sub>If you found this project useful, please consider giving it a star.</sub>
</div>
