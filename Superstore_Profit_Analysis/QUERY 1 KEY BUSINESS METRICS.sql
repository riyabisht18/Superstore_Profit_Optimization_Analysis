
-- ============================================
-- QUERY 1: KEY BUSINESS METRICS
-- PURPOSE: Establish baseline performance metrics
-- FINDING: 12.49% profit margin vs 20% industry standard = $172K improvement opportunity
-- ============================================
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_id) AS total_products,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS profit_margin_pct,
    ROUND(SUM(sales)/COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM Superstore_data;