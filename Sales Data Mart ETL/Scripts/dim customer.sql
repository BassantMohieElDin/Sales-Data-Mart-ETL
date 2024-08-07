USE AdventureWorksDWH2014
GO

-- Drop foregin Keys 
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_customer'
                  AND parent_object_id = Object_id('FactSales'))
  ALTER TABLE FactSales
    DROP CONSTRAINT fk_fact_sales_dim_customer;

-- Drop customer table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'DimCustomer')
  DROP TABLE DimCustomer
GO

CREATE TABLE DimCustomer
  (
     CustomerKey       INT NOT NULL IDENTITY(1, 1),
     CustomerId        INT NOT NULL,
     CustomerName      NVARCHAR(150),
     Address1           NVARCHAR(100),
     Address2           NVARCHAR(100),
     City               NVARCHAR(30),
     Phone              NVARCHAR(25),
	 -- MetaData
     SourceSystemCode TINYINT NOT NULL,
     StartDate         DATETIME NOT NULL DEFAULT (Getdate()),
     EndDate           DATETIME NULL,
     IsCurrent         TINYINT NOT NULL DEFAULT (1),
     CONSTRAINT pk_dim_customer PRIMARY KEY CLUSTERED (CustomerKey)
  );

-- Create foreign Keys
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'FactSales'
                  AND type = 'u')
  ALTER TABLE FactSales
    ADD CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey);

-- Insert unknown record
SET IDENTITY_INSERT DimCustomer ON

INSERT INTO DimCustomer
            (CustomerKey,CustomerId, CustomerName, Address1, Address2, City, Phone, SourceSystemCode,
			StartDate, EndDate, IsCurrent)
      
VALUES      (0, 0, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 0, '1900-01-01', NULL, 1 )

SET IDENTITY_INSERT DimCustomer OFF

-- Create indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_customer_customer_id'
                  AND object_id = Object_id('DimCustomer'))
  DROP INDEX DimCustomer.dim_customer_customer_id
GO

CREATE INDEX dim_customer_customer_id
  ON DimCustomer(CustomerId);

IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_customer_city'
                  AND object_id = Object_id('DimCustomer'))
  DROP INDEX DimCustomer.dim_customer_city
GO

CREATE INDEX dim_customer_city
  ON DimCustomer(City); 