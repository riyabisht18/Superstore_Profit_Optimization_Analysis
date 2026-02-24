
-- ============================================
-- QUERY 16: TOP 10 CITIES BY PROFIT
-- PURPOSE: Identify best-performing cities
-- FINDING: Zero discount cities (Lafayette, Newark, Atlanta) have 40%+ margin
-- ============================================



SELECT TOP 10
    city,
    state,
    region,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct
FROM Superstore_data
GROUP BY city, state, region
ORDER BY profit DESC;
