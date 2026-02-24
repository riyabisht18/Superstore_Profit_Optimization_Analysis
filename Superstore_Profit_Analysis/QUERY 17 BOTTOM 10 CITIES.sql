
-- ============================================
-- QUERY 17: BOTTOM 10 CITIES 
-- PURPOSE: Identify worst cities for intervention
-- FINDING: Philadelphia -$13,838 worst. Texas 3 cities = -$20K combined.
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
HAVING SUM(profit) < 0
ORDER BY profit ASC;
