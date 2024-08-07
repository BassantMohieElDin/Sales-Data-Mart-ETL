USE AdventureWorksDWH2014
GO

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'FactSales')
  DROP TABLE FactSales;

CREATE TABLE FactSales
  (
     ProductKey    INT NOT NULL,
     CustomerKey   INT NOT NULL,
     TerritoryKey  INT NOT NULL,
     DateKey INT NOT NULL,
     SalesOrderId VARCHAR(50) NOT NULL,
     LineNumber    INT NOT NULL,
     Quantity       INT,
     UnitPrice     MONEY,
     UnitCost      MONEY,
     TaxAmount     MONEY,
     Freight        MONEY,
     ExtendedSales MONEY,
     ExtenedCost   MONEY,
     CreatedAt     DATETIME NOT NULL DEFAULT(Getdate()),
     CONSTRAINT pk_fact_sales PRIMARY KEY CLUSTERED (SalesOrderId, LineNumber),
     CONSTRAINT fk_fact_sales_dim_product FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
     CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
     CONSTRAINT fk_fact_sales_dim_territory FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey),
     CONSTRAINT fk_fact_sales_dim_date FOREIGN KEY (DateKey) REFERENCES  DimDate(DateKey)
  );

-- Create indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_product'
                  AND object_id = Object_id('FactSales'))
  DROP INDEX FactSales.fact_sales_dim_product;

CREATE INDEX fact_sales_dim_product
  ON FactSales(ProductKey);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_customer'
                  AND object_id = Object_id('FactSales'))
  DROP INDEX FactSales.fact_sales_dim_customer;

CREATE INDEX fact_sales_dim_customer
  ON FactSales(CustomerKey);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_territory'
                  AND object_id = Object_id('FactSales'))
  DROP INDEX FactSales.fact_sales_dim_territory;

CREATE INDEX fact_sales_dim_territory
  ON FactSales(TerritoryKey);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_date'
                  AND object_id = Object_id('FactSales'))
  DROP INDEX fact_sales.fact_sales_dim_date;

CREATE INDEX fact_sales_dim_date
  ON FactSales(DateKey); 