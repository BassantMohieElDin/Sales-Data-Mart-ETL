USE AdventureWorksDWH2014
GO

-- Dropping foreign keys
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_territory'
                  AND parent_object_id = Object_id('FactSales'))
  ALTER TABLE FactSales
    DROP CONSTRAINT fk_fact_sales_dim_territory;

-- Drop territory
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  NAME = 'DimTerritory'
                  AND type = 'U')
  DROP TABLE DimTerritory
GO

-- Create territory table
CREATE TABLE DimTerritory
  (
     TerritoryKey      INT NOT NULL IDENTITY(1, 1),
     TerritoryId       INT NOT NULL,
     TerritoryName     NVARCHAR(50),
     TerritoryCountry  NVARCHAR(400),
     TerritoryGroup    NVARCHAR(50),
	 -- Metadata
     SourceSystemCode TINYINT NOT NULL,
     StartDate         DATETIME NOT NULL DEFAULT (Getdate()),
     EndDate           DATETIME,
     IsCurrent         TINYINT NOT NULL DEFAULT (1),
     CONSTRAINT pk_dim_territory PRIMARY KEY CLUSTERED (TerritoryKey)
  );

-- Insert unknown record
SET IDENTITY_INSERT DimTerritory ON

INSERT INTO DimTerritory
            (TerritoryKey,TerritoryId, TerritoryName, TerritoryCountry, TerritoryGroup, SourceSystemCode, 
			StartDate, EndDate, IsCurrent)
VALUES     (0, 0, 'Unknown', 'Unknown', 'Unknown', 0, '1900-01-01', NULL, 1)

SET IDENTITY_INSERT DimTerritory OFF

-- Create foreign key
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'FactSales')
  ALTER TABLE FactSales
    ADD CONSTRAINT fk_fact_sales_dim_territory FOREIGN KEY (TerritoryKey) REFERENCES DimTerritory(TerritoryKey);

-- Create indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_territory_territory_code'
                  AND object_id = Object_id('dim_territory'))
  DROP INDEX DimTerritory.dim_territory_territory_code;

CREATE INDEX dim_territory_territory_id
  ON DimTerritory(TerritoryId); 