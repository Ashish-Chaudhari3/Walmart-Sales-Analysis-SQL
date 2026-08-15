-- Create database
create database if not exists walmartSales;

use walmartsales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

select * from sales;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add the time_of_day column
select time,
( case
when time between '00:00:00' and '12:00:00' then 'Morning'
when time between '12:01:00' and '16:00:00' then 'Afternoon'
else 'Evening'
end) as time_of_date
from sales;

alter table sales 
add column time_of_day varchar(20);

update sales
set time_of_day = (
case
when time between '00:00:00' and '12:00:00' then 'Morning'
when time between '12:01:00' and '16:00:00' then 'Afternoon'
else 'Evening'
end
);


-- Add day_name column

select date,
dayname(date)
from sales;

alter table sales add column day_name varchar(10);

update sales
set day_name = dayname(date);

-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);


-- --------------Exploratory Data Analysis (EDA)----------------------
-- Generic Questions

-- 1.How many distinct cities are present in the dataset?

select distinct(city) from sales;

-- 2.In which city is each branch?

select distinct city,branch from sales; 

-- -- ---------------------------- Product Analysis -------------------------------

-- 1.How many distinct product lines are there in the dataset?

select COUNT(DISTINCT product_line) from sales;

-- 2.What is the most common payment method?

select payment,count(payment) as common_payment_method
from sales
group by payment
order by common_payment_method desc
limit 1;

-- 3.What is the most selling product line?

select product_line,count(product_line) as most_selling_product
from sales
group by product_line
order by most_selling_product desc;

-- 4.What is the total revenue by month?

select month_name,sum(total) as total_revenue
from sales
group by month_name
order by total_revenue desc;

-- 5.Which month recorded the highest Cost of Goods Sold (COGS)?

select month_name,sum(cogs) as total_cogs
from sales
group by month_name
order by total_cogs desc;

-- 6.Which product line generated the highest revenue?

select product_line, sum(total) as total_revenue
from sales
group by product_line
order by total_revenue desc;

-- 7.Which city has the highest revenue?

select city, sum(total) as total_revenue
from sales
group by city
order by total_revenue desc;

-- 8.Which product line incurred the highest VAT?

select product_line,sum(tax_pct) as VAT
from sales
group by product_line
order by VAT desc;

-- 9.Classify product lines as "Good" if their average rating is ≥ 7, otherwise "Bad".

WITH ProductRating AS (
    SELECT 
        product_line,
        AVG(Rating) AS avg_rating
    FROM sales
    GROUP BY product_line
)
SELECT 
    product_line,
    avg_rating,
    CASE 
        WHEN avg_rating >= 7 THEN 'Good'
        ELSE 'Bad'
    END AS rating_category
FROM ProductRating
ORDER BY avg_rating DESC;

-- 10.Which branch sold more products than average product sold?

select branch,sum(quantity) as qnty
from sales
group by branch
having qnty > (select avg(quantity) from sales);

-- 11.What is the most common product line by gender?

select product_line,gender,count(gender) as total_count
from sales
group by product_line,gender
order by total_count desc;

-- 12.What is the average rating of each product line?

select product_line,round(avg(rating),2) as average_rating
from sales
group by product_line
order by average_rating desc;


-- ---------------------------- Sales Analysis---------------------------------

-- 1.Number of sales made in each time of the day per weekday

select day_name,time_of_day,count(invoice_id) AS total_sales
from sales
group by day_name,time_of_day
having day_name not in ('Saturday','Sunday');

-- 2.Which of the customer types brings the most revenue?

select customer_type,sum(total) as Total_revenue
from sales
group by customer_type
order by Total_revenue desc;

-- 3.Which city has the largest tax percent/ VAT (Value Added Tax)?

select city,sum(tax_pct) as total_tax
from sales
group by city
order by total_tax desc
limit 1;

-- 4.Which customer type pays the most in VAT?

select customer_type, sum(tax_pct) as total_tax
from sales
group by customer_type
order by total_tax desc
limit 1;


-- -------------------------- Customers Analysis -------------------------------

-- 1.How many unique customer types does the data have?

SELECT COUNT(DISTINCT customer_type) FROM sales;

-- 2.How many unique payment methods does the data have?

SELECT COUNT(DISTINCT payment) FROM sales;

-- 3.Which is the most common customer type?

SELECT customer_type, COUNT(customer_type) AS common_customer
FROM sales 
GROUP BY customer_type 
ORDER BY common_customer DESC 
LIMIT 1;

-- 4.Which customer type buys the most?

SELECT customer_type, count(*) as total_sales
FROM sales 
GROUP BY customer_type 
ORDER BY total_sales desc;

-- 5.What is the gender of most of the customers?

SELECT gender, COUNT(*) as gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- 6.What is the gender distribution per branch?

SELECT branch, gender, COUNT(gender) AS gender_distribution
FROM sales 
GROUP BY branch, gender 
ORDER BY branch;

-- 7.Which time of the day do customers give most ratings?

SELECT time_of_day, AVG(rating) AS average_rating
FROM sales 
GROUP BY time_of_day 
ORDER BY average_rating DESC;

-- 8.Which time of the day do customers give most ratings per branch?

SELECT branch, time_of_day, AVG(rating) AS average_rating
FROM sales 
GROUP BY branch, time_of_day 
ORDER BY average_rating DESC;

-- 9.Which day of the week has the best avg ratings?

SELECT day_name, AVG(rating) AS average_rating
FROM sales 
GROUP BY day_name 
ORDER BY average_rating DESC;

-- 10.Which day of the week has the best average ratings per branch?

SELECT  branch, day_name, AVG(rating) AS average_rating
FROM sales 
GROUP BY day_name, branch 
ORDER BY average_rating DESC;