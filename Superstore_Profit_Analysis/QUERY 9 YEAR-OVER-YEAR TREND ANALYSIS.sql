


-- ============================================
-- QUERY 9: YEAR-OVER-YEAR TREND ANALYSIS
-- PURPOSE: Track revenue and profit growth over time
-- FINDING: 2017 profit growth (14.75%) lagged revenue growth (20.36%) = efficiency drop
-- ============================================

WITH yearly_data AS (
    SELECT 
        YEAR(order_date) AS year,
        COUNT(DISTINCT order_id) AS total_orders,
        COUNT(DISTINCT customer_id) AS total_customers,
        ROUND(SUM(sales), 2) AS revenue,
        ROUND(SUM(profit), 2) AS profit,
        ROUND((SUM(profit)/SUM(sales))*100, 1) AS margin_pct,
        ROUND(AVG(discount)*100, 2) AS avg_discount_pct
    FROM Superstore_data
    GROUP BY YEAR(order_date)
    
)
SELECT 
    year,
    revenue AS current_revenue,
    LAG(revenue) OVER(ORDER BY year) AS prev_revenue,
    ROUND((revenue - LAG(revenue) OVER(ORDER BY year)) / 
          LAG(revenue) OVER(ORDER BY year) * 100, 2) AS revenue_growth_pct,
    profit AS current_profit,
    LAG(profit) OVER(ORDER BY year) AS prev_profit,
    ROUND((profit - LAG(profit) OVER(ORDER BY year)) / 
          LAG(profit) OVER(ORDER BY year) * 100, 2) AS profit_growth_pct,
    LAG(margin_pct) OVER(ORDER BY year) AS prev_margin,
    margin_pct - LAG(margin_pct) OVER(ORDER BY year) AS margin_change
FROM yearly_data;
