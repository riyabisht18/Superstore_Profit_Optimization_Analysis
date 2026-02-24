
-- ============================================
-- QUERY 2: CATEGORY PERFORMANCE ANALYSIS
-- PURPOSE: Compare profitability across product categories
-- FINDING: Furniture 2.5% margin vs Technology 17.40% = $110K opportunity if fixed
-- ============================================

SELECT 
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct,
    ROUND(SUM(Sales)*100.0 / SUM(SUM(Sales)) OVER(), 2) AS sales_pct_contribution,
    ROUND(SUM(Profit)*100.0 / SUM(SUM(Profit)) OVER(), 2) AS profit_pct_contribution
FROM Superstore_data
GROUP BY category
ORDER BY profit DESC;