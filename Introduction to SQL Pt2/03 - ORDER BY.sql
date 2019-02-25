

/*

ORDER BY

*/

--Show me the most "successful" months

SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID

GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
;








--clarify the business question!




--Show me the most successful months in terms of Total Amount on Purchase Orders raised
--ORDER BY SUM(poh.TotalDue)

SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SUM(poh.TotalDue)
;


--actually, that's upside down...

SELECT	YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SUM(poh.TotalDue) DESC
;



--ok, but I only need the first 10 most successful rows

SELECT	TOP 10	
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SUM(poh.TotalDue) DESC
;

SELECT	TOP 10	PERCENT
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SUM(poh.TotalDue) DESC
;

--because ORDER BY is evaluated LAST, it is "aware" of ColumnAliases

SELECT	TOP 10	
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SumOfTotalDue DESC --!!!
;


SELECT		
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	LEFT JOIN
		Purchasing.ShipMethod  AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY OrderYear
		, OrderMonth
;

