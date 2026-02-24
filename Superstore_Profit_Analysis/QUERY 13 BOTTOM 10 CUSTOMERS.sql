
-- ============================================
-- QUERY 13: BOTTOM 10 CUSTOMERS 
-- PURPOSE: Identify toxic customers to fix or fire
-- FINDING: Cindy Stewart -$6,626 = paying $5,690, costing $12,316
-- ============================================


SELECT TOP 10
    Customer_ID,
    Customer_Name,
    Segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct
FROM Superstore_data
GROUP BY Customer_ID, Customer_Name, Segment
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;
