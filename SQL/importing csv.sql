
-- Import CSV 

BULK INSERT dbo.shopify_products
FROM 'C:\Users\Admin03\analysis_project_sales\Shopify-Sales-Intelligence\Dataset\shopify_products_clean (1).csv'
WITH (
    FORMAT       = 'CSV',        -- Handles quoted fields correctly
    FIRSTROW     = 2,            -- Skip the header row
    FIELDQUOTE   = '"',          -- Fields are wrapped in double quotes
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = '\n',
    TABLOCK
);
GO