Select*
from[dbo].[Sales data Cp]

-- 1)Retrieve the total sales for each product category
SELECT Product, 
       SUM(Quantity) AS Total_sales
FROM [dbo].[Sales data Cp]
GROUP BY Product;


--2)Find the number of sales transactions in each region

SELECT Region, 
      SUM(Quantity) AS Number_of_sales_Transaction
FROM [dbo].[Sales data Cp]
GROUP BY Region;


--3)Find the highest-selling product by total sales value

Select Product,
SUM (Total_Revenue) as Total_sales_value
FROM [dbo].[Sales data Cp]
GROUP BY PRODUCT
ORDER BY Total_sales_value DESC;


---4)calculate the total revenue per product

Select Product,
SUM (Total_Revenue) as Total_revenue_per_product
FROM [dbo].[Sales data Cp]
GROUP BY PRODUCT
ORDER BY Total_revenue_per_product DESC;


----5)calculate monthly sales totals for the current year

SELECT MONTH(OrderDate) AS Month_name, 
       SUM(Quantity) AS Total_Sales
FROM [dbo].[Sales data Cp]
WHERE YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate)
ORDER BY Month_name;


----6)Find the top 5 customers by total purchase amount

SELECT Top 5 customer_id,
SUM (Total_revenue) AS  Total_purchase_amount
FROM [dbo].[Sales data Cp]
GROUP BY Customer_id
ORDER BY Total_purchase_amount DESC;


--7)Calculate the perentage of total sales contributed by each region

WITH TotalSales AS (
    SELECT SUM(Quantity) AS Overall_Sales
    FROM [dbo].[Sales data Cp]
)
SELECT Region, 
       SUM(Quantity) AS Region_Sales, 
       CAST(ROUND((SUM(Quantity) * 100.0 / (SELECT Overall_Sales FROM TotalSales)), 0) AS VARCHAR(10)) + '%' AS Sales_Percentage
FROM [dbo].[Sales data Cp]
GROUP BY Region
ORDER BY Sales_Percentage DESC;


----8)Identify products with no sales in the last quarter

SELECT DISTINCT Product
FROM [dbo].[Sales data Cp]
WHERE Product NOT IN (
    SELECT Product
    FROM [dbo].[Sales data Cp]
    WHERE OrderDate >= DATEADD(QUARTER, -1, GETDATE())
)

								----PROJECT 2 (Using Customer dataset)

SELECT *
FROM [dbo].[Customer Data]

---1) Retrieve the total number of customers from each region
SELECT Region,
COUNT(CustomerName) AS Total_number_of_customer_per_region
FROM[dbo].[Customer Data]
GROUP BY Region


--2) Find the most popular subscription type by the number of customers.

SELECT Top 1 SubscriptionType,
COUNT(CustomerName) AS Number_of_customers
FROM[dbo].[Customer Data]
GROUP BY SubscriptionType
ORDER BY Number_of_customers DESC


--3)find customers who canceled their subscription within 6 months.
  
  SELECT CustomerName 
FROM [dbo].[Customer Data]
WHERE Canceled = 'TRUE'
  AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6
  AND SubscriptionEnd IS NOT NULL


--4)calculate the average subscription duration for all customers.

SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS Average_Subscription_Duration_Days
FROM [dbo].[Customer Data];


--5)find customers with subscriptions longer than 12 months.

SELECT CustomerName, SubscriptionStart, SubscriptionEnd
FROM [dbo].[Customer Data]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12;


--6)calculate total revenue by subscription type.

SELECT SubscriptionType,
SUM (Revenue) AS Total_Revenue
FROM[dbo].[Customer Data]
GROUP BY SubscriptionType


--7)find the top 3 regions by subscription cancellations.

SELECT Top 3 Region,
Count(CustomerName) AS Numbers_of_customers_who_canceled
FROM [dbo].[Customer Data]
WHERE Canceled ='TRUE'
GROUP BY Region
ORDER BY Numbers_of_customers_who_canceled DESC

--8)find the total number of active and canceled subscriptions

SELECT 
    SUM(CASE WHEN Canceled = 'TRUE' THEN 1 ELSE 0 END) AS TotalCanceled,
    SUM(CASE WHEN Canceled = 'FALSE' THEN 1 ELSE 0 END) AS TotalActive
FROM 
    [dbo].[Customer Data];