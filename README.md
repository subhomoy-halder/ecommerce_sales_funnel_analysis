# Data to Decision: Ecommerce Growth Strategy

![Project Status](https://img.shields.io/badge/Status-Completed-success)
![SQL Version](https://img.shields.io/badge/SQL-SQL%20Server-red)
![Role](https://img.shields.io/badge/Role%20-%20Business%20Analyst-blue)

## Project Overview
Leveraging SQL Server to transform raw event data into actionable business intelligence. This repo contains a full diagnostic audit of the 'Add-to-Cart' friction point, source specific conversion analysis, and a quantitative growth model for revenue scaling.

## Executive Summary of Results
Acting as a lead business analyst, I audited a dataset of 5,000 unique visitors generating $87,975.11 in revenue.

**Key Findings:**
* **Elite Checkout:** Once users start payment, **91.88%** complete the purchase.
* **Critical Bottleneck:** **68.94%** of visitors abandon the journey on the product page (before 'Add to Cart').
* **Channel Inefficiency:** Social traffic has high volume but the lowest conversion (**6.9%**). Email marketing is the highest performing channel (**33.9%**).

By fixing the mid funnel leak and reallocating traffic spend, the strategic roadmap projects a **15-22% increase in top line revenue**.

---

## 📂 Repository Structure
The repository is organized exactly as shown below to separate data assets, analysis scripts, and final documentation.

```text
├── README.md                             <-- You are here
├── data/
│   ├── cleaned_data.csv                  <-- Dataset used for analysis
│   └── raw_data.csv                      <-- Original source data
├── analysis_report/
│   ├── business-analysis-report.md       <-- Final consulting report
└── sql_queries/
    ├── sales_funnel_by_source.sql        <-- Traffic source attribution
    ├── sales_funnel_conversion_rate.sql  <-- Stage-to-stage metrics
    ├── sales_funnel_conversion_time.sql  <-- Customer journey duration
    ├── sales_funnel_definition.sql       <-- Funnel stage logic
    └── sales_funnel_revenue_analysis.sql <-- Core financial KPIs
