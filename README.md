# Walmart Sales SQL Analysis

This project is a comprehensive SQL-based analysis of a Walmart sales dataset. It covers feature engineering, product performance, customer behavior, and revenue patterns using SQL queries.

## 📊 Dataset Info

The dataset contains Walmart store transactions with the following columns:

- Invoice ID
- Branch
- City
- Customer Type
- Gender
- Product Line
- Unit Price
- Quantity
- Tax 5%
- Total
- Date
- Time
- Payment
- COGS
- Gross Margin %
- Gross Income
- Rating

## 🛠️ Features Engineered

- `time_of_day`: Categorized sales time into Morning, Afternoon, Evening.
- `day_name`: Extracted weekday from date.
- `month_name`: Extracted month name from date.
- `product_category`: Labeled products as "Good" or "Bad" based on sales performance.

## 🔍 Analysis Overview

### 🌆 Generic Analysis
- Count of distinct cities and branch locations.
- Most common payment method.
- Most sold product lines.

### 💰 Revenue Analysis
- Total and highest revenue by month.
- Top-performing product lines and cities.
- Product lines generating the highest VAT.

### 👥 Customer Analysis
- Most frequent customer type and gender distribution.
- Ratings breakdown by time, weekday, and branch.
- Customer types contributing most to revenue and VAT.

### 📈 Sales Trends
- Sales performance per weekday and time.
- Branches selling more than average.

## 📁 File

- `walmart_sales_analysis.sql`: Full SQL script used for analysis and feature engineering.

## 🚀 How to Use

1. Import the dataset into MySQL.
2. Run the `.sql` script in MySQL Workbench or any compatible SQL client.

