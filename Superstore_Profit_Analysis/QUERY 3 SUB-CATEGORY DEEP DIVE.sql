
-- ============================================
-- QUERY 3: SUB-CATEGORY DEEP DIVE
-- PURPOSE: Identify specific products destroying profit
-- FINDING: Tables, Bookcases, Supplies have negative profit = $22K annual loss
-- ============================================


SELECT 
    sub_category,
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct
FROM Superstore_data
GROUP BY category, sub_category
ORDER BY profit ASC;