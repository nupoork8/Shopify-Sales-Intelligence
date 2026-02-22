--  Verify — 
SELECT COUNT(*) AS total_rows FROM shopify_products;

-- Preview the data
SELECT TOP 10 * FROM shopify_products;

-- Confirm all columns have data
SELECT
    SUM(CASE WHEN Units_Sold  IS NULL THEN 1 ELSE 0 END) AS null_units,
    SUM(CASE WHEN Revenue_USD IS NULL THEN 1 ELSE 0 END) AS null_revenue,
    SUM(CASE WHEN Trend_Score IS NULL THEN 1 ELSE 0 END) AS null_trend
FROM shopify_products;
