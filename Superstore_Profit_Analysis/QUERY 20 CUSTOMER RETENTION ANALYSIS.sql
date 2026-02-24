
-- ============================================
-- QUERY 20: CUSTOMER RETENTION ANALYSIS
-- PURPOSE: Calculate repeat purchase rate to measure loyalty
-- FINDING: 98.5% repeat purchase rate = exceptional customer loyalty
-- ============================================

SELECT
    COUNT(DISTINCT Customer_ID) AS total_customers,
    COUNT(DISTINCT CASE WHEN total_orders >= 2 THEN Customer_ID END) AS repeat_customers,
    COUNT(DISTINCT CASE WHEN total_orders >= 2 THEN Customer_ID END) * 100.0 
        / COUNT(DISTINCT Customer_ID) AS repeat_purchase_rate_pct
FROM 
(
    SELECT 
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS total_orders
    FROM Superstore_data
    GROUP BY Customer_ID
) t;
