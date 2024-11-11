# Subscription-Data

TABLE OF CONTENT

[Project Overview](#project-overview)

[Project Summary](#project-summary)

[Project Structure](#project-structure)

[Excel Analysis](#excel-analysis)

[SQL Analysis](#sql-analysis)

[Power BI Dashboard](#power-bi-dashboard)

[Key Insights](#key-insights)






---
### Project Overview
This project analyzes customer data from a subscription service to uncover behavioral patterns, track subscription trends, and identify potential customer segments. By exploring data on subscription types, cancellations, and renewals, we gain insights into customer preferences and trends. The final deliverable is a Power BI dashboard that presents key findings interactively.

---

## Project Summary

- **Objective**: To understand customer behavior in a subscription service, identify segments, and analyze subscription patterns, including cancellation and renewal trends.
- **Tools Used**: Microsoft Excel, SQL Server, Power BI
- **Outcome**: An interactive Power BI dashboard with slicers for dynamic analysis of customer segments and subscription trends.

---

## Project Structure

## Excel Analysis:[Gloria LITA Capstone Project Excel.xlsx](https://github.com/user-attachments/files/17693668/Gloria.LITA.Capstone.Project.Excel.xlsx)


   - **Data Exploration**: Used pivot tables to analyze subscription patterns, focusing on metrics such as average subscription duration and identifying popular subscription types.
   - **Key Calculations**:
     - Calculated the average subscription duration across customer segments.
     - Identified the most popular subscription types.
     - Generated additional reports highlighting customer demographics and usage trends..
       
   - **File**: 

## SQL Analysis:[View Here](https://drive.google.com/file/d/1y1eAeoNXLUbWVF76y5wo9XMWiC8oj1UO/view?usp=drive_link)

   - **Dataset Loading**: Loaded the customer dataset into SQL Server to perform more in-depth analysis.
   - **Key Queries**:
     - **Total Customers by Region**:
       ```sql
       SELECT Region,
        COUNT(CustomerName) AS Total_number_of_customer_per_region
        FROM[dbo].[Customer Data]
        GROUP BY Region
       ```
     - **Most Popular Subscription Type**:
       ```sql
       SELECT Top 1 SubscriptionType,
       COUNT(CustomerName) AS Number_of_customers
       FROM[dbo].[Customer Data]
       GROUP BY SubscriptionType
       ORDER BY Number_of_customers DESC
       ```
     - **Cancellations within 6 Months**:
       ```sql
        SELECT CustomerName 
        FROM [dbo].[Customer Data]
        WHERE Canceled = 'TRUE'
        AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6
        AND SubscriptionEnd IS NOT NULL
 
       ```
     - **Average Subscription Duration**:
       ```sql
       
        SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS 
        Average_Subscription_Duration_Days
        FROM [dbo].[Customer Data];
       ```
     - **Customers with Subscriptions Longer than 12 Months**:
       ```sql
       SELECT CustomerName, SubscriptionStart, SubscriptionEnd
       FROM [dbo].[Customer Data]
        WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12;
       
       ```
     - **Total Revenue by Subscription Type**:
       ```sql
        SELECT SubscriptionType,
        SUM (Revenue) AS Total_Revenue
        FROM[dbo].[Customer Data]
        GROUP BY SubscriptionType
       ```
     - **Top 3 Regions by Subscription Cancellations**:
       ```sql
        SELECT Top 3 Region,
        Count(CustomerName) AS Numbers_of_customers_who_canceled
        FROM [dbo].[Customer Data]
        WHERE Canceled ='TRUE'
        GROUP BY Region
        ORDER BY Numbers_of_customers_who_canceled DESC
       ```
     - **Total Active and Canceled Subscriptions**:
       ```sql
       SELECT 
            SUM(CASE WHEN Canceled = 'TRUE' THEN 1 ELSE 0 END) AS TotalCanceled,
            SUM(CASE WHEN Canceled = 'FALSE' THEN 1 ELSE 0 END) AS TotalActive
       FROM [dbo].[Customer Data]
           
       ```
   reminder!!!! (put imaage here, Gloria)!!!!!!

## Power BI Dashboard:
   - **Overview**: 
   - loaded the data into powerbi
   - checked data type to ensure data type is accurate
   - performed data audit to ensure data is clear of error and data quality is topnotch
   - Developed an interactive Power BI dashboard that visualizes key metrics.

     
   - **Dashboard Components**:
     - **Customer Segments**: Displays key customer segments based on subscription type and region.
     - **Cancellations**: Highlights cancellation rates, with a focus on top regions and subscription durations.
     - **Subscription Trends**: Shows popular subscription types and total revenue generated.
     - **Interactive Slicers**: Allows filtering by customer segments, regions, and subscription types.
   - **File**: 
   - **Preview**: 

---

## Key Insights

- **Subscription Popularity**: The analysis identifies the most popular subscription types and highlights regional variations.
- **Cancellation Trends**: Cancellations are analyzed by subscription duration, revealing customer segments more likely to cancel within six months.
- **Revenue Insights**: Revenue breakdown by subscription type helps to determine which segments are the most profitable.
- **Regional Analysis**: Insights into regions with high cancellation rates can assist in regional marketing strategies.

---

## Conclusion

This project offers valuable insights into customer segments within a subscription service, highlighting trends in subscription preferences, cancellations, and revenue generation. The Power BI dashboard provides an interactive view of customer behavior, allowing stakeholders to explore the data dynamically.

--- 

