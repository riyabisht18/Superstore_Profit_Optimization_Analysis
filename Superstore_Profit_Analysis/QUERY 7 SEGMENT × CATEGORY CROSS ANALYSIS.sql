
-- ============================================
-- QUERY 7: SEGMENT × CATEGORY CROSS ANALYSIS
-- PURPOSE: Identify which category hurts each segment
-- FINDING: Furniture destroys margin in ALL segments (1.79% to 3.50%)
-- ============================================

SELECT 
    segment,
    category,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct
FROM Superstore_data
GROUP BY segment, category
ORDER BY segment, margin_pct;