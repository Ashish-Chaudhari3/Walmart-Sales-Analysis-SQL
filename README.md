# Walmart Sales Analysis

## Overview

A SQL-based exploratory analysis of Walmart sales data to identify sales trends, customer behavior, product performance, and branch-level insights using MySQL.

## Dataset

* 1,000 sales transactions
* 3 branches across 3 cities
* 6 product categories
* Customer, payment, sales, tax, profit, and rating information
* Period: January–March 2019

## Objectives

* Analyze overall sales and revenue performance
* Identify top-performing products and branches
* Understand customer purchasing behavior
* Analyze payment methods and customer demographics
* Evaluate ratings by product, branch, day, and time
* Identify monthly and time-of-day sales patterns

## Analysis Performed

### Product Analysis

* Product-line sales and revenue
* Monthly revenue and COGS
* Product-line ratings
* Product performance by gender
* Branch sales performance

### Sales Analysis

* Revenue by customer type and city
* Sales by time of day and weekday
* Tax and revenue analysis
* Monthly sales trends

### Customer Analysis

* Customer-type distribution
* Payment-method usage
* Gender distribution
* Ratings by time of day and day of week
* Customer behavior across branches

## Key Results

* Total revenue: **$322,966.75**
* Total quantity sold: **5,510 units**
* Total gross income: **$15,379.37**
* Highest-revenue city/branch: **Naypyitaw / Branch C**
* Highest-revenue product line: **Food and beverages**
* Highest-revenue customer type: **Member**
* Most-used payment method by transaction count: **Ewallet**
* Highest-revenue month: **January**
* Overall average customer rating: **6.97/10**

## SQL Concepts Used

`SELECT` · `WHERE` · `GROUP BY` · `HAVING` · `ORDER BY` · `LIMIT` · `COUNT` · `SUM` · `AVG` · `DISTINCT` · `CASE` · `CTE` · Subqueries · Date & Time Functions

## Project Structure

```text
Walmart-Sales-Analysis/
│
├── Walmart Sales Analysis Solution.sql
├── WalmartSalesData.csv
└── README.md
```

## Tools

* MySQL
* SQL
* CSV Dataset

## Conclusion

The analysis provides a structured view of Walmart's sales performance and customer behavior, demonstrating practical SQL skills in data exploration, aggregation, segmentation, and business-oriented analysis.
