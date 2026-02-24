

-- ============================================
-- QUERY 5: DISCOUNT BAND IMPACT ANALYSIS
-- PURPOSE: Quantify how different discount levels affect profit margin
-- FINDING: Sales with >30% discount have -48% margin (losing $48 per $100 sold)
-- ============================================

SELECT 
    CASE 
        WHEN discount = 0 THEN 'NO DISCOUNT'
        WHEN discount > 0 AND discount <= 0.1 THEN 'LOW 1-10%'
        WHEN discount > 0.1 AND discount <= 0.2 THEN 'MEDIUM 11-20%'
        WHEN discount > 0.2 AND discount <= 0.3 THEN 'HIGH 21-30%'
        WHEN discount > 0.3 THEN 'VERY HIGH > 30%'
        ELSE 'NULL'
    END AS discount_range,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND((SUM(profit)/SUM(sales))*100, 2) AS margin_pct
FROM Superstore_data
GROUP BY 
    CASE 
        WHEN discount = 0 THEN 'NO DISCOUNT'
        WHEN discount > 0 AND discount <= 0.1 THEN 'LOW 1-10%'
        WHEN discount > 0.1 AND discount <= 0.2 THEN 'MEDIUM 11-20%'
        WHEN discount > 0.2 AND discount <= 0.3 THEN 'HIGH 21-30%'
        WHEN discount > 0.3 THEN 'VERY HIGH > 30%'
        ELSE 'NULL'
    END
ORDER BY margin_pct DESC;
