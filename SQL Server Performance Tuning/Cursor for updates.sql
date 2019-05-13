

/**************************************************************************************************

Create a (one off) list of all sales people. 

On a regular basis this list must be update with their sales amounts


**************************************************************************************************/

--Clean Slate
DROP TABLE IF EXISTS  dbo.SalesPersonReport
GO
SELECT	per.BusinessEntityID AS PersonID
		, per.FirstName
		, per.LastName
		, CAST(NULL AS MONEY) AS TotalSales
INTO dbo.SalesPersonReport
FROM	Person.Person per

GO



-- Before
SELECT * FROM dbo.SalesPersonReport




/**************************************************************************************************

OPTION 1 - the "CS" way - foreach person, get their sales amount and store it

**************************************************************************************************/

DECLARE @PersonID INT
DECLARE SalesPerson CURSOR FOR
	SELECT TOP 1000 PersonID FROM dbo.SalesPersonReport per

OPEN SalesPerson

FETCH NEXT FROM SalesPerson INTO @PersonID

WHILE @@FETCH_STATUS = 0
	BEGIN

		UPDATE dbo.SalesPersonReport 
		SET TotalSales = (SELECT SUM(TotalDue) FROM Sales.SalesOrderHeader WHERE SalesPersonID = @PersonID)
		WHERE PersonID = @PersonID

	
		FETCH NEXT FROM SalesPerson INTO @PersonID
	END

CLOSE SalesPerson
DEALLOCATE SalesPerson



--runtime 5-6 mins in testing


/**************************************************************************************************

OPTION 2 - USE SUBQUERIES OR CTES

**************************************************************************************************/

UPDATE per
SET per.TotalSales = sal.SumTotalDue
FROM dbo.SalesPersonReport per
	LEFT JOIN
		(SELECT SalesPersonID, SUM(TotalDue) AS SumTotalDue FROM Sales.SalesOrderHeader GROUP BY SalesPersonID ) sal
		ON per.PersonID = sal.SalesPersonID

--or
;
WITH Update_CTE AS
	( 
		SELECT per.PersonID, per.FirstName, per.LastName, per.TotalSales, sal.SumTotalDue
		FROM dbo.SalesPersonReport per
			LEFT JOIN
				(SELECT SalesPersonID, SUM(TotalDue) AS SumTotalDue FROM Sales.SalesOrderHeader GROUP BY SalesPersonID ) sal
				ON per.PersonID = sal.SalesPersonID
	)

	UPDATE per
		SET per.TotalSales = per.SumTotalDue
		FROM Update_CTE per



/**************************************************************************************************

OPTION 3 - Temptables - what if the Sales data was BIGGER? And what if we needed other info?

**************************************************************************************************/

DBCC DROPCLEANBUFFERS
;
WITH Update_CTE AS
	( 
		SELECT per.PersonID, per.FirstName, per.LastName, per.TotalSales, sal.SumTotalDue, GlobalRankNo, NorthwestSales, NortheastSales
		FROM dbo.SalesPersonReport per
			LEFT JOIN
				(	SELECT SalesPersonID
							, SUM(TotalDue) AS SumTotalDue
							, RANK() OVER ( ORDER BY  SUM(TotalDue)) as GlobalRankNo
							, SUM(CASE WHEN ter.Name = 'Northwest' THEN TotalDue ELSE NULL END) AS NorthwestSales
							, SUM(CASE WHEN ter.Name = 'Northeast' THEN TotalDue ELSE NULL END) AS NortheastSales
							, SUM(CASE WHEN ter.Name = 'Central' THEN TotalDue ELSE NULL END) AS CentralSales
							, SUM(CASE WHEN ter.Name = 'Southwest' THEN TotalDue ELSE NULL END) AS SouthwestSales
							, SUM(CASE WHEN ter.Name = 'Southeast' THEN TotalDue ELSE NULL END) AS SoutheastSales
							, SUM(CASE WHEN ter.Name = 'Canada' THEN TotalDue ELSE NULL END) AS CanadaSales
							, SUM(CASE WHEN ter.Name = 'France' THEN TotalDue ELSE NULL END) AS FranceSales
							, SUM(CASE WHEN ter.Name = 'Germany' THEN TotalDue ELSE NULL END) AS GermanySales
							, SUM(CASE WHEN ter.Name = 'Australia' THEN TotalDue ELSE NULL END) AS AustraliaSales
							, SUM(CASE WHEN ter.Name = 'United Kingdom' THEN TotalDue ELSE NULL END) AS UKSales


					FROM Sales.SalesOrderHeader  ord
						LEFT JOIN Sales.SalesTerritory ter
							ON ord.TerritoryID = ter.TerritoryID
					CROSS JOIN sys.objects obj1 
					CROSS JOIN sys.objects obj2

				
				 GROUP BY SalesPersonID ) sal
				ON per.PersonID = sal.SalesPersonID
	)

	UPDATE per
		SET per.TotalSales = per.SumTotalDue
		FROM Update_CTE per

;


DROP TABLE IF EXISTS #temp
SELECT SalesPersonID, SUM(TotalDue) AS SumTotalDue INTO #temp FROM Sales.SalesOrderHeader 
					CROSS JOIN sys.objects obj1 
					CROSS JOIN sys.objects obj2
					--CROSS JOIN sys.objects obj3

				
				 GROUP BY SalesPersonID 
;

WITH Update_CTE AS
	( 
		SELECT per.PersonID, per.FirstName, per.LastName, per.TotalSales, sal.SumTotalDue
		FROM dbo.SalesPersonReport per
			LEFT JOIN
				#temp sal
				ON per.PersonID = sal.SalesPersonID
	)

	UPDATE per
		SET per.TotalSales = per.SumTotalDue
		FROM Update_CTE per