# Subscription-Data
Here’s a GitHub repository structure for "Customer Segmentation for a Subscription Service." This setup organizes the information to make it easily understandable, with each tool and analysis method clearly highlighted.

---

### Repository: `Customer_Segmentation_Subscription_Service`

---

### README.md

# Customer Segmentation for a Subscription Service

### Overview
This project analyzes customer data from a subscription service to uncover behavioral patterns, track subscription trends, and identify potential customer segments. By exploring data on subscription types, cancellations, and renewals, we gain insights into customer preferences and trends. The final deliverable is a Power BI dashboard that presents key findings interactively.

---

## Project Summary

- **Objective**: To understand customer behavior in a subscription service, identify segments, and analyze subscription patterns, including cancellation and renewal trends.
- **Tools Used**: Microsoft Excel, SQL Server, Power BI
- **Outcome**: An interactive Power BI dashboard with slicers for dynamic analysis of customer segments and subscription trends.

---

## Project Structure

1. **Excel Analysis**:
   - **Data Exploration**: Used pivot tables to analyze subscription patterns, focusing on metrics such as average subscription duration and identifying popular subscription types.
   - **Key Calculations**:
     - Calculated the average subscription duration across customer segments.
     - Identified the most popular subscription types.
     - Generated additional reports highlighting customer demographics and usage trends.
   - **File**: [`Customer_Segmentation_Excel.xlsx`](link-to-excel-file)

2. **SQL Analysis**:
   - **Dataset Loading**: Loaded the customer dataset into SQL Server to perform more in-depth analysis.
   - **Key Queries**:
     - **Total Customers by Region**:
       ```sql
       SELECT Region, COUNT(CustomerID) AS Total_Customers
       FROM Customer_Data
       GROUP BY Region;
       ```
     - **Most Popular Subscription Type**:
       ```sql
       SELECT Subscription_Type, COUNT(CustomerID) AS Customers
       FROM Customer_Data
       GROUP BY Subscription_Type
       ORDER BY Customers DESC
       LIMIT 1;
       ```
     - **Cancellations within 6 Months**:
       ```sql
       SELECT CustomerID, Subscription_Type, DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) AS Duration
       FROM Customer_Data
       WHERE Canceled = 'TRUE' AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6;
       ```
     - **Average Subscription Duration**:
       ```sql
       SELECT AVG(DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd)) AS Avg_Duration
       FROM Customer_Data
       WHERE SubscriptionEnd IS NOT NULL;
       ```
     - **Customers with Subscriptions Longer than 12 Months**:
       ```sql
       SELECT CustomerID, Subscription_Type
       FROM Customer_Data
       WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12;
       ```
     - **Total Revenue by Subscription Type**:
       ```sql
       SELECT Subscription_Type, SUM(Revenue) AS Total_Revenue
       FROM Customer_Data
       GROUP BY Subscription_Type;
       ```
     - **Top 3 Regions by Subscription Cancellations**:
       ```sql
       SELECT Region, COUNT(*) AS Cancellations
       FROM Customer_Data
       WHERE Canceled = 'TRUE'
       GROUP BY Region
       ORDER BY Cancellations DESC
       LIMIT 3;
       ```
     - **Total Active and Canceled Subscriptions**:
       ```sql
       SELECT 
           SUM(CASE WHEN Canceled = 'TRUE' THEN 1 ELSE 0 END) AS Total_Canceled,
           SUM(CASE WHEN Canceled = 'FALSE' THEN 1 ELSE 0 END) AS Total_Active
       FROM Customer_Data;
       ```
   - **File**: [`Customer_Segmentation_SQL.sql`](link-to-sql-file)

3. **Power BI Dashboard**:
   - **Overview**: Developed an interactive Power BI dashboard that visualizes key metrics.
   - **Dashboard Components**:
     - **Customer Segments**: Displays key customer segments based on subscription type and region.
     - **Cancellations**: Highlights cancellation rates, with a focus on top regions and subscription durations.
     - **Subscription Trends**: Shows popular subscription types and total revenue generated.
     - **Interactive Slicers**: Allows filtering by customer segments, regions, and subscription types.
   - **File**: [`Customer_Segmentation_Dashboard.pbix`](link-to-powerbi-file)
   - **Preview**: ![Dashboard Preview](link-to-image-or-gif)

---

## Key Insights

- **Subscription Popularity**: The analysis identifies the most popular subscription types and highlights regional variations.
- **Cancellation Trends**: Cancellations are analyzed by subscription duration, revealing customer segments more likely to cancel within six months.
- **Revenue Insights**: Revenue breakdown by subscription type helps to determine which segments are the most profitable.
- **Regional Analysis**: Insights into regions with high cancellation rates can assist in regional marketing strategies.

---

## Usage

1. **Excel**: Open `Customer_Segmentation_Excel.xlsx` to view the initial analysis, pivot tables, and summary calculations.
2. **SQL**: Execute the queries in `Customer_Segmentation_SQL.sql` within SQL Server to explore customer and subscription patterns.
3. **Power BI**: Open `Customer_Segmentation_Dashboard.pbix` in Power BI for an interactive analysis with slicers.

---

## Conclusion

This project offers valuable insights into customer segments within a subscription service, highlighting trends in subscription preferences, cancellations, and revenue generation. The Power BI dashboard provides an interactive view of customer behavior, allowing stakeholders to explore the data dynamically.

--- 

This structure ensures clarity and completeness, allowing readers to easily follow the analysis process and understand the insights. Let me know if you need additional details or modifications!
