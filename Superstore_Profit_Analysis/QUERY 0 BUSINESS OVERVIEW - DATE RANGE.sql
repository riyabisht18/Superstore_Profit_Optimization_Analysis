-- ============================================
-- QUERY 0: BUSINESS OVERVIEW - DATE RANGE
-- PURPOSE: Identify data timeframe for analysis context
-- FINDING: 4 years of data (2014-2017) with 5,009 orders from 793 customers
-- ============================================

USE Superstore_data

SELECT 
    MIN(Order_Date) AS first_order_date,
    MAX(Order_Date) AS recent_order_date,
    YEAR(MAX(Order_Date)) - YEAR(MIN(Order_Date)) + 1 AS data_period_years
FROM Superstore_data;