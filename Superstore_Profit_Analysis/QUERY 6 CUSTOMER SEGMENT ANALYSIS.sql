
-- ============================================
-- QUERY 6: CUSTOMER SEGMENT ANALYSIS
-- PURPOSE: Compare performance across customer types
-- FINDING: Home Office $407/customer vs Consumer $328 = 24% efficiency gap
-- ============================================

SELECT 
    segment,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct,
    ROUND(SUM(profit)/COUNT(DISTINCT customer_id), 2) AS profit_per_customer
FROM Superstore_data
GROUP BY segment
ORDER BY profit DESC;