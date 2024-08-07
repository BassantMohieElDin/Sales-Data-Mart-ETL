USE AdventureWorksDWH2014
GO

-- Dropping foreign keys
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_product'
                  AND parent_object_id = Object_id('FactSales'))
  ALTER TABLE FactSales
    DROP CONSTRAINT fk_fact_sales_dim_product;

-- Drop product table
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  NAME = 'DimProduct'
                  AND type = 'U')
  DROP TABLE DimProduct
GO


-- Create product table
CREATE TABLE DimProduct
  (
     ProductKey         INT NOT NULL IDENTITY(1, 1),-- surrogate key
     ProductID         INT NOT NULL, --alternate key
     ProductName        NVARCHAR(50),
     ProductDescription NVARCHAR(400),
     ProductSubcategory NVARCHAR(50),
     ProductCategory    NVARCHAR(50),
     Color               NVARCHAR(15),
     ModelName          NVARCHAR(50),
     ReorderPoint       SMALLINT,
     StandardCost       MONEY,
     -- Metadata
     SourceSystemCode  TINYINT NOT NULL,
     -- SCD
     StartDate          DATETIME NOT NULL DEFAULT (Getdate()),
     EndDate            DATETIME,
     IsCurrent         TINYINT NOT NULL DEFAULT (1),
     CONSTRAINT pk_dim_product PRIMARY KEY CLUSTERED (ProductKey)
  );
  GO
-- Insert unknown record
SET IDENTITY_INSERT DimProduct ON

INSERT INTO DimProduct
            (ProductKey, ProductID, ProductName, ProductDescription, ProductSubcategory, ProductCategory,
             Color, ModelName, ReorderPoint, StandardCost, SourceSystemCode, StartDate, EndDate, IsCurrent)
VALUES      (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 0, 0, 0, '1900-01-01', NULL, 1)

SET IDENTITY_INSERT DimProduct OFF

-- Create foreign key
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'FactSales')
  ALTER TABLE FactSales
    ADD CONSTRAINT fk_fact_sales_dim_product FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey);

-- Create indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_product_product_id'
                  AND object_id = Object_id('DimProduct'))
  DROP INDEX DimProduct.dim_product_product_id;

CREATE INDEX dim_product_product_id
  ON DimProduct(ProductID);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_prodct_product_category'
                  AND object_id = Object_id('DimProduct'))
  DROP INDEX DimProduct.dim_product_product_category

CREATE INDEX dim_product_product_category
  ON DimProduct(ProductCategory); 