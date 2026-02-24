
-- ============================================
-- QUERY 14: RFM CUSTOMER SEGMENTATION
-- PURPOSE:  customer segmentation by behavior
-- FINDING: 3% Champions = 11.5% of profit ($1,219/customer vs $335 average)
-- ============================================



WITH RFM AS (
    SELECT 
        Customer_ID,
        Customer_Name,
        Segment,
        MIN(Order_Date) AS first_orderdate,
        MAX(Order_Date) AS last_orderdate,
        DATEDIFF(MONTH, MAX(Order_Date), 
            (SELECT MAX(Order_Date) FROM Superstore_data)) AS recency_months,
        DATEDIFF(MONTH, MIN(Order_Date), MAX(Order_Date)) + 1 AS lifespan_months,
        COUNT(DISTINCT Order_ID) AS frequency,
        ROUND(SUM(Sales), 2) AS monetary,
        ROUND(SUM(Profit), 2) AS profit
    FROM Superstore_data
    GROUP BY Customer_ID, Customer_Name, Segment
),
customer_segments AS (
    SELECT 
        Customer_ID,
        Customer_Name,
        Segment,
        recency_months,
        lifespan_months,
        frequency,
        CASE 
            WHEN frequency = 0 THEN frequency
            ELSE ROUND(CAST(frequency AS FLOAT) / NULLIF(lifespan_months, 0), 2)
        END AS order_per_month,
        monetary,
        profit,
        ROUND(profit / NULLIF(frequency, 0), 2) AS profit_per_order,
        CASE 
            WHEN recency_months <= 3 AND frequency >= 10 AND monetary >= 5000 THEN 'Champion'
            WHEN recency_months <= 3 AND frequency >= 5 THEN 'Loyal'
            WHEN recency_months <= 3 AND frequency < 5 THEN 'Recent'
            WHEN recency_months > 3 AND recency_months <= 6 AND frequency >= 5 THEN 'Needs Attention'
            WHEN recency_months > 6 AND recency_months <= 12 THEN 'At Risk'
            WHEN recency_months > 12 THEN 'Lost'
            ELSE 'Others'
        END AS customer_segment
    FROM RFM
)
SELECT 
    customer_segment,
    COUNT(*) AS total_customers,
    ROUND(SUM(monetary), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(frequency), 1) AS avg_frequency,
    ROUND(AVG(lifespan_months), 1) AS avg_lifespan,
    ROUND(AVG(recency_months), 1) AS avg_recency,
    ROUND(SUM(profit) / COUNT(*), 2) AS profit_per_customer,
    ROUND(SUM(profit) * 100.0 / SUM(SUM(profit)) OVER(), 2) AS profit_contribution_pct
FROM customer_segments
GROUP BY customer_segment
ORDER BY total_profit DESC;
