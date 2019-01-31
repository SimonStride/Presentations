USE AdventureWorks2017


/*

Shipping Method Analysis continued

*/

--Group By combined with Join


SELECT	shm.Name			AS ShipMethodName
		, COUNT(*)			AS NumberOfRows
		, SUM(TotalDue)		AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
GROUP BY shm.Name --NO ALIAS
;



SELECT	shm.Name						AS ShipMethodName
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
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
GROUP BY shm.Name --NO ALIAS
;




/* 

Ok, can I have this data for every month in 2014?

Answer: multiple columns for grouping!

*/


SELECT	MONTH(poh.OrderDate)			AS OrderMonth
		, shm.Name						AS ShipMethodName
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
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-12-31' AS DATE)
GROUP BY MONTH(poh.OrderDate)
		, shm.Name --NO ALIAS
;

--...oops, order month isn't good enough...


SELECT	MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, shm.Name						AS ShipMethodName
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
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-12-31' AS DATE)
GROUP BY MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate) --had to add this
		, shm.Name
;