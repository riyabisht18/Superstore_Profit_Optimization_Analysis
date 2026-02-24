
-- ============================================
-- QUERY 18: PROFIT RECOVERY CALCULATION
-- PURPOSE: Calculate exact profit destroyed by high discounts
-- FINDING: $134,956 destroyed by >20% discounts = 47% of current profit
-- ============================================




SELECT 
    ROUND(SUM(profit), 2) AS current_total_profit,
    ROUND(SUM(CASE WHEN discount > 0.2 THEN 0 ELSE profit END), 2) AS profit_without_bad_sales,
    ROUND(SUM(CASE WHEN discount > 0.2 THEN profit ELSE 0 END), 2) AS money_lost_to_bad_discounts,
    ROUND(ABS(SUM(CASE WHEN discount > 0.2 THEN profit ELSE 0 END)) / 
          SUM(profit) * 100, 1) AS percent_improvement
FROM Superstore_data;
