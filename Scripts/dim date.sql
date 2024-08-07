USE AdventureWorksDWH2014
GO

-- Drop foreign key 
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_date'
                  AND parent_object_id = Object_id('FactSales'))
  ALTER TABLE FactSales
    DROP CONSTRAINT fk_fact_sales_dim_date;

-- Drop date table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'DimDate')
  DROP TABLE DimDate;

-- Create date tale
CREATE TABLE DimDate
  (
     DateKey            INT NOT NULL,
     FullDate           DATE NOT NULL,
     CalendarYear       INT NOT NULL,
     CalendarQuarter    INT NOT NULL,
     CalendarMonthNum  INT NOT NULL,
     CalendarMonthName NVARCHAR(15) NOT NULL
     CONSTRAINT pk_dim_date PRIMARY KEY CLUSTERED (DateKey)
  ); 