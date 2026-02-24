
-- ============================================
-- QUERY 15: STATE-LEVEL GEOGRAPHIC ANALYSIS
-- PURPOSE: Identify profitable vs loss-making states
-- FINDING: 10 states losing $97,821. Texas -$25,729 with 37% discount worst.
-- ============================================



SELECT TOP 10
    state,
    region,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct,
    ROUND(AVG(discount)*100, 2) AS avg_discount_pct
FROM Superstore_data
GROUP BY state, region
ORDER BY profit ASC;
