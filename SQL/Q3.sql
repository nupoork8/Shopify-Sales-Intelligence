 
-- Question 3 — What do sales patterns look like before a product peaks?

WITH Benchmarks AS (
    SELECT
        AVG(Revenue_Per_Unit) AS overall_avg_rev_pu
    FROM shopify_products
),
PrePeak AS (
    SELECT
        p.Product_Name,
        p.Category,
        p.Trend_Score,
        p.Revenue_USD,
        p.Units_Sold,
        p.Revenue_Per_Unit,
        p.Trend_Source,
        ROUND(
            (p.Trend_Score / 100.0) * 0.5 +
            (p.Revenue_Per_Unit / NULLIF(b.overall_avg_rev_pu, 0)) * 0.5
        , 3) AS opportunity_score
    FROM shopify_products p
    CROSS JOIN Benchmarks b
    WHERE
        p.Trend_Score BETWEEN 80 AND 92
        AND p.Revenue_Per_Unit > b.overall_avg_rev_pu
)
SELECT TOP 25 *
FROM PrePeak
ORDER BY opportunity_score DESC;