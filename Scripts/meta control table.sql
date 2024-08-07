USE  AdventureWorksDWH2014
GO

IF EXISTS(SELECT *
		  FROM sys.tables
		  WHERE type = 'u' AND name = 'MetaControlTable')
	DROP TABLE MetaControlTable;

CREATE TABLE MetaControlTable(
	ID INT IDENTITY(1, 1),
	SourceTable NVARCHAR(50) NOT NULL,
	LastLoadDate DateTime

);

INSERT INTO MetaControlTable
VALUES ('Sales Order Header', '1900-01-01');


			