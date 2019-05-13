USE AdventureWorks2017

GO

DBCC DROPCLEANBUFFERS --clean slate for testing. DO NOT RUN IN PRODUCTION
DBCC FREEPROCCACHE() --clean slate for testing. DO NOT RUN IN PRODUCTION


SET STATISTICS IO ON
SET STATISTICS TIME ON

DROP TABLE IF EXISTS dbo.SalesReport

SELECT sal.SalesOrderID
		, sal.SalesOrderNumber
		, sal.SubTotal
		, sal.TotalDue
		, per.FirstName
		, per.LastName
INTO dbo.SalesReport
FROM Sales.SalesOrderHeader sal
	INNER JOIN 
		Person.Person per
			ON sal.SalesPersonID = per.BusinessEntityID
	CROSS JOIN
		sys.objects o1 --beef up the example table!
	

--5 seconds

GO


/**************************************************************************************************

REQUIREMENT:

Some silly analyst created the Sales Report table without the Person ID column. 
Go and retrieve the PersonID for each row!

**************************************************************************************************/

/*
* SOLUTION 1 - 
* for each row, loop through the Person.Person table and get the Person ID that matches
* the given FirstName and LastName combo. Uses a CURSOR to implement the loop
*/

DROP FUNCTION IF EXISTS dbo.GetPersonID_SVF_v1

GO
CREATE FUNCTION dbo.GetPersonID_SVF_v1	( @FirstName nvarchar(100), @Surname NVARCHAR(100))	RETURNS INT
	AS
BEGIN
	DECLARE @PersonID INT
	DECLARE @_FirstName nvarchar(100)
	DECLARE @_Surname NVARCHAR(100)
	DECLARE Persons CURSOR FOR 
		SELECT per.BusinessEntityID, per.FirstName, per.LastName
		FROM Person.Person per

	OPEN Persons
	FETCH NEXT FROM Persons INTO @PersonID, @_Firstname, @_Surname

	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @_FirstName = @FirstName
				AND @_Surname = @Surname
				BREAK
			ELSE
				FETCH NEXT FROM Persons INTO @PersonID, @_Firstname, @_Surname

		END 
	CLOSE Persons
	DEALLOCATE Persons

	RETURN @PersonID
END

GO



/*
* SOLUTION 2
* As above - but remove the CURSOR use a WHERE clause to perform the matching
* Allow SQL Server to work through the Person.Person table as it sees fit
*
*/

DROP FUNCTION IF EXISTS dbo.GetPersonID_SVF_v2

GO
--slightly better 
CREATE FUNCTION dbo.GetPersonID_SVF_v2	( @FirstName nvarchar(100), @Surname NVARCHAR(100))	RETURNS INT
	AS
BEGIN
	DECLARE @PersonID int
	SELECT @PersonID = per.BusinessEntityID
	FROM Person.Person per
	WHERE per.FirstName = @FirstName
		AND per.LastName = @Surname
	RETURN @PersonID
END

GO





/**********

TRIALLING THE FIRST TWO SOLUTIONS

**********/



--Inline Scalar Value function WITH CURSOR
SELECT	TOP 1000 sal.* 
		, dbo.GetPersonID_SVF_v1(sal.FirstName, sal.LastName) AS PersonID
FROM	dbo.SalesReport sal

/**************************************************************************************************
(1000 rows affected)
Table 'SalesReport'. Scan count 1, logical reads 10, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 30422 ms,  elapsed time = 31217 ms.
**************************************************************************************************/

--Inline Scalar Value function WITHOUT CURSOR
SELECT	TOP 1000 sal.* 
		, dbo.GetPersonID_SVF_v2(sal.FirstName, sal.LastName) AS PersonID
FROM	dbo.SalesReport sal
/**************************************************************************************************
(1000 rows affected)
Table 'SalesReport'. Scan count 1, logical reads 10, physical reads 0, read-ahead reads 5000, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 109 ms,  elapsed time = 193 ms.
**************************************************************************************************/

--Be brave, up the amount of work!
SELECT	TOP 500000 sal.* 
		, dbo.GetPersonID_SVF_v2(sal.FirstName, sal.LastName) AS PersonID
FROM	dbo.SalesReport sal
/**************************************************************************************************
(1000 rows affected)
Table 'SalesReport'. Scan count 1, logical reads 10, physical reads 0, read-ahead reads 5000, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 109 ms,  elapsed time = 193 ms.
**************************************************************************************************/





/************

Sadly, neither of the above are optimal.

Also, the execution plan hides the heavy lifting done by the scalar value function...

***********/





--Compare to "normal" query
SELECT	TOP  50000 sal.* 
		, per.BusinessEntityID as PersonID
FROM	dbo.SalesReport sal
	LEFT JOIN
		Person.Person per
			ON sal.FirstName = per.FirstName
			AND sal.LastName = per.LastName




/**************************************************************************************************
Table 'Person'. Scan count 982, logical reads 2104, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'SalesReport'. Scan count 1, logical reads 10, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 217 ms.
**************************************************************************************************/

SET STATISTICS IO OFF
SET STATISTICS TIME OFF

--WAIT...why did the logical reads go from 0 to LOTS???
--Compare again....

--Query 1

SELECT	TOP 1000 sal.* 
		, dbo.GetPersonID_SVF_v1(sal.FirstName, sal.LastName) AS PersonID
FROM	dbo.SalesReport sal

SELECT	TOP 500000 sal.* 
		, dbo.GetPersonID_SVF_v2(sal.FirstName, sal.LastName) AS PersonID
FROM	dbo.SalesReport sal

--Note: Person.Person table doesn't even appear in the execution plan - it is invisible! SQL 2019 brings some enhancements to this - more another day!

--Compare to execution plan on 
SELECT	TOP 500000 sal.* 
		, per.BusinessEntityID as PersonID
FROM	dbo.SalesReport sal
	LEFT JOIN
		Person.Person per
			ON sal.FirstName = per.FirstName
			AND sal.LastName = per.LastName


--But what about reusability?

--TVFs to the rescue!

GO

DROP FUNCTION IF EXISTS dbo.GetPersonID_SVF_v3
GO
-- INLINE table value function
CREATE FUNCTION dbo.GetPersonID_SVF_v3 ( @FirstName nvarchar(100), @Surname NVARCHAR(100) )
		RETURNS TABLE --important part #1
	AS

	RETURN
		SELECT per.BusinessEntityID AS PersonID
		FROM Person.Person per
		WHERE per.FirstName = @FirstName
		AND per.LastName = @Surname
GO



-- Call the function using APPLY
SELECT TOP 500000 sal.* 
		, per.PersonID
FROM dbo.SalesReport sal
	OUTER APPLY
		dbo.GetPersonID_SVF_v3(sal.FirstName, sal.Lastname) per

--Execution Plan now looks sensible, optimiser can parallise AND we can reuse. Everyone = Happy!!