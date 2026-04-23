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
│   └── business_analysis_report.md       <-- Final analysis report
└── sql_queries/
    ├── sales_funnel_by_source.sql        <-- Traffic source attribution
    ├── sales_funnel_conversion_rate.sql  <-- Stage to stage metrics
    ├── sales_funnel_conversion_time.sql  <-- Customer journey duration
    ├── sales_funnel_definition.sql       <-- Funnel stage logic
    └── sales_funnel_revenue_analysis.sql <-- Core financial KPIs
```
### Technical Implementation

#### Data Schema
The analysis utilizes a cleaned transaction log (`data/cleaned_data.csv`) with the following schema:

* **event_id**       (INT)
* **user_id**        (INT)
* **event_type**     (VARCHAR)
* **event_date**     (DATETIME)
* **amount**         (DECIMAL)
* **traffic_source** (VARCHAR)

#### SQL Analysis Scripts
The `sql_queries/` directory contains T-SQL scripts developed for a SQL Server environment to diagnose funnel performance.

1. **sales_funnel_definition.sql**: Establishes the standard definitions for the 5 stage e commerce funnel.
2. **sales_funnel_conversion_rate.sql**: Calculates drop off rates at every step. This script identified the primary bottleneck at the 'Add to Cart' phase.
3. **sales_funnel_revenue_analysis.sql**: Computes standard KPIs including Total Revenue, AOV, and Revenue Per Visitor.
4. **sales_funnel_by_source.sql**: Performs a dimensional analysis on traffic sources, revealing that Email converts 5x better than Social.
5. **sales_funnel_conversion_time.sql**: Analyzes the behavioral speed of users, finding an average 25 minute journey from view to purchase.

### Strategic Recommendations
The full actionable strategy is detailed in the `analysis_report/business_analysis_report.md`. The recommendations are:

* **Fix the Product Page Leak (Priority 1)**: Implement A/B testing, social proof, and 'Exit Intent' offers on product pages to reduce the 69% drop-off rate.
* **Scale High-ROI Channels**: Aggressively scale Email marketing volume, as it has proven product market fit (34% conv).
* **Optimize Social Traffic**: Implement low friction, mobile optimized landing pages for Social traffic to move it from window shopping to purchase intent.
* **AOV Nudging**: Implement a free shipping threshold at $125 (current AOV is $106.51) to increase baseline order value.

