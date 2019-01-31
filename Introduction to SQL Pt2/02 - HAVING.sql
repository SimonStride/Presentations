
/*

HAVING  clause



*/

--without HAVING
SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, COUNT(TotalDue)				AS NumberOfTotalDue
		, COUNT(DISTINCT TotalDue)		AS UniqueTotalDue
		, SUM(TotalDue)					AS SumOfTotalDue
		, AVG(TotalDue)					AS AverageOfTotalDue
		, MIN(TotalDue)					AS MinimumOfTotalDue
		, MAX(TotalDue)					AS MaximumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
--WHERE clause removed
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
;


--Show me all months where more than 100 Purchase Orders were raised

SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, COUNT(TotalDue)				AS NumberOfTotalDue
		, COUNT(DISTINCT TotalDue)		AS UniqueTotalDue
		, SUM(TotalDue)					AS SumOfTotalDue
		, AVG(TotalDue)					AS AverageOfTotalDue
		, MIN(TotalDue)					AS MinimumOfTotalDue
		, MAX(TotalDue)					AS MaximumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
HAVING COUNT(*) > 1
;

--Other aggregates can be used in HAVING too
--Show me all months where the average Purchase Order total was more than 100,000

SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, COUNT(TotalDue)				AS NumberOfTotalDue
		, COUNT(DISTINCT TotalDue)		AS UniqueTotalDue
		, SUM(TotalDue)					AS SumOfTotalDue
		, AVG(TotalDue)					AS AverageOfTotalDue
		, MIN(TotalDue)					AS MinimumOfTotalDue
		, MAX(TotalDue)					AS MaximumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
HAVING AVG(TotalDue) > 100000
;



--Why will this fail?
SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
WHERE	COUNT(*) > 100
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
;
