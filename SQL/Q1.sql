
--  Question 1 — Which product categories drive the most revenue?

WITH CategoryRevenue AS (
	SELECT
	Category,
	COUNT(*) AS product_count,
	SUM(Revenue_USD) AS total_revenue,
	AVG(Revenue_USD) AS avg_revenue,
	ROUND(AVG(Revenue_Per_Unit), 2) AS avg_rev_per_unit
	FROM shopify_products
	GROUP BY Category
),

RevenueWithPct AS (
	SELECT *,
	ROUND(total_revenue / SUM(total_revenue) OVER () * 100, 2) AS pct_of_total
	FROM CategoryRevenue
)

SELECT 
    Category,
    product_count,
    ROUND(total_revenue / 1000000.0, 2) AS total_revenue_M,
    ROUND(avg_revenue / 1000.0, 1)      AS avg_revenue_K,
    avg_rev_per_unit,
    pct_of_total,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM RevenueWithPct
ORDER BY total_revenue DESC;