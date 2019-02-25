USE AdventureWorks2017


--“How many PurchaseOrders were placed in January 2014?” 

SELECT	poh.PurchaseOrderID
		, poh.OrderDate
		, poh.ShipMethodID
		, poh.ShipDate
		, poh.SubTotal
		, poh.TaxAmt
		, poh.Freight
		, poh.TotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
;

--278 rows affected - solved right?












--right....?











/*
...but we forgot to ask for the TOTAL ££ of TotalDue 1

*/
--Option 1 - crack open a calculator or copy & paste into Excel

SELECT	poh.PurchaseOrderID
		, poh.OrderDate
		, poh.ShipDate
		, poh.SubTotal
		, poh.TaxAmt
		, poh.Freight
		, poh.TotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)

--Option 2...enter aggregates!!!!
SELECT	COUNT(*)			AS NumberOfRows
		, COUNT(ShipMethodID)			AS CountOfShippingMethod
		, SUM(poh.SubTotal) AS SumOfSubtotal
		, SUM(TotalDue)		AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)

--n.b. its good practise to alias your aggregate columns with sensible names for later reference
--		NumberOfRows COULD be "NumberOfPurchaseOfHeaders"



/*

Can we have this broken down by shipping method?

*/


SELECT	ShipMethodID
		, COUNT(*)			AS NumberOfRows
		, SUM(poh.SubTotal) AS SumOfSubtotal
		, SUM(TotalDue)		AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
GROUP BY ShipMethodID --This is the magic!


--ALL non aggregated columns MUST appear in a group by

SELECT	ShipMethodID
		, RevisionNumber	--Not Grouped and will cause a failure
		, COUNT(*)			AS NumberOfRows
		, SUM(poh.SubTotal) AS SumOfSubtotal
		, SUM(TotalDue)		AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
GROUP BY ShipMethodID --This is the magic!
;


SELECT	ShipMethodID
		, RevisionNumber	--Not Grouped and will cause a failure
		, COUNT(*)			AS NumberOfRows
		, SUM(poh.SubTotal) AS SumOfSubtotal
		, SUM(TotalDue)		AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
GROUP BY ShipMethodID --This is the magic!
		, RevisionNumber
;


SELECT	ShipMethodID
		, COUNT(RevisionNumber) AS CountOfRevisionNumber	--Not Grouped and will cause a failure
		, COUNT(*)			AS NumberOfRows
		, SUM(poh.SubTotal) AS SumOfSubtotal
		, SUM(TotalDue)		AS SumOfTotalDue
FROM	Purchasing.PurchaseOrderHeader AS poh
WHERE	poh.OrderDate BETWEEN CAST('2014-01-01' AS DATE) AND CAST('2014-01-31' AS DATE)
GROUP BY ShipMethodID --This is the magic!

;




--BBC Rules apply - other Aggregates are available!!!!
