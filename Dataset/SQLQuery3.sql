-- Create the table

CREATE TABLE dbo.shopify_products (
    Product_ID      NVARCHAR(50)   NOT NULL PRIMARY KEY,
    Product_Name    NVARCHAR(255)  NOT NULL,
    Category        NVARCHAR(100),
    Subcategory     NVARCHAR(100),
    Units_Sold      BIGINT,
    Revenue_USD     FLOAT,
    Price_Range_USD NVARCHAR(50),
    Trend_Score     FLOAT,
    Trend_Source    NVARCHAR(100),
    Notes           NVARCHAR(500)
);
GO