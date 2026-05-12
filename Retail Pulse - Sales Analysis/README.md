# RetailPulse - End to End Sales Analytics

## Overview

RetailPulse is a complete end to end data analytics project built to analyze the sales performance of a mid sized retail chain operating across multiple cities in India. The project investigates declining sales trends, identifies underperforming regions and products, analyzes customer behavior and delivers actionable business recommendations.

This project demonstrates the complete data analyst workflow — from database design and data cleaning to statistical analysis, customer segmentation and interactive dashboard building.

## Problem Statement

A retail chain operating across 5 major cities in India is experiencing inconsistent and declining revenue. The business needs clarity on:

- Which regions and products are underperforming?
- Which customer segments drive the most revenue?
- Is the current discount strategy effective?
- Who are the high value customers and how do we retain them?

## Tools & Technologies

- MySQL — Database design, data cleaning and analytical querying
- Microsoft Excel — Pivot analysis, trend analysis and discount impact study
- Python — Exploratory data analysis, RFM segmentation and correlation analysis
- Power BI — Interactive dashboard connected directly to MySQL

## Methodologies & Techniques

- Database design and star schema modelling
- Data cleaning — null checks, date format fixing, data type correction
- Analytical SQL querying — joins, aggregations, GROUP BY, filters
- KPI analysis — Total Revenue, Total Orders, Average Order Value, Delivered Revenue
- Monthly trend analysis and Year over Year comparison
- Order status and discount impact analysis
- Category and regional performance analysis
- Exploratory Data Analysis (EDA)
- Correlation analysis — discount, quantity and revenue
- RFM Customer Segmentation — Recency, Frequency, Monetary
- Customer behaviour analysis
- Sales representative performance analysis
- Interactive dashboard building with DAX measures in Power BI

## Key Findings

**Regional Performance:**
- Bengaluru generated the highest revenue of Rs.38,327 among delivered orders
- Mumbai was the lowest performing region at Rs.22,741 — significantly below all other regions

**Product & Category Performance:**
- Camera was the top selling product with Rs.15,416 in revenue
- Electronics dominated category revenue at Rs.71,110 followed by Clothing at Rs.50,291
- Grocery was the weakest category at Rs.8,217

**Order Analysis:**
- Only 58.5% of orders were successfully delivered
- 22.7% of orders were returned and 18.8% were cancelled
- 41% order incompletion rate represents a serious operational and revenue concern

**Discount Analysis:**
- Correlation between discount and revenue is -0.037 — near zero
- Orders with zero discount generated the highest revenue of Rs.1,25,220
- Orders with 20% discount generated the lowest revenue of Rs.29,812
- Discount strategy is proven ineffective by both Excel and Python analysis

**Customer Segmentation — RFM Analysis:**
- 160 out of 200 customers had at least one delivered order
- 44 VIP customers — high recency, frequency and monetary value
- 47 Loyal customers — consistent buyers worth retaining
- 47 At Risk customers — previously active but going inactive
- 22 Lost customers — lowest engagement, need re-activation
- 40 customers have zero delivered orders

**Sales Performance:**
- Anand Venkat was the top performing sales rep with Rs.20,001 in revenue
- Corporate segment led with 231 orders and Rs.45,369 in revenue
- July recorded the highest monthly revenue at Rs.19,304
- September 2023 recorded the lowest monthly revenue at Rs.7,000

## Business Recommendations

**1. Revamp Discount Strategy**
- Customer View: Customers are not motivated by discounts — purchases are need and value driven
- Company View: Blanket discounts are reducing margins without driving revenue growth
- Action: Replace blanket discounts with personalized offers targeted at At Risk and Lost customer segments only

**2. Address Poor Order Conversion**
- Customer View: High return and cancellation rates suggest dissatisfaction with product quality or delivery experience
- Company View: 41% order incompletion directly impacts revenue and increases operational costs
- Action: Investigate root causes of returns and cancellations, strengthen quality checks and improve post purchase experience

**3. Improve Customer Retention**
- Customer View: At Risk customers are losing interest due to lack of engagement
- Company View: Retaining existing customers is significantly cheaper than acquiring new ones
- Action: Launch a VIP loyalty program for top customers, run targeted re-engagement campaigns for At Risk and Lost segments identified through RFM analysis

**4. Focus on Underperforming Regions**
- Mumbai consistently underperforms across all product categories
- Action: Deploy dedicated sales efforts and targeted regional marketing campaigns in Mumbai

**5. Address Seasonal Revenue Dip**
- Revenue drops sharply every September across both 2022 and 2023
- Action: Plan promotional campaigns and inventory push in advance to counter the seasonal decline
