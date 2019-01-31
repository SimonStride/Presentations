
/*


Query Inception

SQL is based on Relational Theory, so every operation on a relation results in a relation

A Query on a relation (e.g. a table) results in another relation (even though its no longer a table!)


*/

/*

e.g. Get the TOP 10 Months by TotalDue for two Shipping Methods, 'ZY - EXPRESS' and 'OVERNIGHT J-FAST'

*/


SELECT	TOP 10	
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	INNER JOIN --Changed
		( 
			SELECT	z.ShipMethodID
					, z.Name 
			FROM	Purchasing.ShipMethod AS z --
			WHERE	z.Name in ('ZY - EXPRESS', 'OVERNIGHT J-FAST')
		) AS shm	--notice two different aliases
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SumOfTotalDue DESC
;


-- Called "Non correlated" because it has no knowledge of the world outside the brackets


--the following attempt will fail
SELECT	TOP 10	
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	INNER JOIN
		( 
			SELECT	z.ShipMethodID, z.Name 
			FROM	Purchasing.ShipMethod AS z
			WHERE	z.Name in ('ZY - EXPRESS', 'OVERNIGHT J-FAST')
				AND z.ShipMethodID = poh.ShipMethodID					--Not valid in SQL Server
		) AS shm
			ON poh.ShipMethodID = shm.ShipMethodID
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SumOfTotalDue DESC


--sneak preview of CROSS APPLY

SELECT	TOP 10	
		YEAR(poh.OrderDate)				AS OrderYear
		, MONTH(poh.OrderDate)			AS OrderMonth
		, DATENAME(MONTH, poh.OrderDate) AS OrderMonthName
		, COUNT(*)						AS NumberOfRows
		, SUM(poh.TotalDue)				AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
	CROSS APPLY
		( 
			SELECT z.ShipMethodID, z.Name FROM Purchasing.ShipMethod AS z
			WHERE z.Name in ('ZY - EXPRESS', 'OVERNIGHT J-FAST')
				AND z.ShipMethodID = poh.ShipMethodID					--Now works
		) AS shm
GROUP BY YEAR(poh.OrderDate)
		, MONTH(poh.OrderDate)
		, DATENAME(MONTH, poh.OrderDate)
ORDER BY SumOfTotalDue DESC