
-- ============================================
-- QUERY 10: MONTHLY SEASONALITY ANALYSIS
-- PURPOSE: Identify seasonal patterns and low-margin months
-- FINDING: November highest sales ($352K) but 10% margin = Black Friday damage
-- ============================================

SELECT 
    MONTH(Order_Date) AS month_num,
    DATENAME(MONTH, Order_Date) AS month_name,
    DATENAME(QUARTER, Order_Date) AS quarter,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / SUM(sales)) * 100.0, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct,
    ROUND(SUM(Sales)*100.0 / SUM(SUM(Sales)) OVER(), 2) AS sales_contribution_pct
FROM Superstore_data
GROUP BY 
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date),
    DATENAME(QUARTER, Order_Date)
ORDER BY MONTH(Order_Date);
