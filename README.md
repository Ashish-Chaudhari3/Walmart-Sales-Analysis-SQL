# 🛒 Walmart Sales Analysis — SQL

![Walmart Logo](Walmart_LOGO_only.jpg)

## 📌 Project Overview

This project performs an **end-to-end sales analysis using MySQL** on a transactional retail dataset containing 1,000 sales records.

The objective is to transform raw transactional data into meaningful business insights by analyzing:

* Sales and revenue performance
* Product-line performance
* Branch and city performance
* Customer behavior
* Payment methods
* Gender distribution
* Customer ratings
* Time-of-day sales patterns
* Daily and monthly trends
* Cost of Goods Sold (COGS)
* Gross income and VAT/tax contribution

The project demonstrates practical SQL skills including **database creation, table design, data transformation, aggregation, subqueries, Common Table Expressions (CTEs), CASE statements, date functions, filtering, grouping, and business-oriented analysis**.

> **Dataset note:** Although the project is titled "Walmart Sales Analysis", the supplied dataset contains transactions from three cities—Yangon, Naypyitaw, and Mandalay—and should be treated as a retail sales practice dataset rather than official Walmart corporate data.

---

## 🎯 Business Objective

The main goal of this project is to answer practical business questions such as:

* Which product categories generate the most revenue?
* Which branch and city perform best?
* What are the most popular payment methods?
* Which customer segment generates more revenue?
* When are customers most active?
* Which product lines receive the highest ratings?
* Which months generate the highest revenue?
* How do customer demographics vary across branches?
* Which products contribute the most to tax/VAT and gross income?

The analysis converts raw transaction-level data into insights that can support **sales strategy, inventory planning, customer segmentation, and branch-level decision-making**.

---

## 📊 Dataset

The dataset contains **1,000 transactions** and **17 original columns**.

### Dataset Summary

| Metric                  |                Value |
| ----------------------- | -------------------: |
| Total Transactions      |                1,000 |
| Total Quantity Sold     |                5,510 |
| Total Revenue / Sales   |          $322,966.75 |
| Total COGS              |          $307,587.38 |
| Total Gross Income      |           $15,379.37 |
| Average Customer Rating |            6.97 / 10 |
| Cities                  |                    3 |
| Branches                |                    3 |
| Product Lines           |                    6 |
| Customer Types          |                    2 |
| Payment Methods         |                    3 |
| Date Range              | Jan 1 – Mar 30, 2019 |

### Original Columns

| Column                    | Description                      |
| ------------------------- | -------------------------------- |
| `Invoice ID`              | Unique transaction identifier    |
| `Branch`                  | Store branch identifier          |
| `City`                    | City where the branch is located |
| `Customer type`           | Member or Normal customer        |
| `Gender`                  | Customer gender                  |
| `Product line`            | Product category                 |
| `Unit price`              | Price per unit                   |
| `Quantity`                | Number of units purchased        |
| `Tax 5%`                  | 5% tax/VAT amount                |
| `Total`                   | Total transaction value          |
| `Date`                    | Transaction date                 |
| `Time`                    | Transaction time                 |
| `Payment`                 | Payment method                   |
| `cogs`                    | Cost of Goods Sold               |
| `gross margin percentage` | Gross margin percentage          |
| `gross income`            | Gross income                     |
| `Rating`                  | Customer rating                  |

---

## 🛠️ Tech Stack

* **Database:** MySQL
* **Language:** SQL
* **Dataset:** CSV
* **Version Control:** Git / GitHub
* **Analysis Type:** Exploratory Data Analysis & Business Analytics

### SQL Concepts Used

* `CREATE DATABASE`
* `CREATE TABLE`
* `ALTER TABLE`
* `UPDATE`
* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* Aggregate functions
* `COUNT()`
* `SUM()`
* `AVG()`
* `ROUND()`
* `DISTINCT`
* `CASE WHEN`
* Subqueries
* Common Table Expressions (CTEs)
* Date functions
* `DAYNAME()`
* `MONTHNAME()`

---

## 🗂️ Project Structure

```text
Walmart-Sales-Analysis/
│
├── WalmartSalesData.csv.csv
├── Walmart Sales Analysis Solution.sql
├── Walmart_LOGO_only.jpg
└── README.md
```

---

# 🔄 Project Workflow

```text
Raw CSV Dataset
       ↓
Database & Table Creation
       ↓
Data Import
       ↓
Data Transformation
       ↓
Feature Engineering
       ↓
Exploratory Data Analysis
       ↓
Product Analysis
       ↓
Sales Analysis
       ↓
Customer Analysis
       ↓
Business Insights
```

---

# 🧱 1. Database & Table Creation

The project begins by creating a MySQL database:

```sql
CREATE DATABASE IF NOT EXISTS walmartSales;
USE walmartSales;
```

A structured `sales` table is then created with appropriate data types and constraints.

The `invoice_id` column is defined as the **primary key**, ensuring that each transaction has a unique identifier.

---

# 🔧 2. Data Transformation

Three additional analytical columns are created from the existing date and time information.

### Time of Day

Transactions are classified into:

* Morning
* Afternoon
* Evening

```sql
CASE
    WHEN time BETWEEN '00:00:00' AND '12:00:00'
        THEN 'Morning'
    WHEN time BETWEEN '12:01:00' AND '16:00:00'
        THEN 'Afternoon'
    ELSE 'Evening'
END
```

### Day Name

The transaction date is converted into the corresponding weekday using:

```sql
DAYNAME(date)
```

### Month Name

The transaction date is converted into the corresponding month using:

```sql
MONTHNAME(date)
```

These derived features make time-based analysis easier.

---

# 🔍 3. Exploratory Data Analysis

The SQL analysis contains **28 business questions** divided into three major analytical areas:

### Generic Analysis

* Number of cities
* Branch-to-city mapping

### Product Analysis

* Number of product lines
* Most common payment method
* Most frequently sold product line
* Monthly revenue
* Monthly COGS
* Highest-revenue product line
* Highest-revenue city
* Product-line VAT
* Product rating classification
* Branch quantity performance
* Product-line preference by gender
* Average product-line rating

### Sales Analysis

* Sales by time of day and weekday
* Revenue by customer type
* VAT by city
* VAT by customer type

### Customer Analysis

* Number of customer types
* Number of payment methods
* Most common customer type
* Customer purchasing frequency
* Gender distribution
* Gender distribution by branch
* Ratings by time of day
* Ratings by time of day and branch
* Ratings by weekday
* Ratings by weekday and branch

---

# 📈 Key Business Insights

## 💰 Overall Performance

The dataset generated:

* **$322,966.75 total sales revenue**
* **$307,587.38 total COGS**
* **$15,379.37 gross income**
* **5,510 units sold**
* **6.97 average customer rating**

The gross income in this dataset corresponds to the 5% tax/gross-income calculation provided in the source data. It should **not automatically be interpreted as net profit**.

---

## 🏙️ Branch & City Performance

| City      | Branch |     Revenue | Quantity Sold | Avg. Rating |
| --------- | ------ | ----------: | ------------: | ----------: |
| Naypyitaw | C      | $110,568.71 |         1,831 |        7.07 |
| Yangon    | A      | $106,200.37 |         1,859 |        7.03 |
| Mandalay  | B      | $106,197.67 |         1,820 |        6.82 |

### Insight

**Branch C / Naypyitaw generated the highest revenue**, while **Branch A / Yangon sold the highest number of units**.

This shows why revenue and volume should not be treated as the same performance metric.

---

## 🛍️ Product-Line Performance

| Product Line           |    Revenue | Units Sold | Avg. Rating |
| ---------------------- | ---------: | ---------: | ----------: |
| Food and beverages     | $56,144.84 |        952 |        7.11 |
| Sports and travel      | $55,122.83 |        920 |        6.92 |
| Electronic accessories | $54,337.53 |        971 |        6.92 |
| Fashion accessories    | $54,305.90 |        902 |        7.03 |
| Home and lifestyle     | $53,861.91 |        911 |        6.84 |
| Health and beauty      | $49,193.74 |        854 |        7.00 |

### Key Findings

* **Food and beverages** generated the highest revenue.
* **Electronic accessories** sold the highest number of units.
* **Food and beverages** achieved the highest average rating.
* **Health and beauty** generated the lowest revenue and lowest unit volume.
* **Home and lifestyle** had the lowest average rating.

This demonstrates that the highest-selling product line is not necessarily the highest-revenue product line.

---

## 💳 Payment Method Analysis

| Payment Method | Transactions |
| -------------- | -----------: |
| Ewallet        |          345 |
| Cash           |          344 |
| Credit card    |          311 |

### Insight

**Ewallet was the most frequently used payment method**, closely followed by cash.

Credit cards accounted for the lowest number of transactions among the three payment methods.

---

## 👥 Customer Analysis

### Customer Type

| Customer Type | Transactions |     Revenue |
| ------------- | -----------: | ----------: |
| Member        |          501 | $164,223.44 |
| Normal        |          499 | $158,743.30 |

Members generated slightly higher revenue and transaction volume than normal customers.

### Gender

| Gender | Transactions |     Revenue |
| ------ | -----------: | ----------: |
| Female |          501 | $167,882.92 |
| Male   |          499 | $155,083.82 |

Female customers generated slightly higher transaction volume and revenue.

---

# ⏰ Time-of-Day Analysis

| Time Period | Transactions |     Revenue | Avg. Rating |
| ----------- | -----------: | ----------: | ----------: |
| Morning     |          191 |  $61,798.81 |        6.96 |
| Afternoon   |          377 | $122,797.02 |        7.03 |
| Evening     |          432 | $138,370.92 |        6.93 |

### Insight

**Evening had the highest number of transactions and highest revenue**, making it the strongest sales period.

However, **afternoon transactions received the highest average rating**.

This could be useful for:

* Staffing decisions
* Promotional campaigns
* Inventory availability
* Customer-service planning

---

# 📅 Monthly Sales Performance

| Month    |     Revenue |        COGS | Transactions |
| -------- | ----------: | ----------: | -----------: |
| January  | $116,291.87 | $110,754.16 |          352 |
| February |  $97,219.37 |  $92,589.88 |          303 |
| March    | $109,455.51 | $104,243.34 |          345 |

### Insight

**January recorded the highest revenue and transaction volume**, while **February was the weakest month**.

The business recovered in March after the February decline.

---

# ⭐ Customer Rating Analysis

The overall average rating is **6.97/10**.

### Highest Rated Product Lines

1. Food and beverages — **7.11**
2. Fashion accessories — **7.03**
3. Health and beauty — **7.00**
4. Electronic accessories — **6.92**
5. Sports and travel — **6.92**
6. Home and lifestyle — **6.84**

Food and beverages achieved the strongest customer satisfaction score.

---

# 🧠 Business Recommendations

Based on the analysis:

### 1. Focus on Food & Beverages

Food and beverages generated the highest revenue and the highest average rating.

**Recommendation:** Maintain strong inventory availability and consider cross-selling related products.

### 2. Investigate Home & Lifestyle

Home and lifestyle had a relatively low average rating of **6.84**.

**Recommendation:** Investigate product quality, pricing, availability, and customer feedback.

### 3. Optimize Evening Operations

Evening generated the highest sales volume and revenue.

**Recommendation:** Allocate sufficient staff and inventory during evening hours.

### 4. Strengthen Member Programs

Members generated slightly higher revenue than normal customers.

**Recommendation:** Analyze member purchasing patterns and test targeted loyalty offers.

### 5. Investigate February Decline

February revenue was substantially lower than January.

**Recommendation:** Investigate inventory, promotions, product availability, and customer traffic during the period.

### 6. Compare Revenue and Volume Separately

Yangon sold the most units, but Naypyitaw generated the highest revenue.

**Recommendation:** Evaluate branch performance using multiple KPIs rather than relying on a single metric.

---

# 💻 Sample SQL Queries

### Highest Revenue Product Line

```sql
SELECT
    product_line,
    SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
```

### Revenue by Customer Type

```sql
SELECT
    customer_type,
    SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;
```

### Average Rating by Product Line

```sql
SELECT
    product_line,
    ROUND(AVG(rating), 2) AS average_rating
FROM sales
GROUP BY product_line
ORDER BY average_rating DESC;
```

### Sales by Time of Day

```sql
SELECT
    time_of_day,
    COUNT(invoice_id) AS total_sales
FROM sales
GROUP BY time_of_day
ORDER BY total_sales DESC;
```

---

# 🧪 Data Quality Checks

The supplied dataset was checked for:

* Missing values
* Duplicate records
* Unique transaction IDs
* Data types
* Categorical values
* Numerical ranges

### Results

* **Missing values:** 0
* **Duplicate rows:** 0
* **Unique invoice IDs:** 1,000
* **Transactions:** 1,000
* **Product lines:** 6
* **Cities:** 3
* **Branches:** 3
* **Payment methods:** 3

The dataset is therefore structurally clean for SQL-based exploratory analysis.

---

# ⚠️ SQL Logic Improvements

The existing SQL solution works for the majority of the analysis, but two areas should be improved for production-quality SQL.

### 1. Branch Quantity Comparison

The current query compares:

```text
Branch total quantity
```

against:

```text
Average quantity per transaction
```

Those are different levels of aggregation.

A more logically consistent approach is to compare each branch's total quantity against the average **branch-level** quantity:

```sql
SELECT branch, SUM(quantity) AS total_quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (
    SELECT AVG(total_quantity)
    FROM (
        SELECT branch, SUM(quantity) AS total_quantity
        FROM sales
        GROUP BY branch
    ) AS branch_totals
);
```

### 2. Chronological Month Ordering

Grouping by `month_name` and ordering by revenue is acceptable when the goal is simply to find the highest-revenue month.

However, if the objective is to display a chronological trend, using the month number is safer:

```sql
SELECT
    MONTH(date) AS month_number,
    MONTHNAME(date) AS month_name,
    SUM(total) AS total_revenue
FROM sales
GROUP BY MONTH(date), MONTHNAME(date)
ORDER BY month_number;
```

This prevents alphabetical month ordering from creating misleading trends.

---

# 📁 Files Included

### `WalmartSalesData.csv.csv`

Raw transactional dataset used for the analysis.

### `Walmart Sales Analysis Solution.sql`

Complete MySQL script containing:

* Database creation
* Table creation
* Data transformation
* Feature engineering
* Exploratory analysis
* Product analysis
* Sales analysis
* Customer analysis

### `Walmart_LOGO_only.jpg`

Project branding image used in the README.

---

# 🚀 How to Run the Project

## Step 1 — Clone the Repository

```bash
git clone <your-repository-url>
cd Walmart-Sales-Analysis
```

## Step 2 — Open MySQL

Use MySQL Workbench, MySQL CLI, or another MySQL-compatible client.

## Step 3 — Run the SQL Script

Open:

```text
Walmart Sales Analysis Solution.sql
```

Execute the script to:

1. Create the database
2. Create the sales table
3. Add derived columns
4. Run the analytical queries

## Step 4 — Load the Dataset

Import:

```text
WalmartSalesData.csv.csv
```

into the `sales` table before executing the analysis queries.

---

# 📌 Key Skills Demonstrated

### SQL

* MySQL
* Data aggregation
* Complex filtering
* Subqueries
* CTEs
* Conditional logic
* Date/time functions
* Data transformation
* Business-oriented querying

### Analytics

* Exploratory Data Analysis
* Sales analysis
* Customer segmentation
* Product performance analysis
* Revenue analysis
* Trend analysis
* Customer satisfaction analysis
* KPI analysis

### Business Understanding

* Revenue optimization
* Branch performance
* Product performance
* Customer behavior
* Payment behavior
* Operational decision-making

---

# 📈 Project Outcome

This project demonstrates how SQL can be used to transform raw transactional data into actionable business insights.

The analysis identified:

* **Naypyitaw / Branch C** as the highest-revenue branch.
* **Food and beverages** as the highest-revenue product line.
* **Electronic accessories** as the highest-volume product line.
* **January** as the highest-revenue month.
* **Evening** as the highest-sales time period.
* **Ewallet** as the most frequently used payment method.
* **Members** as the slightly higher-revenue customer segment.
* **Food and beverages** as the highest-rated product category.

The project also demonstrates the importance of choosing the correct aggregation level when writing analytical SQL.

---

# 👨‍💻 Author

**Ashish Chaudhari**

B.Tech Computer Science Graduate | Aspiring Data Analyst

### Skills

`SQL` · `Python` · `Excel` · `Power BI` · `Tableau` · `Data Analysis`

---

## ⭐ If you found this project useful

Consider giving the repository a ⭐ and exploring the SQL analysis.

**More data analytics projects:**

* SQL
* Python
* Excel
* Power BI
* Data Visualization

---
