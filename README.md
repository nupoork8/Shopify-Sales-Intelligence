# Shopify Sales Intelligence Project

> An end-to-end data analysis project using **T-SQL (SSMS)** and **Python** to extract business insights from 1,000 Shopify trending products in 2025.

---

## Project Overview

This project analyses a dataset of 1,000 Shopify trending products across 14 categories to answer three core business questions using SQL for data engineering and Python for statistical visualisation.

---

## Business Questions

- | Q1 | Which product categories drive the most revenue? 
- | Q2 | Are trending products more profitable or just popular? 
- | Q3 | What sales patterns look like before a product peaks? 

---

## Dataset

| Field | Detail |
|---|---|
| Source | Shopify Trending Products 2025 |
| Rows | 1,000 products |
| Columns | 10 (Product_ID, Product_Name, Category, Subcategory, Units_Sold, Revenue_USD, Price_Range_USD, Trend_Score, Trend_Source, Notes) |
| Categories | 14 (Fitness, Pet, Beauty & Skincare, Digital Goods, Baby, etc.) |

---

## Tools Used

- **SQL Server Management Studio (SSMS)** — data import, cleaning, computed columns, analysis queries
- **Python** — statistical analysis and visualisation
  - `pandas` — data manipulation
  - `matplotlib` — plotting
  - `seaborn` — statistical charts
  - `scipy` — Pearson correlation


---

### Analysis Queries

**Query 1 — Category Revenue (Q1)**
- Chained CTE to summarise revenue by category
- `RANK()` window function to rank categories by total revenue
- `SUM() OVER()` to calculate each category's % of total revenue

**Query 2 — Trend vs Profitability (Q2)**
- `RANK() OVER (PARTITION BY Trend_Tier)` to rank within each tier
- `PERCENT_RANK()` to show revenue percentile across all products
- Running cumulative revenue using `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`

**Query 3 — Pre-Peak Finder (Q3)**
- `CROSS JOIN` with Benchmarks CTE to compare each product against dataset averages
- Composite `opportunity_score` formula combining trend momentum and unit value
- Filtered to Trend Score 80–92 with above-average Revenue Per Unit


---

## Key Findings

### Q1 — Category Revenue
- **Fitness** leads total revenue at **$1.26B** across 137 products
- **Digital Goods** earns the highest average revenue per unit at **$108.25**
- High total revenue does not equal high unit value — volume and profitability tell different stories
- <img width="968" height="599" alt="image" src="https://github.com/user-attachments/assets/7175f3a0-f035-4d8b-9238-31af7145bdbc" />


### Q2 — Trending vs Profitable
- **Viral (95+)** products average **849,806 units sold** — massive volume
- But Viral products earn only **$32.65 revenue per unit** — the lowest of all tiers
- **Hot (85–94)** products earn **$106.45 per unit** — 3.2x more profitable per sale
- Pearson correlation between Trend Score and Revenue Per Unit: **r = -0.060**
- Conclusion: trend score has virtually no relationship with profitability
- <img width="951" height="429" alt="image" src="https://github.com/user-attachments/assets/71196d64-f698-4baf-8cc5-91fc8c5f0998" />


### Q3 — Pre-Peak Patterns
- **261 products** identified in the pre-peak sweet spot
- Sweet spot defined as: Trend Score 80–92 + Revenue Per Unit above dataset average ($104.55)
- Top candidate: **Eco Wearable Tech Case** — Trend Score 89.1, Revenue Per Unit $194.50
- Opportunity Score = (Trend Score / 100 × 0.5) + (Rev Per Unit / Avg × 0.5)
- <img width="971" height="540" alt="image" src="https://github.com/user-attachments/assets/3e0016fd-664a-41d1-9dab-7faaabad4d8c" />

##  Heatmap: Category vs Trend Source

<img width="774" height="522" alt="image" src="https://github.com/user-attachments/assets/d3a14229-9ffc-4f65-8222-7511fce83da3" />


## Correlation Result

<img width="771" height="662" alt="image" src="https://github.com/user-attachments/assets/95c68422-092e-46aa-a866-36eac29e3b29" />

```
Trend Score vs Revenue Per Unit: r = -0.060

Interpretation:
  r close to  0  = no relationship   <- this project result
  r close to  1  = strong positive
  r close to -1  = strong negative
```

## How to Run

### SQL
1. Open `sql/ssms_import_script.sql` in SSMS
2. Update the file path on the `BULK INSERT` line to match your local CSV location
3. Run the full script — creates database, table, imports 1,000 rows
4. Run analysis queries to generate Q1, Q2, Q3 result sets

### Python
```bash
# Install dependencies
pip install pandas matplotlib seaborn scipy

# Open notebook
jupyter notebook
```

---


**Business conclusion:** Chasing viral products based on trend score alone is not a reliable strategy for maximising profit per unit. The Hot tier (85–94) offers the best balance of demand and margin.

---

