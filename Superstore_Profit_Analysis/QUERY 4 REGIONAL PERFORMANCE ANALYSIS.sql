
-- ============================================
-- QUERY 4: REGIONAL PERFORMANCE ANALYSIS
-- PURPOSE: Compare profitability across geographic regions
-- FINDING: Central region 7.92% margin with 24% discount = $35K opportunity 
--          if matched West's 14.94% margin benchmark
-- ============================================ 

SELECT 
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct,
    ROUND(SUM(Profit) / COUNT(DISTINCT Customer_ID), 2) AS profit_per_customer
FROM Superstore_data
GROUP BY region
ORDER BY profit DESC;