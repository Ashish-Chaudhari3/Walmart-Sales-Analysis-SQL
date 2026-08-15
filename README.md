# Walmart Sales Analysis — SQL

A SQL-based exploratory data analysis project using Walmart-style retail sales data. The project focuses on analyzing sales performance, product trends, customer behavior, payment methods, branch performance, and customer ratings using MySQL.

## Project Overview

| Item            | Details                   |
| --------------- | ------------------------- |
| Dataset         | Walmart Sales Dataset     |
| Records         | 1,000 transactions        |
| Cities          | 3                         |
| Branches        | 3                         |
| Product Lines   | 6                         |
| Customer Types  | 2                         |
| Payment Methods | 3                         |
| Database        | MySQL                     |
| Analysis Type   | Exploratory Data Analysis |

## Objectives

* Analyze overall sales and revenue performance.
* Identify top-performing product lines and cities.
* Evaluate customer purchasing patterns.
* Analyze payment methods and customer segments.
* Compare branch and gender-wise sales behavior.
* Analyze customer ratings across products, branches, days, and time periods.
* Extract business insights using SQL aggregation, filtering, subqueries, CTEs, and `CASE` statements.

## SQL Analysis

### Data Preparation

* Created the `walmartSales` database and `sales` table.
* Defined appropriate data types and primary key constraints.
* Added derived columns:

  * `time_of_day`
  * `day_name`
  * `month_name`

### Product Analysis

* Product-line performance
* Monthly revenue and COGS
* Highest-revenue products
* Product-line VAT contribution
* Average product ratings
* Product performance by gender
* Branch sales compared with average quantity sold

### Sales Analysis

* Sales by time of day and weekday
* Revenue by customer type
* VAT contribution by city
* VAT contribution by customer type

### Customer Analysis

* Customer-type distribution
* Payment-method usage
* Customer purchasing frequency
* Gender distribution
* Branch-wise gender distribution
* Ratings by time of day, branch, and weekday

## Key Findings

| Metric                       | Finding                  |
| ---------------------------- | ------------------------ |
| Highest Revenue City         | Naypyitaw                |
| Highest Revenue Product Line | Food and beverages       |
| Most Used Payment            | Ewallet                  |
| Customer Split               | 501 Members / 499 Normal |
| Gender Split                 | 501 Female / 499 Male    |
| Total Transactions           | 1,000                    |

## SQL Concepts Used

`CREATE DATABASE` · `CREATE TABLE` · `ALTER TABLE` · `UPDATE` · `SELECT` · `WHERE` · `GROUP BY` · `HAVING` · `ORDER BY` · `LIMIT` · Aggregate Functions · Subqueries · CTEs · `CASE` Statements · Date Functions

## Repository Structure

```text
Walmart-Sales-Analysis/
├── Walmart Sales Analysis Solution.sql
├── WalmartSalesData.csv
└── README.md
```

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Import `WalmartSalesData.csv` into the `sales` table.
3. Open `Walmart Sales Analysis Solution.sql`.
4. Execute the database and table creation statements.
5. Run the data preparation queries.
6. Execute the EDA queries to reproduce the analysis.

## Skills Demonstrated

SQL | Data Analysis | Exploratory Data Analysis | MySQL | Data Cleaning | Aggregation | Business Insights | Customer Analytics

## Project Outcome

This project demonstrates the ability to transform raw retail transaction data into structured business insights using SQL, with emphasis on sales performance, customer behavior, product analysis, and operational trends.
