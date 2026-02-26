
-- ============================================
-- QUERY 19: DISCOUNT CAP SCENARIO SIMULATION
-- PURPOSE: Model profit impact of capping discounts at 20%
-- FINDING: 20% cap increases profit 62% to $463,782, achieves 20.2% margin
-- ============================================


SELECT 
    'Cap at 20% Discount' AS scenario,
    SUM(profit) AS current_profit,
    ROUND(SUM(CASE WHEN discount > 0.2 THEN sales * 0.1158 ELSE profit END), 2) AS potential_profit,
    ROUND((SUM(CASE WHEN discount > 0.2 THEN sales * 0.1158 ELSE profit END)
           / SUM(sales)) * 100, 2) AS potential_margin_pct,
    ROUND((SUM(CASE WHEN discount > 0.2 THEN sales * 0.1158 ELSE profit END) 
           - SUM(profit)) / SUM(profit) * 100, 2) AS profit_improvement_pct
FROM Superstore_data;

