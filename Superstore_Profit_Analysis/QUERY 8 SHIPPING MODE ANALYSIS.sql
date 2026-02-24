
-- ============================================
-- QUERY 8: SHIPPING MODE ANALYSIS
-- PURPOSE: Check if shipping method affects profitability
-- FINDING: Shipping not a major factor (12-14% margin across all modes)
-- ============================================

SELECT 
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(DATEDIFF(day, Order_Date, Ship_Date)), 1) AS avg_ship_days,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct
FROM Superstore_data
GROUP BY ship_mode
ORDER BY profit DESC;