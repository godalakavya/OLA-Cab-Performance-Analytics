# 🚕 DATA-DRIVEN OLA CAB PERFORMANCE ANALYTICS & REVENUE OPTIMIZATION

------------------------------------------------------------------------

## 📌 Business Context

The ride-hailing industry operates in a highly competitive and dynamic
environment where revenue, ride cancellations, surge pricing, traffic
congestion, weather conditions, and holiday demand fluctuations directly
impact operational efficiency and customer satisfaction.

Revenue instability and high cancellation rates reduce profitability and
weaken service reliability.\
This project transforms raw ride-level operational data into a
centralized, data-driven analytics system to monitor performance,
optimize pricing strategy, reduce cancellations, and support smarter
business decisions.

------------------------------------------------------------------------

## 🎯 Project Objectives

-   Improve revenue visibility across cab categories\
-   Reduce ride cancellation rate\
-   Analyze surge pricing effectiveness\
-   Evaluate traffic, weather, and holiday impact\
-   Enhance customer satisfaction using rating analysis\
-   Enable data-driven operational planning

------------------------------------------------------------------------

## 🚩 Problem Statement

-   Revenue performance varied significantly across cab categories\
-   \~19% ride cancellation rate caused revenue leakage\
-   Surge pricing impact on cancellations lacked clarity\
-   Traffic and weather effects were not systematically analyzed\
-   No centralized dashboard existed for operational monitoring

------------------------------------------------------------------------

## ✅ Solution Delivered

-   Built a structured SQL data-cleaning pipeline\
-   Designed a 3-page interactive Power BI dashboard\
-   Developed dynamic KPIs using DAX\
-   Performed category-wise, pricing, and cancellation analysis\
-   Integrated external factors (traffic, weather, holidays)\
-   Created actionable strategic recommendations

------------------------------------------------------------------------

## 🧹 Data Engineering & Cleaning (SQL)

-   Removed duplicate booking IDs\
-   Eliminated NULL and blank values\
-   Deleted logically invalid numeric records\
-   Standardized text and categorical fields\
-   Converted trip duration into HH:MM:SS format\
-   Validated data integrity using structured quality checks

------------------------------------------------------------------------

## 📊 Dashboard Overview (Power BI)

### 🔹 Page 1 -- Category & Revenue Performance

![Category & Revenue Dashboard](<p align="center">
  <img src=<img width="1280" height="704" alt="image" src="https://github.com/user-attachments/assets/5aece6f3-835b-482b-a98e-e4a50949ff2b" /> width="850">
</p>)

Key KPIs: - Total Revenue: ₹315.62K\
- Company Revenue: ₹78.90K\
- Total Rides: 1000\
- Average Rating: 3.21\
- Cancelled Rides: 194

Visual Insights: - Revenue by Category (SUV highest contributor \~41%)\
- Revenue Trend Over Time\
- Category vs Cancellation Rate

------------------------------------------------------------------------

### 🔹 Page 2 -- Ride Cancellation Analysis

![Cancellation Analysis Dashboard](<p align="center">
  <img src="Page2_Dashboard.jpeg" width="850">

</p>)

Key Insights: - Overall Cancellation Rate: 19.40%\
- High traffic showed highest cancellation rate (\~20.68%)\
- Category-wise cancellation comparison\
- Cancellation reason breakdown

------------------------------------------------------------------------

### 🔹 Page 3 -- Pricing & External Factor Impact

![Pricing & External Factors Dashboard](<p align="center">
  <img src="Page3_Dashboard.jpeg" width="850">
</p>)

Key Insights: - Surge multiplier positively correlated with revenue\
- Clear weather generated highest revenue contribution\
- Non-holiday days outperformed holiday revenue\
- Traffic level significantly influenced ride completion

------------------------------------------------------------------------

## 🧠 Analytical Framework

-   **Descriptive Analytics** -- Revenue & ride monitoring\
-   **Diagnostic Analytics** -- Root cause analysis of cancellations\
-   **Comparative Analytics** -- Category benchmarking\
-   **Pricing Analytics** -- Surge multiplier impact\
-   **Impact Analysis** -- Traffic & weather influence

------------------------------------------------------------------------

## 🏗 Data Model

The project uses a structured analytical model linking ride-level
transactional data with pricing, category, traffic, weather, and ride
status attributes.

DAX Measures Created: - Total Revenue\
- Company Revenue\
- Cancellation Rate %\
- Revenue per Ride\
- Revenue Lost due to Cancellations\
- Average Customer Rating

------------------------------------------------------------------------

## 🛠 Tools & Technologies

-   **SQL (MySQL)** -- Data cleaning & transformation\
-   **Power BI** -- Data modeling & dashboard visualization\
-   **DAX** -- KPI and business metric calculations\
-   **Excel** -- Data validation

------------------------------------------------------------------------

## 📈 Key Business Insights

-   SUV category contributed the highest revenue (\~41%)\
-   Overall cancellation rate of 19.4% impacts revenue realization\
-   High traffic conditions significantly increase cancellations\
-   Surge pricing boosts revenue but may affect ride completion\
-   Weather and holiday demand fluctuations influence revenue patterns

------------------------------------------------------------------------

## 💡 Strategic Recommendations

-   Implement traffic-based driver allocation to reduce cancellations\
-   Optimize surge pricing during peak congestion\
-   Improve Auto category operational efficiency\
-   Monitor cancellation drivers to enhance customer retention\
-   Introduce demand-aware pricing adjustments

------------------------------------------------------------------------

## 🚀 Business Value & Impact

This solution enables:

-   Centralized operational performance monitoring\
-   Pricing optimization using surge analytics\
-   Reduction of cancellation-driven revenue leakage\
-   Better traffic-aware operational planning\
-   Improved decision-making using data-driven insights

------------------------------------------------------------------------

## 👩‍💻 Author

Kavya\
Data Analytics Enthusiast


