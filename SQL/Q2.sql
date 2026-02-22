-- Question 2 — Are trending products more profitable or just popular?

SELECT
    Trend_Tier,
    COUNT(*)                                  AS product_count,
    ROUND(AVG(Revenue_Per_Unit), 2)           AS avg_rev_per_unit,
    ROUND(AVG(Revenue_USD), 0)                AS avg_total_revenue,
    ROUND(AVG(CAST(Units_Sold AS FLOAT)), 0)  AS avg_units_sold,
    ROUND(AVG(Trend_Score), 1)                AS avg_trend_score
FROM shopify_products
GROUP BY Trend_Tier
ORDER BY avg_rev_per_unit DESC;