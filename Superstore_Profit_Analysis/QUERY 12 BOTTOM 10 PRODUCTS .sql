
-- ============================================
-- QUERY 12: BOTTOM 10 PRODUCTS 
-- PURPOSE: Identify products destroying profit to discontinue
-- FINDING: Cubify 3D printers -80% margin with 53% discount = $13K loss
-- ============================================

SELECT TOP 10
    product_name,
    category,
    sub_category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(quantity), 0) AS units_sold,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct
FROM Superstore_data
GROUP BY product_name, category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;
