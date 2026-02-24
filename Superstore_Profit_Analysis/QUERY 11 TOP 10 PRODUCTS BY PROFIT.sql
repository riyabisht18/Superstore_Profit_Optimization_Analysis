
-- ============================================
-- QUERY 11: TOP 10 PRODUCTS BY PROFIT
-- PURPOSE: Identify highest-margin products to promote
-- FINDING: Technology products dominate with 35% average margin
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
    ROUND(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER(), 2) AS sales_contribution_pct
FROM Superstore_data
GROUP BY product_name, category, sub_category
ORDER BY total_profit DESC;
