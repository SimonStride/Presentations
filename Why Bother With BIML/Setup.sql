/* create a DB for ETL_Stage before starting */

USE Demo
GO

/* destination schema in Stage*/
IF (SELECT COUNT(*) FROM sys.schemas WHERE name = 'Sales') = 0
OR (SELECT COUNT(*) FROM sys.schemas WHERE name = 'Sales2') = 0
OR (SELECT COUNT(*) FROM sys.schemas WHERE name = 'Audit') = 0
OR (SELECT COUNT(*) FROM sys.schemas WHERE name = 'Command') = 0
OR (SELECT COUNT(*) FROM sys.schemas WHERE name = 'Practise01') = 0
	BEGIN
		RAISERROR('Create the Schemas before starting', 15, 0);
		--CREATE SCHEMA Sales
		--CREATE SCHEMA Sales2
		--CREATE SCHEMA Audit
		--CREATE SCHEMA Command
		--CREATE SCHEMA Practise01
	END

GO

/**************************************************************************************************
Log table for example 2i, ii, iii, iv
Uses the 2012 Adventureworks Sales.SalesOrderDetail table

Removed all constraints & defaults
rowguid is a ROWGUIDCOL - want to preserve the values

**************************************************************************************************/

IF OBJECT_ID('Audit.BIML_Log') IS NOT NULL
	BEGIN
		DROP TABLE Audit.BIML_Log;
	END
;
CREATE TABLE Audit.BIML_Log (
			ID INT IDENTITY(1,1) PRIMARY KEY
			, Datestamp DATETIME DEFAULT GETDATE()
			, Description VARCHAR(100)
			)

EXEC sp_addextendedproperty @Name = 'Description'
							, @Value = 'Super basic table to prove concept of logging for BIML ExecSQL task'
							, @level0type = 'SCHEMA'
							, @level0name = 'Audit'
							, @level1type = 'TABLE'
							, @level1name = 'BIML_Log'


GO

/**************************************************************************************************
Stage table for example 3
Uses the 2012 Adventureworks Sales.SalesOrderDetail table

Removed all constraints & defaults
rowguid is a ROWGUIDCOL - want to preserve the values

**************************************************************************************************/
IF OBJECT_ID('[Sales].[SalesOrderDetail]') IS NOT NULL
	BEGIN
		DROP TABLE [Sales].[SalesOrderDetail];
	END
;
CREATE TABLE [Sales].[SalesOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint]  NULL,
	[ProductID] [int]  NULL,
	[SpecialOfferID] [int]  NULL,
	[UnitPrice] [money]  NULL,
	[UnitPriceDiscount] [money] NULL,
	[LineTotal] [MONEY] NULL,
	[rowguid] [NVARCHAR](36) NULL,
	[ModifiedDate] [datetime] NULL,

	SourceDatabase NVARCHAR(255) NULL,
	ExtractDate DATETIME NULL --additional field to capture the data transfer date
)
GO

EXEC sp_addextendedproperty @Name = 'Description'
							, @Value = 'Staging table for a copy of AdventureWorks2012 Sales.SalesOrderDetail'
							, @level0type = 'SCHEMA'
							, @level0name = 'Sales'
							, @level1type = 'TABLE'
							, @level1name = 'SalesOrderDetail'

GO



USE Practise_01
GO
IF OBJECT_ID('dbo.SourceDemo') IS NOT NULL
	BEGIN
		DROP TABLE dbo.SourceDemo
	END
;
CREATE TABLE dbo.SourceDemo ( ExampleINT INT)
;
WITH CTESource AS (	SELECT 1 AS ExampleINT
					UNION ALL
					SELECT ExampleINT + 1
					FROM CTESource
					WHERE ExampleINT <5000
					)
INSERT INTO dbo.SourceDemo
SELECT ExampleINT
FROM	CTESource OPTION(MAXRECURSION 5000)
USE Demo
GO
IF OBJECT_ID('Practise01.SourceDemo') IS NOT NULL
	BEGIN
		DROP TABLE Practise01.SourceDemo
	END
CREATE TABLE Practise01.SourceDemo ( ExampleINT INT
							, SourceDatabase NVARCHAR(255) NULL
							, ExtractDate DATETIME NULL --additional field to capture the data transfer date)
		)
;
IF OBJECT_ID('[Sales2].[SalesOrderDetail]') IS NOT NULL
	BEGIN
		DROP TABLE [Sales2].[SalesOrderDetail];
	END
;
CREATE TABLE [Sales2].[SalesOrderDetail] (
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint]  NULL,
	[ProductID] [int]  NULL,
	[SpecialOfferID] [int]  NULL,
	[UnitPrice] [money]  NULL,
	[UnitPriceDiscount] [money] NULL,
	[LineTotal] [MONEY] NULL,
	[rowguid] [NVARCHAR](36) NULL,
	[ModifiedDate] [datetime] NULL,

	SourceDatabase NVARCHAR(255) NULL,
	ExtractDate DATETIME NULL --additional field to capture the data transfer date
)
GO

/**************************************************************************************************

This section is used to programmatically create packages

**************************************************************************************************/ 

GO
IF OBJECT_ID('Command.Tables') IS NOT NULL
	BEGIN
		DROP TABLE Command.Tables
	END
IF OBJECT_ID('Command.Package') IS NOT NULL
	BEGIN
		DROP TABLE Command.Package
	END
IF OBJECT_ID('Command.Connection') IS NOT NULL
	BEGIN
		DROP TABLE Command.Connection
	END

CREATE TABLE Command.Package (
				PackageName VARCHAR(255) NOT NULL PRIMARY KEY
		)
CREATE TABLE Command.Connection (
		ConnectionName VARCHAR(255)	NOT NULL PRIMARY KEY
		, ConnectionString VARCHAR(MAX) NOT NULL
		)

CREATE TABLE Command.Tables (
		PackageName					VARCHAR(255) NOT NULL
		, SourceConnectionName		VARCHAR(255) NOT NULL
		, SourceSchemaName			VARCHAR(255) NOT NULL
		, SourceTableName			VARCHAR(255) NOT NULL
		, DestinationConnectionName	VARCHAR(255) NOT NULL
		, DestinationSchemaName		VARCHAR(255) NOT NULL
		, DestinationTableName		VARCHAR(255) NOT NULL
		)
GO
ALTER TABLE	Command.Tables	
	ADD CONSTRAINT fk_BIMLTable_Package FOREIGN KEY (PackageName)
	REFERENCES Command.Package (PackageName)
ALTER TABLE	Command.Tables	
	ADD CONSTRAINT fk_BIMLTable_SourceConnection FOREIGN KEY (SourceConnectionName)
	REFERENCES Command.Connection (ConnectionName)
ALTER TABLE	Command.Tables	
	ADD CONSTRAINT fk_BIMLTable_DestinationConnection FOREIGN KEY (DestinationConnectionName)
	REFERENCES Command.Connection (ConnectionName)
GO
INSERT INTO Command.Package (PackageName)
	VALUES	
			('4i Dynamic Package One')
			, ('4ii Dynamic Package Two')
			, ('4iii Dynamic Package Three')
			, ('4iv Dynamic Package Four')

INSERT INTO Command.Connection (ConnectionName, ConnectionString) 
	VALUES
			( 'OLE Adventureworks', 'Data Source=BUTTON-PC;Initial Catalog=AdventureWorks2012;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;')
			, ('OLE Target', 'Data Source=BUTTON-PC;Initial Catalog=Demo;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;')
			, ('OLE Practise 01', 'Data Source=BUTTON-PC;Initial Catalog=Practise_01;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;')

INSERT INTO Command.Tables
			( PackageName, SourceConnectionName, SourceSchemaName, SourceTableName
						, DestinationConnectionName, DestinationSchemaName, DestinationTableName	)
	VALUES ( '4i Dynamic Package One', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales', 'SalesOrderDetail'	)
			, ( '4i Dynamic Package One', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales2', 'SalesOrderDetail'	)
			, ( '4i Dynamic Package One', 'OLE Practise 01', 'dbo', 'SourceDemo'
								, 'OLE Target', 'Practise01', 'SourceDemo'	)
			, ( '4ii Dynamic Package Two', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales', 'SalesOrderDetail'	)
			, ( '4ii Dynamic Package Two', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales2', 'SalesOrderDetail'	)
			, ( '4iii Dynamic Package Three', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales', 'SalesOrderDetail'	)
			, ( '4iii Dynamic Package Three', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales2', 'SalesOrderDetail'	)
			, ( '4iv Dynamic Package Four', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales', 'SalesOrderDetail'	)
			, ( '4iv Dynamic Package Four', 'OLE Adventureworks', 'Sales', 'SalesOrderDetail'
								, 'OLE Target', 'Sales2', 'SalesOrderDetail'	)
GO


