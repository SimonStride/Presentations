USE AdventureWorks2017
go

SELECT	soh.* 
		, ter.CountryRegionCode
		, ter.Name AS Territory_Name
		, shp.Name AS Ship_Method_Name
FROM	Sales.SalesOrderHeader soh
	LEFT JOIN
		Sales.SalesTerritory ter
			ON soh.TerritoryID = ter.TerritoryID
	LEFT JOIN
		Purchasing.ShipMethod shp
			ON soh.ShipMethodID = shp.ShipMethodID
;

	
SELECT	ter.[TerritoryID]
		, ter.[Name] as Territory_Name 
		, ter.[Group]
FROM	Sales.SalesTerritory ter
;

SELECT 'All' AS Group_Label
		, '*' AS Group_Value
UNION ALL
SELECT	DISTINCT
		ter.[Group] AS Group_Label
		, ter.[Group] AS Group_Value
FROM	Sales.SalesTerritory ter
;